using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ThuVien
{
    public class TableUtility
    {

    }



    public class Pager
    {
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
        public int RecordCount { get; set; }
    }

    public class ObjectReturn
    {
        public object Datas { get; set; }
        public Pager Pagers { get; set; }
    }

    public class SelectedData
    {
        public string ColumnName { get; set; }
        public string ColumnType { get; set; }
        public string SearchKey { get; set; }
        public string Sort { get; set; }
        public IEnumerable<string> SelectedValue { get; set; }
    }

    public class SelectedDataCollection
    {
        public IEnumerable<SelectedData> DataCollection { get; set; }
    }
    public class FilterValueSet
    {
        public string Id { get; set; }
        public string Value { get; set; }
    }
}