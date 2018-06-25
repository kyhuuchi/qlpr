using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace DB
{
    public class DAC
    {
        SqlConnection conn;
        SqlDataAdapter da;
        DataTable dt;
        SqlCommand cmd;  
        public DAC()
        { }  
        public void connect()
        {

            try
            {
                if (conn == null)
                {
                    conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PRPOConnection"].ConnectionString);
                }
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
            }  
            catch(Exception ex)
            {
                throw ex;
            }
            

        }
        public void disconnect()
        {
            if(conn!=null && conn.State==ConnectionState.Open)
            {
                conn.Close();
            }
        }
        /*Thong tin xu ly cac lenh get data*/
        public DataTable get(string sql)
        {
            connect();
            try
            {
                da = new SqlDataAdapter(sql, conn);
                dt = new DataTable();
                da.Fill(dt);
            }
            catch
            {
                return null;
            }
            disconnect();
            return dt;
        }
        public DataTable get_by_procedure(string proc_name,SqlParameter[] sql_param)
        {

            connect();
            try
            {
                cmd = new SqlCommand(proc_name, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                if(sql_param.Length>0)
                {
                    cmd.Parameters.AddRange(sql_param);
                }
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
            }
            catch(Exception ex)
            {
                return null;
            }
            
            disconnect();
            return dt;
        }
       
    }
}