using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;

/// <summary>
/// dal 的摘要描述
/// </summary>
public class dal
{
    public dal()
    {
    }

    public DataTable new_project(string sa)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        StringBuilder sb = new StringBuilder();
        sb.Append(@"  select [p_guid]
      ,[p_name]
      ,[p_date]
      ,SUBSTRING([p_text],1,200) as p_text
      ,[p_sa]
      ,[p_type]
      ,[p_colar]
      ,[p_startdate]
      ,[p_enddate]
      ,[p_host]
      ,[p_groups]
	   from  [Trello].[dbo].[project] 
		where p_hostempno=@sa"); //查詢專案 之後改成p_host
        oCmd.Parameters.AddWithValue("@sa", sa);
        oCmd.CommandText = sb.ToString();
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        DataTable ds = new DataTable();
        oda.Fill(ds);
        return ds;
    }
    //新增專案
    public void insert_project(string guid,string title,string text,string type,string colar,string date_start,
        string date_end,string host,string group,string allname,string all_enpno,string host_empno,string name_a,string empno_a) 
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        oCmd.CommandText = @"insert into [project] ([p_guid],[p_name],[p_date],[p_text],[p_sa],[p_type],p_colar,[p_startdate],[p_enddate],[p_host],[p_groups],[p_allname],[p_allenpno],[p_hostempno],[p_host_name_a],[p_host_empno_a]) 
                        values(@guid,@title,GETDATE(),@text,@host_empno,@type,@colar,@date_start,@date_end,@host,@group,@allname,@allenpno,@host_empno,@name_a,@empno_a)"; //666測試使用者 對應 user u_guid

