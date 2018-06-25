using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace ThuVien
{
    public class ExportToExcelUtility
    {
        /// <summary>
        /// Convert the list to Data table.
        /// </summary>
        /// <param name="items">List</param>
        /// <returns>DataTable</returns>
        public static DataTable ToDataTable<T>(List<T> items)
        {
            DataTable dataTable = new DataTable(typeof(T).Name);
            PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            foreach (PropertyInfo prop in Props)
            {
                dataTable.Columns.Add(prop.Name);//Setting column names
            }
            foreach (T item in items)
            {
                var values = new object[Props.Length];
                for (int i = 0; i < Props.Length; i++)
                {
                    values[i] = Props[i].GetValue(item, null);//Insert values.
                }
                dataTable.Rows.Add(values);
            }
            return dataTable;
        }

        public static List<TSource> ToList<TSource>(DataTable dataTable) where TSource : new()
        {
            var dataList = new List<TSource>();

            const BindingFlags flags = BindingFlags.Public | BindingFlags.Instance | BindingFlags.NonPublic;
            var objFieldNames = (from PropertyInfo aProp in typeof(TSource).GetProperties(flags)
                                 select new
                                 {
                                     Name = aProp.Name,
                                     Type = Nullable.GetUnderlyingType(aProp.PropertyType) ??
                             aProp.PropertyType
                                 }).ToList();
            var dataTblFieldNames = (from DataColumn aHeader in dataTable.Columns
                                     select new
                                     {
                                         Name = aHeader.ColumnName,
                                         Type = aHeader.DataType
                                     }).ToList();
            var commonFields = objFieldNames.Intersect(dataTblFieldNames).ToList();

            foreach (DataRow dataRow in dataTable.AsEnumerable().ToList())
            {
                var aTSource = new TSource();
                foreach (var aField in commonFields)
                {
                    PropertyInfo propertyInfos = aTSource.GetType().GetProperty(aField.Name);
                    var value = (dataRow[aField.Name] == DBNull.Value) ?
                    null : dataRow[aField.Name]; //if database field is nullable
                    propertyInfos.SetValue(aTSource, value, null);
                }
                dataList.Add(aTSource);
            }
            return dataList;
        } 
    }

    public class ImportExcelUltility
    {
        public static DataTable GetDataTableFromExcel(string path, string SheetName, bool hasHeader = true)
        {
            int intRow = 0;
            int intCountColumn = 0;
            try
            {
                using (var pck = new OfficeOpenXml.ExcelPackage())
                {
                    using (var stream = File.OpenRead(path))
                    {
                        pck.Load(stream);
                    }
                    var ws = pck.Workbook.Worksheets[SheetName];
                    DataTable tbl = new DataTable();
                    foreach (var firstRowCell in ws.Cells[1, 1, 1, ws.Dimension.End.Column])
                    {
                        tbl.Columns.Add(hasHeader ? firstRowCell.Text : string.Format("Column {0}", firstRowCell.Start.Column));
                        intCountColumn++;
                    }
                    var startRow = hasHeader ? 2 : 1;
                    bool bRun = true;

                    for (int rowNum = startRow; rowNum <= ws.Dimension.End.Row; rowNum++)
                    {
                        int a = rowNum;
                        var wsRow = ws.Cells[rowNum, 1, rowNum, ws.Dimension.End.Column];
                        if (bRun == true)
                        {
                            if (rowNum - 2 > 0)
                            {
                                bRun = RowValueCheck(tbl.Rows[rowNum - 3]);
                                if (bRun)
                                {
                                    DataRow row = tbl.Rows.Add();
                                    foreach (var cell in wsRow)
                                    {
                                        if (cell.Start.Column - 1 < intCountColumn)
                                            row[cell.Start.Column - 1] = cell.Value;
                                    }
                                    intRow = rowNum;
                                }
                                else
                                {
                                    intRow = rowNum;
                                    continue;
                                }
                            }
                            else
                            {
                                DataRow row = tbl.Rows.Add();
                                foreach (var cell in wsRow)
                                {
                                    if (cell.Start.Column - 1 < intCountColumn)
                                        row[cell.Start.Column - 1] = cell.Value;
                                }
                                intRow = rowNum;
                            }
                        }
                        else
                        {
                            intRow = rowNum;
                            continue;
                        }
                    }
                    return tbl;
                }
            }
            catch (Exception ex)
            {
                int b = intRow;
                return null;
            }

        }

        public static bool RowValueCheck(DataRow row)
        {
            bool bFlag = false;
            for (int i = 0; i < row.Table.Columns.Count; i++)
            {
                if (!string.IsNullOrEmpty(row[i] + string.Empty))
                {
                    bFlag = true;
                }
            }
            return bFlag;
        }
    }
}