        if (type == "ex1")
        {
            oCmd.CommandText += @"insert into sub(s_guid,s_project,s_name,s_date,s_author,[s_start_time],[s_end_time],[s_sort]) values(newid(),@guid,'待處理',getdate(),@host_empno,@date_start,@date_end," + 1 + ")";
            oCmd.CommandText += @"insert into sub(s_guid,s_project,s_name,s_date,s_author,[s_start_time],[s_end_time],[s_sort]) values(newid(),@guid,'處理中',getdate(),'@host_empno,@date_start,@date_end," + 2 + ")";
            oCmd.CommandText += @"insert into sub(s_guid,s_project,s_name,s_date,s_author,[s_start_time],[s_end_time],[s_sort]) values(newid(),@guid,'已結案',getdate(),@host_empno,@date_start,@date_end," + 3 + ") ";
        }
        if (type == "ex2")
        {
            oCmd.CommandText += @"insert into sub(s_guid,s_project,s_name,s_date,s_author,[s_start_time],[s_end_time],[s_sort]) values(newid(),@guid,'新問題',getdate(),@host_empno,@date_start,@date_end," + 1 + ")";
            oCmd.CommandText += @"insert into sub(s_guid,s_project,s_name,s_date,s_author,[s_start_time],[s_end_time],[s_sort]) values(newid(),@guid,'處理中',getdate(),@host_empno,@date_start,@date_end," + 2 + ")";
            oCmd.CommandText += @"insert into sub(s_guid,s_project,s_name,s_date,s_author,[s_start_time],[s_end_time],[s_sort]) values(newid(),@guid,'已完成',getdate(),@host_empno,@date_start,@date_end," + 3 + ")";
        }
        if (type == "ex3")
        {
            oCmd.CommandText += @"insert into sub(s_guid,s_project,s_name,s_date,s_author,[s_start_time],[s_end_time],[s_sort]) values(newid(),@guid,'進度0%',getdate(),@host_empno,@date_start,@date_end," + 1+")";
            oCmd.CommandText += @"insert into sub(s_guid,s_project,s_name,s_date,s_author,[s_start_time],[s_end_time],[s_sort]) values(newid(),@guid,'進度25%',getdate(),@host_empno,@date_start,@date_end," + 2+")";
            oCmd.CommandText += @"insert into sub(s_guid,s_project,s_name,s_date,s_author,[s_start_time],[s_end_time],[s_sort]) values(newid(),@guid,'進度50%',getdate(),@host_empno,@date_start,@date_end," + 3+")";
            oCmd.CommandText += @"insert into sub(s_guid,s_project,s_name,s_date,s_author,[s_start_time],[s_end_time],[s_sort]) values(newid(),@guid,'進度75%',getdate(),@host_empno,@date_start,@date_end," + 4+")";
            oCmd.CommandText += @"insert into sub(s_guid,s_project,s_name,s_date,s_author,[s_start_time],[s_end_time],[s_sort]) values(newid(),@guid,'進度100%',getdate(),@host_empno,@date_start,@date_end," + 5+")";
        }
       
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.Parameters.AddWithValue("@title", title);
        oCmd.Parameters.AddWithValue("@text", text);
        oCmd.Parameters.AddWithValue("@type", type);
        oCmd.Parameters.AddWithValue("@colar", colar);
        oCmd.Parameters.AddWithValue("@date_start", date_start);
        oCmd.Parameters.AddWithValue("@date_end", date_end);
        oCmd.Parameters.AddWithValue("@host", host);
        oCmd.Parameters.AddWithValue("@group", group);
        oCmd.Parameters.AddWithValue("@allname", allname);
        oCmd.Parameters.AddWithValue("@allenpno", all_enpno);
        oCmd.Parameters.AddWithValue("@host_empno", host_empno);
        oCmd.Parameters.AddWithValue("@name_a", name_a);
        oCmd.Parameters.AddWithValue("@empno_a", empno_a);
        oCmd.Connection.Open();
        oCmd.ExecuteNonQuery();
        oCmd.Connection.Close();
    }
    //刪除專案 (表)
    public void project_delete(string p_guid)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        oCmd.CommandText = @"delete from [project] where p_guid=@p_guid";
        oCmd.CommandText += @" delete from [sub] where s_project=@p_guid";
        oCmd.CommandText += @" update [file_table] set [file_status]='D' WHERE [file_parentid]=@p_guid";
        oCmd.CommandText += @" delete from  [Trello].[dbo].[case_user] where [c_project] = @p_guid";
        oCmd.CommandText += @" update [log_project] set [p_log_status]='D' WHERE [p_log_guid]=@p_guid";
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        oCmd.Parameters.AddWithValue("@p_guid", p_guid);
        oCmd.Connection.Open();
        oCmd.ExecuteNonQuery();
        oCmd.Connection.Close();
    }
    //編輯時 代出專案
    public DataTable project_edit(string guid) 
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        StringBuilder sb = new StringBuilder();
        sb.Append(@"select [p_guid],[p_name],[p_text],[p_type],p_colar,p_startdate,p_enddate,[p_host],[p_allname],[p_allenpno],[p_hostempno],[p_host_name_a],[p_host_empno_a] from  [Trello].[dbo].[project]  where [p_guid]=@guid"); 
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.CommandText = sb.ToString();
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        DataTable ds = new DataTable();
        oda.Fill(ds);
        return ds;
    }
    //新增專案log檔
    public void project_log_insert(string guid, string title, string text, string type, string colar, string date_start,
        string date_end, string host, string group, string allname, string all_enpno, string host_empno, string name_a, string empno_a,string up_or_add)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        if (up_or_add == "ADD")
        {
            oCmd.CommandText += @"insert into  [Trello].[dbo].[log_project]
 (
[log_guid]
,[p_log_guid]
,[p_log_name]
,[p_log_date]
,[p_log_text]
,[p_log_sa]
,[p_log_type]
,[p_log_colar]
,[p_log_startdate]
,[p_log_enddate]
,[p_log_host]
,[p_log_groups]
,[p_log_allname]
,[p_log_allenpno]
,[p_log_hostempno]
,[p_log_host_name_a]
,[p_log_host_empno_a]
,[p_log_finel_time]
,[p_log_Modify]
,[p_log_status]) 
 values(newid(),@guid,@title,GETDATE(),@text,@host_empno,@type,@colar,@date_start,@date_end,@host,@group,@allname,@allenpno,@host_empno,@name_a,@empno_a,GETDATE(),@host_empno,'Y') ";
        }
        else {
            oCmd.CommandText += @"insert into  [Trello].[dbo].[log_project]
([log_guid]
,[p_log_guid]
,[p_log_name]
,[p_log_text]
,[p_log_sa]
,[p_log_colar]
,[p_log_startdate]
,[p_log_enddate]
,[p_log_host]
,[p_log_allname]
,[p_log_allenpno]
,[p_log_hostempno]
,[p_log_host_name_a]
,[p_log_host_empno_a]
,[p_log_finel_time]
,[p_log_Modify]
,[p_log_status]) 
 values(newid(),@guid,@title,@text,@host_empno,@colar,@date_start,@date_end,@host,@allname,@allenpno,@host_empno,@name_a,@empno_a,GETDATE(),@host_empno,'Y') ";
        }
      
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.Parameters.AddWithValue("@title", title);
        oCmd.Parameters.AddWithValue("@text", text);
        oCmd.Parameters.AddWithValue("@type", type);
        oCmd.Parameters.AddWithValue("@colar", colar);
        oCmd.Parameters.AddWithValue("@date_start", date_start);
        oCmd.Parameters.AddWithValue("@date_end", date_end);
        oCmd.Parameters.AddWithValue("@host", host);
        oCmd.Parameters.AddWithValue("@group", group);
        oCmd.Parameters.AddWithValue("@allname", allname);
        oCmd.Parameters.AddWithValue("@allenpno", all_enpno);
        oCmd.Parameters.AddWithValue("@host_empno", host_empno);
        oCmd.Parameters.AddWithValue("@name_a", name_a);
        oCmd.Parameters.AddWithValue("@empno_a", empno_a);
        oCmd.Connection.Open();
        oCmd.ExecuteNonQuery();
        oCmd.Connection.Close();
    }
    
    //編輯專案
    public void project_update(string title,string text,string guid,string type,string colar,string start_date,string end_date,string host,string group, string allname, string all_enpno, string host_empno, string name_a,string empno_a) 
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        oCmd.CommandText = @"update  [Trello].[dbo].[project] 
  set 
  [p_name] =@title,
  [p_text]=@text,
  [p_type]=@type,
  [p_colar]=@colar,
  [p_startdate]=@start_date,
  [p_enddate]=@end_date,
  [p_host]=@host,
  [p_groups]=@group,
  [p_allname]=@allname,
  [p_allenpno]=@allenpno,
  [p_hostempno]=@hostempno,
  [p_host_name_a]=@name_a,
  [p_host_empno_a]=@empno_a
  where [p_guid]=@guid";
  
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        oCmd.Parameters.AddWithValue("@title", title);
        oCmd.Parameters.AddWithValue("@text", text);
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.Parameters.AddWithValue("@type", type);
        oCmd.Parameters.AddWithValue("@colar", colar);
        if (start_date == "")
        {
            oCmd.Parameters.AddWithValue("@start_date", DBNull.Value);
        }
        else
        {
            oCmd.Parameters.AddWithValue("@start_date", DateTime.Parse(start_date));
        }
        if (end_date == "")
        {
            oCmd.Parameters.AddWithValue("@end_date", DBNull.Value);
        }
        else
        {
            
            oCmd.Parameters.AddWithValue("@end_date", DateTime.Parse(end_date));
        }

        oCmd.Parameters.AddWithValue("@host", host);
        oCmd.Parameters.AddWithValue("@group", group);
        oCmd.Parameters.AddWithValue("@allname", allname);
        oCmd.Parameters.AddWithValue("@allenpno", all_enpno);
        oCmd.Parameters.AddWithValue("@hostempno", host_empno);
        oCmd.Parameters.AddWithValue("@name_a", name_a);
        oCmd.Parameters.AddWithValue("@empno_a", empno_a);

        oCmd.Connection.Open();
        oCmd.ExecuteNonQuery();
        oCmd.Connection.Close();
    }
    //子項目代入資料
    public DataSet new_sub(string p_guid) 
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        StringBuilder sb = new StringBuilder();
        sb.Append(@" SELECT * FROM	 [Trello].[dbo].[sub]  where s_project=@p_guid ORDER BY [s_sort] asc
select p_colar from  [Trello].[dbo].[project] where p_guid=@p_guid "); //查詢專案
        oCmd.Parameters.AddWithValue("@p_guid", p_guid);
        oCmd.CommandText = sb.ToString();
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        DataSet ds = new DataSet();
        oda.Fill(ds);
        return ds;
    }
    //新增子項目
    public void insert_sub(string s_guid,string p_guid,string name,string sa,string text,string start_time,string end_time,int sort) 
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        oCmd.CommandText = @"insert into sub ([s_guid],[s_project],[s_name],[s_date],[s_author],[s_text],[s_start_time],[s_end_time],[s_sort]) values(@s_guid,@p_guid,@name,getdate(),@sa,@text,@start_time,@end_time,@sort)";    
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        oCmd.Parameters.AddWithValue("@s_guid", s_guid);
        oCmd.Parameters.AddWithValue("@p_guid", p_guid);
        oCmd.Parameters.AddWithValue("@name", name);
        oCmd.Parameters.AddWithValue("@sa", sa);
        oCmd.Parameters.AddWithValue("@text", text);
        oCmd.Parameters.AddWithValue("@start_time", start_time);
        oCmd.Parameters.AddWithValue("@end_time", end_time);
        oCmd.Parameters.AddWithValue("@sort", sort);
        oCmd.Connection.Open();
        oCmd.ExecuteNonQuery();
        oCmd.Connection.Close();
    }
   //新增子項目 LOG
    public void sub_log(string s_guid, string p_guid, string name, string sa, string text, string start_time, string end_time,string emp)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        oCmd.CommandText = @"insert into [log_sub] (
       [log_guid]
      ,[s_log_guid]     
      ,[s_log_project]
      ,[s_log_name]
      ,[s_log_author]
      ,[s_log_text]
      ,[s_log_start_time]
      ,[s_log_end_time]
      ,[s_log_finel_time]
      ,[s_log_Modify]
      ,[s_log_status]) values(newid(),@s_guid,@p_guid,@name,@sa,@text,@start_time,@end_time,getdate(),@emp,'Y')";
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        oCmd.Parameters.AddWithValue("@s_guid", s_guid);
        oCmd.Parameters.AddWithValue("@p_guid", p_guid);
        oCmd.Parameters.AddWithValue("@name", name);
        oCmd.Parameters.AddWithValue("@sa", sa);
        oCmd.Parameters.AddWithValue("@text", text);
        oCmd.Parameters.AddWithValue("@start_time", start_time);
        oCmd.Parameters.AddWithValue("@end_time", end_time);
        oCmd.Parameters.AddWithValue("@emp", emp);
        oCmd.Connection.Open();
        oCmd.ExecuteNonQuery();
        oCmd.Connection.Close();
    }
    //使用者選單
    public DataTable new_name()
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        StringBuilder sb = new StringBuilder();
        sb.Append(@"select * from [user]"); 
        oCmd.CommandText = sb.ToString();
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        DataTable dt = new DataTable();
        oda.Fill(dt);
        return dt;
    }
    //編輯下載清單
    public DataTable edit_file(string guid)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        StringBuilder sb = new StringBuilder();
        sb.Append(@"SELECT * FROM  [Trello].[dbo].[file_table] where [file_parentid]=@guid and [file_status]='A'"); //
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.CommandText = sb.ToString();
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        DataTable dt = new DataTable();
        oda.Fill(dt);
        return dt;
    }
    //刪除檔案
    public void file_delete(string f_guid)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        oCmd.CommandText = @" update [file_table] set [file_status]='D' WHERE [file_encryname]=@f_guid";
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        oCmd.Parameters.AddWithValue("@f_guid", f_guid);
        oCmd.Connection.Open();
        oCmd.ExecuteNonQuery();
        oCmd.Connection.Close();
    }
    //加入成員
    public void group_join(string guid,string user,string sa,string name,string host,string hostname,string allname)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        oCmd.CommandText = @"insert into [case_user]([c_id],[c_project],[c_user],[c_sa],[c_name],[c_host],[c_hostname],[c_allname])
                                values(newid(),@guid,@user,@sa,@name,@host,@hostname,@allname)";        
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.Parameters.AddWithValue("@user", user);
        oCmd.Parameters.AddWithValue("@sa", sa);
        oCmd.Parameters.AddWithValue("@name", name);
        oCmd.Parameters.AddWithValue("@host", host);
        oCmd.Parameters.AddWithValue("@hostname", hostname);
        oCmd.Parameters.AddWithValue("@allname", allname);
        oCmd.Connection.Open();
        oCmd.ExecuteNonQuery();
        oCmd.Connection.Close();
    }
    //群組更新
    public void update_group_d(string p_guid)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        oCmd.CommandText = @"delete from  [Trello].[dbo].[case_user] where [c_project]=@p_guid";
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        oCmd.Parameters.AddWithValue("@p_guid", p_guid);
        oCmd.Connection.Open();
        oCmd.ExecuteNonQuery();
        oCmd.Connection.Close();
    }
    //刪除子項目
    public void delete_sub(string guid)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        oCmd.CommandText += @" delete from [sub] where s_guid=@guid";
        oCmd.CommandText += @" delete from [sub_user] where [su_sub_guid]=@guid";
        oCmd.CommandText += @" delete from [card] where [cd_sub]=@guid";
        oCmd.CommandText += @" update [card_chat]  set [cc_delete]='N' FROM [card] JOIN [card_chat] ON  [cc_card]=[cd_guid] WHERE [cd_sub]=@guid";
        oCmd.CommandText += @" update [log_sub] set [s_log_status]='D' WHERE [s_log_guid]=@guid";
        oCmd.CommandText += @" update [log_card] set [cd_log_status]='D' WHERE [cd_log_sub]=@guid";
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.Connection.Open();
        oCmd.ExecuteNonQuery();
        oCmd.Connection.Close();
    }
    //帶入子項目
    public DataTable edit_sub(string guid)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        StringBuilder sb = new StringBuilder();
        sb.Append(@"select * from  [Trello].[dbo].[sub]  where [s_guid]=@guid ");
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.CommandText = sb.ToString();
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        DataTable ds = new DataTable();
        oda.Fill(ds);
        return ds;
    }
    //編輯子項目
    public void update_sub(string guid,string title,string text,string host,string start_time,string end_time)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        oCmd.CommandText = @"update  [Trello].[dbo].[sub] 
  set 
  [s_name] =@title,
  [s_text]=@text,
  [s_author]=@host,
  [s_start_time]=@start_time,
  [s_end_time]=@end_time
  where [s_guid]=@guid";
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.Parameters.AddWithValue("@title", title);
        oCmd.Parameters.AddWithValue("@text", text);
        oCmd.Parameters.AddWithValue("@host", host);
        oCmd.Parameters.AddWithValue("@start_time", start_time);
        oCmd.Parameters.AddWithValue("@end_time", end_time);
        oCmd.Connection.Open();
        oCmd.ExecuteNonQuery();
        oCmd.Connection.Close();
    }
    //分享專案匯入
    public DataTable share_project(string c_user)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        StringBuilder sb = new StringBuilder();
        sb.Append(@"SELECT [p_guid]
      ,[p_name]
      ,[p_date]
      ,[p_text]
      ,[p_sa]
      ,[p_type]
      ,[p_colar]
      ,[p_startdate]
      ,[p_enddate]
      ,[p_host]
      ,[p_groups]
      ,[p_allname]
      ,[p_allenpno]
      ,[p_hostempno]
	  ,[c_user]
      ,[c_name]
  FROM [project]
  LEFT JOIN [case_user] ON [c_project] =[p_guid]
  WHERE   c_user=@c_user and (c_host='N' or c_host='A')
");
        oCmd.Parameters.AddWithValue("@c_user", c_user);
        oCmd.CommandText = sb.ToString();
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        DataTable ds = new DataTable();
        oda.Fill(ds);
        return ds;
    }
    //專案內部人員選單 
    public DataTable team_list (string guid)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        StringBuilder sb = new StringBuilder();
        sb.Append(@"select[c_name],[c_user] from[case_user] where c_project=@guid"); //查詢專案
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.CommandText = sb.ToString();
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        DataTable ds = new DataTable();
        oda.Fill(ds);
        return ds;
    }
    //事件呼叫內部人員選單
    public DataTable team_list_chang(string guid, string host)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        StringBuilder sb = new StringBuilder();
        sb.Append(@"select[c_name],[c_user] from[case_user] where c_project=@guid and c_user<>@host"); //查詢專案
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.Parameters.AddWithValue("@host", host);
        oCmd.CommandText = sb.ToString();
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        DataTable ds = new DataTable();
        oda.Fill(ds);
        return ds;
    }
    //帶出專案紀錄
    public DataTable log_serch(string guid,string type)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        StringBuilder sb = new StringBuilder();
        if (type=="P")
        {
         sb.Append(@"select 
                [log_guid]
                ,[p_log_finel_time]
                ,[p_log_Modify]
                FROM  [Trello].[dbo].[log_project]
                where [p_log_guid]=@guid and [p_log_status]='Y' order by [p_log_finel_time] asc"); //查詢專案
        }
        else if (type == "S")
        {
            sb.Append(@"select 
                 [log_guid]
                ,[s_log_finel_time]
                ,[s_log_Modify]
                FROM  [Trello].[dbo].[log_sub]
                where [s_log_guid]=@guid and [s_log_status]='Y' order by [s_log_finel_time] asc");

        }
        else if (type == "C")
        {
            sb.Append(@"select 
                 [log_guid]
                ,[cd_log_finel_time]
                ,[cd_log_Modify]
                FROM  [Trello].[dbo].[log_card]
                where [cd_log_guid]=@guid and [cd_log_status]='Y' order by [cd_log_finel_time] asc");
        }
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.CommandText = sb.ToString();
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        DataTable ds = new DataTable();
        oda.Fill(ds);
        return ds;
    }

    public DataSet log_view(string guid,string type,string id)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        StringBuilder sb = new StringBuilder();
        if (type == "P")
        {
            sb.Append(@"SELECT  
      [p_log_name]
      ,[p_log_date]
      ,[p_log_text]
      ,[p_log_sa]
      ,[p_log_type]
      ,[p_log_colar]
      ,[p_log_startdate]
      ,[p_log_enddate]    
        FROM [Trello].[dbo].[log_project]
        WHERE  [log_guid] =@guid and [p_log_status]='Y'
        
        declare @thisdatetime datetime;
        select @thisdatetime = [p_log_finel_time] from [log_project] where log_guid = @guid
        SELECT top 1 *
        FROM [Trello].[dbo].[log_project]
        WHERE  [p_log_guid] =@id and p_log_finel_time<@thisdatetime
        order by  [p_log_finel_time] desc


        ");
        }
        else if (type == "S")
        {
            sb.Append(@"SELECT        
         [s_log_name]
        ,[s_log_author]
        ,[s_log_text]
        ,[s_log_start_time]
        ,[s_log_end_time]
        FROM [Trello].[dbo].[log_sub]
        WHERE  [log_guid] =@guid and [s_log_status]='Y'
        
        declare @thisdatetime datetime;
        select @thisdatetime = [s_log_finel_time] from [log_sub] where log_guid = @guid
        SELECT top 1 *
        FROM [Trello].[dbo].[log_sub]
        WHERE  [s_log_guid] =@id and s_log_finel_time<@thisdatetime
        order by  [s_log_finel_time] desc

        ");
        }
        else if (type == "C")
        {
            sb.Append(@"SELECT      
      [cd_log_sub]
      ,[cd_log_title]
      ,[cd_log_user]
      ,[cd_log_host]
      ,[cd_log_text]
      ,[cd_log_start_time]
      ,[cd_log_end_time]
         FROM [Trello].[dbo].[log_card]
        WHERE  [log_guid] =@guid and [cd_log_status]='Y'

declare @thisdatetime datetime;
select @thisdatetime=cd_log_finel_time from log_card where log_guid =@guid
SELECT top 1 *
FROM [Trello].[dbo].[log_card]
WHERE  [cd_log_guid] =@id and cd_log_finel_time<@thisdatetime
order by cd_log_finel_time desc");
        }
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.Parameters.AddWithValue("@id", id);
        oCmd.CommandText = sb.ToString();
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        DataSet ds = new DataSet();
        oda.Fill(ds);
        return ds;
    }
    //子項目成員存入
    public void sub_group_insert(string s_guid,string name,string empno,string leadr)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        oCmd.CommandText = @"insert into [sub_user] ([su_guid],[su_sub_guid],[su_name],[su_empno],[su_leadr],[su_delete]) values(NEWID(),@s_guid,@name,@empno,@leadr,'N')";
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        oCmd.Parameters.AddWithValue("@s_guid", s_guid);
        oCmd.Parameters.AddWithValue("@name", name);
        oCmd.Parameters.AddWithValue("@empno", empno);
        oCmd.Parameters.AddWithValue("@leadr", leadr);
        oCmd.Connection.Open();
        oCmd.ExecuteNonQuery();
        oCmd.Connection.Close();
    }
    //子項成員目編輯 先刪除再加入
    public void sub_group_update(string guid)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        oCmd.CommandText = @"delete from [sub_user] where [su_sub_guid]=@guid";
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.Connection.Open();
        oCmd.ExecuteNonQuery();
        oCmd.Connection.Close();
    }
    //增加卡片
    public void card_insert(string guid,string p_guid, string s_guid, string title, string user,string host,string text,string cd_start_time,string cd_end_time,int sort)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        oCmd.CommandText = @"insert into [card]
      ([cd_guid]
      ,[cd_project]
      ,[cd_sub]
      ,[cd_title]
      ,[cd_user]
      ,[cd_host]
      ,[cd_text]
      ,[cd_time]
      ,[cd_start_time]
      ,[cd_end_time]
      ,[cd_sort]) values(@guid,@p_guid,@s_guid,@title,@user,@host,@text,getdate(),@cd_start_time,@cd_end_time,@sort)";
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.Parameters.AddWithValue("@p_guid", p_guid);
        oCmd.Parameters.AddWithValue("@s_guid", s_guid);
        oCmd.Parameters.AddWithValue("@title", title);
        oCmd.Parameters.AddWithValue("@user", user);
        oCmd.Parameters.AddWithValue("@host", host);
        oCmd.Parameters.AddWithValue("@text", text);
        oCmd.Parameters.AddWithValue("@cd_start_time", cd_start_time);
        oCmd.Parameters.AddWithValue("@cd_end_time", cd_end_time);
        oCmd.Parameters.AddWithValue("@sort", sort);
        oCmd.Connection.Open();
        oCmd.ExecuteNonQuery();
        oCmd.Connection.Close();
    }
    public void card_log_insert(string guid, string p_guid, string s_guid, string title, string user, string host, string text, string cd_start_time, string cd_end_time)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        oCmd.CommandText = @"insert into [log_card]
      ([log_guid]
      ,[cd_log_guid]
      ,[cd_log_project]
      ,[cd_log_sub]
      ,[cd_log_title]
      ,[cd_log_user]
      ,[cd_log_host]
      ,[cd_log_text]
      ,[cd_log_start_time]
      ,[cd_log_end_time]
      ,[cd_log_finel_time]
      ,[cd_log_Modify]
      ,[cd_log_status]) values(newid(),@guid,@p_guid,@s_guid,@title,@user,@host,@text,@cd_start_time,@cd_end_time,getdate(),@user,'Y')";
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.Parameters.AddWithValue("@p_guid", p_guid);
        oCmd.Parameters.AddWithValue("@s_guid", s_guid);
        oCmd.Parameters.AddWithValue("@title", title);
        oCmd.Parameters.AddWithValue("@user", user);
        oCmd.Parameters.AddWithValue("@host", host);
        oCmd.Parameters.AddWithValue("@text", text);
        oCmd.Parameters.AddWithValue("@cd_start_time", Convert.ToDateTime(cd_start_time));
        oCmd.Parameters.AddWithValue("@cd_end_time",Convert.ToDateTime(cd_end_time));
        oCmd.Connection.Open();
        oCmd.ExecuteNonQuery();
        oCmd.Connection.Close();
    }
    //匯出卡片
    public DataTable card_buid(string guid)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        StringBuilder sb = new StringBuilder();
        sb.Append(@"SELECT [cd_guid]
      ,[cd_project]
      ,[cd_sub]
      ,[cd_title]
      ,[cd_user]
      ,[cd_host]
      ,[cd_text]
      ,[cd_time]
      ,[cd_start_time]
      ,[cd_end_time]
      FROM [Trello].[dbo].[card]
      WHERE [cd_project]=@guid 
       order by [cd_sort] asc "); //查詢專案
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.CommandText = sb.ToString();
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        DataTable ds = new DataTable();
        oda.Fill(ds);
        return ds;
    }
    //刪除卡片
    public void card_delete(string guid)
    {       
            SqlCommand oCmd = new SqlCommand();
            oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            oCmd.CommandText += @" delete from [Trello].[dbo].[card] where [cd_guid]=@guid";
            oCmd.CommandText += @" update [card_chat] set [cc_delete]='Y' WHERE [cc_card]=@guid";
            oCmd.CommandText += @" update [file_table] set [file_status]='D' WHERE [file_parentid]=@guid";
            oCmd.CommandType = CommandType.Text;
            SqlDataAdapter oda = new SqlDataAdapter(oCmd);
            oCmd.Parameters.AddWithValue("@guid", guid);
            oCmd.Connection.Open();
            oCmd.ExecuteNonQuery();
            oCmd.Connection.Close();
        
    }
    //檢視卡片
    public DataTable card_veiw(string guid)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        StringBuilder sb = new StringBuilder();
        sb.Append(@"SELECT *
      FROM [Trello].[dbo].[card]
      WHERE [cd_guid]=@guid "); //查詢專案
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.CommandText = sb.ToString();
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        DataTable ds = new DataTable();
        oda.Fill(ds);
        return ds;
    }
    //卡片編輯
    public void card_update(bool ex,string sub,string guid,string title,string host,string text,string start_time,string end_time)
    {
        if (ex == true)
        {
            SqlCommand oCmd = new SqlCommand();
            oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            oCmd.CommandText = @"  update  [Trello].[dbo].[card]  set   
[cd_sub]=@sub	   
,[cd_title]=@title
      ,[cd_host]=@host
      ,[cd_text]=@text
      ,[cd_start_time]=@start_time
      ,[cd_end_time] =@end_time  
    where [cd_guid]=@guid";
            oCmd.CommandType = CommandType.Text;
            SqlDataAdapter oda = new SqlDataAdapter(oCmd);
            oCmd.Parameters.AddWithValue("@sub", sub);
            oCmd.Parameters.AddWithValue("@guid", guid);
            oCmd.Parameters.AddWithValue("@title", title);
            oCmd.Parameters.AddWithValue("@host", host);
            oCmd.Parameters.AddWithValue("@text", text);
            oCmd.Parameters.AddWithValue("@start_time", start_time);
            oCmd.Parameters.AddWithValue("@end_time", end_time);
            oCmd.Connection.Open();
            oCmd.ExecuteNonQuery();
            oCmd.Connection.Close();
        }
        else
        {
            SqlCommand oCmd = new SqlCommand();
            oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            oCmd.CommandText = @"  update  [Trello].[dbo].[card]  set    
       [cd_title]=@title
      ,[cd_host]=@host
      ,[cd_text]=@text
      ,[cd_start_time]=@start_time
      ,[cd_end_time] =@end_time  
        where [cd_guid]=@guid";
            oCmd.CommandType = CommandType.Text;
            SqlDataAdapter oda = new SqlDataAdapter(oCmd);
            oCmd.Parameters.AddWithValue("@guid", guid);
            oCmd.Parameters.AddWithValue("@title", title);
            oCmd.Parameters.AddWithValue("@host", host);
            oCmd.Parameters.AddWithValue("@text", text);
            oCmd.Parameters.AddWithValue("@start_time", start_time);
            oCmd.Parameters.AddWithValue("@end_time", end_time);
            oCmd.Connection.Open();
            oCmd.ExecuteNonQuery();
            oCmd.Connection.Close();

        }
      
    }
    //卡片移動
    public void card_move(string s_guid,string cd_guid)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        oCmd.CommandText = @"update  [Trello].[dbo].[card]  set  [cd_sub] =@s_guid  where [cd_guid]=@cd_guid";
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        oCmd.Parameters.AddWithValue("@s_guid", s_guid);
        oCmd.Parameters.AddWithValue("@cd_guid", cd_guid);
        oCmd.Connection.Open();
        oCmd.ExecuteNonQuery();
        oCmd.Connection.Close();

    }
    //聊天內容載入
    public DataTable chat_buid(string guid)
    {

        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        StringBuilder sb = new StringBuilder();
        sb.Append(@"SELECT [cc_guid]
      ,[cc_user]
      ,[cc_text]
      ,[cc_time]
       FROM [Trello].[dbo].[card_chat]      
      WHERE [cc_card]=@guid and [cc_delete]='N' order by [cc_time] asc"); //查詢專案
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.CommandText = sb.ToString();
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        DataTable ds = new DataTable();
        oda.Fill(ds);
        return ds;
    }
    //聊天送出
    public void chat_insert(string guid,string user,string text)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        oCmd.CommandText = @"insert into [card_chat]
      ([cc_guid]
      ,[cc_card]
      ,[cc_user]
      ,[cc_text]
      ,[cc_time]
      ,[cc_delete]) values(newid(),@guid,@user,@text,GETDATE(),'N')";
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.Parameters.AddWithValue("@user", user);
        oCmd.Parameters.AddWithValue("@text", text);
        oCmd.Connection.Open();
        oCmd.ExecuteNonQuery();
        oCmd.Connection.Close();
    }
    //編輯時 帶出選單勾選
    public DataSet team_list_edit(string guid)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        StringBuilder sb = new StringBuilder();
        sb.Append(@" SELECT  [su_guid]
      ,[su_sub_guid]
      ,[su_name]
      ,[su_empno]
      ,[su_leadr]
      ,[su_delete]
  FROM [Trello].[dbo].[sub_user]
  WHERE [su_sub_guid]=@guid  AND [su_leadr]='Y' AND [su_delete]='N'
  
SELECT  [su_guid]
      ,[su_sub_guid]
      ,[su_name]
      ,[su_empno]
      ,[su_leadr]
      ,[su_delete]
  FROM [Trello].[dbo].[sub_user]
  WHERE [su_sub_guid]=@guid AND [su_leadr]<>'Y' AND [su_delete]='N'
"); //查詢專案
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.CommandText = sb.ToString();
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        DataSet ds = new DataSet();
        oda.Fill(ds);
        return ds;
    }
    //傳回卡片上層子項目及專案guid
    public DataTable select_card_guid(string guid)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        StringBuilder sb = new StringBuilder();
            sb.Append(@" select * from [card] where  [cd_guid]=@guid"); //查詢專案   
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.CommandText = sb.ToString();
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        DataTable ds = new DataTable();
        oda.Fill(ds);
        return ds;
    }

    //卡片所屬子項目 紀錄查詢
    public string card_sub (string guid)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        StringBuilder sb = new StringBuilder();
        sb.Append(@" select * from [sub] where  [s_guid]=@guid"); //查詢專案   
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.CommandText = sb.ToString();
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        DataTable ds = new DataTable();
        oda.Fill(ds);
        string name = "";
        if (ds.Rows.Count > 0)
        {
            name= ds.Rows[0]["s_name"].ToString();
        }
        else
        {
            name = "子項目已刪除";
        }

        return name;
    }
    //計算專案子項目數量
    public int sub_sort(string guid)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        StringBuilder sb = new StringBuilder();
        sb.Append(@"SELECT COUNT([s_guid]) FROM [sub] where [s_project] =@guid"); //查詢專案   
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.CommandText = sb.ToString();
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        DataTable ds = new DataTable();
        oda.Fill(ds);
        int sort =int.Parse(ds.Rows[0].ItemArray[0].ToString());
        return sort;
    }
    //子項目排序
    public void sub_chenge(string guid,int sort)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        oCmd.CommandText = @"update [sub] set [s_sort]=@sort where [s_guid] =@guid";
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.Parameters.AddWithValue("@sort", sort);
        oCmd.Connection.Open();
        oCmd.ExecuteNonQuery();
        oCmd.Connection.Close();
    }
    //計算卡片數量
    public int card_sort(string guid)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        StringBuilder sb = new StringBuilder();
        sb.Append(@"SELECT COUNT([cd_guid]) FROM [card] where [cd_sub] =@guid"); //查詢專案   
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.CommandText = sb.ToString();
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        DataTable ds = new DataTable();
        oda.Fill(ds);
        int sort = int.Parse(ds.Rows[0].ItemArray[0].ToString());
        return sort;
    }
    //卡片排序
    public void card_chenge(string guid, int sort)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        oCmd.CommandText = @"update [card] set [cd_sort]=@sort where [cd_guid] =@guid";
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.Parameters.AddWithValue("@sort", sort);
        oCmd.Connection.Open();
        oCmd.ExecuteNonQuery();
        oCmd.Connection.Close();
    }

    public DataSet com_serch(string empno, string name)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        StringBuilder sb = new StringBuilder();

        sb.Append(@"
SELECT  *
 FROM [common].[dbo].[comper]
WHERE com_empstatus ='A' and com_cname like '%'+ @name+ '%'  ");
        
      
        oCmd.Parameters.AddWithValue("@empno",empno);
        oCmd.Parameters.AddWithValue("@name", name);
        oCmd.CommandText = sb.ToString();
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        DataSet ds = new DataSet();
        oda.Fill(ds);
        return ds;

    }

    //判斷是否為範例3(選單)
    public string sub_ex(string guid)
    {
        string ex;
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        StringBuilder sb = new StringBuilder();
        sb.Append(@" select * from project where [p_guid] =@guid"); //查詢專案
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.CommandText = sb.ToString();
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        DataTable dt = new DataTable();
        oda.Fill(dt);
       if (dt.Rows[0]["p_type"].ToString().Trim() == "ex3")
        {
            ex = dt.Rows[0]["p_type"].ToString().Trim();
        }
        else
        {
            ex = "";
        }
        return ex;
    }

    //回傳子項目選單
    public DataTable sub_list_ex(string guid)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        StringBuilder sb = new StringBuilder();
        sb.Append(@" select * from [sub] where s_project=@guid"); //查詢專案
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.CommandText = sb.ToString();
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        DataTable ds = new DataTable();
        oda.Fill(ds);
        return ds;
    }
    /// <summary>
    /// 判斷是否為進度追蹤
    /// </summary>
    /// <param 卡片guid="guid"></param>
    /// <returns>判斷是否為進度追蹤</returns>
    public bool sub_list_bool(string guid)
    {
        SqlCommand oCmd = new SqlCommand();
        oCmd.Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        StringBuilder sb = new StringBuilder();
        sb.Append(@" SELECT  p_type
  FROM [Trello].[dbo].[card]
  left join project as pj
  on p_guid=cd_project
  where cd_guid=@guid"); //查詢專案
        oCmd.Parameters.AddWithValue("@guid", guid);
        oCmd.CommandText = sb.ToString();
        oCmd.CommandType = CommandType.Text;
        SqlDataAdapter oda = new SqlDataAdapter(oCmd);
        DataTable dt = new DataTable();
        oda.Fill(dt);
        string type = (dt.Rows[0]["p_type"].ToString().Trim() != null) ? dt.Rows[0]["p_type"].ToString().Trim() : ""; ; 
        if (type == "ex3")
        {
            return true;
        }
        else
        {
            return false;
        }
        
    }

    public bool other_login(string mail, string password)
    {

        return true;
    }



}
    
