<%@ WebHandler Language="C#" Class="log" %>

using System;
using System.Web;
using System.Data;

public class log : IHttpHandler {

    public dal dal = new dal();
    public common common = new common();
    public void ProcessRequest (HttpContext context) {
        string guid = (context.Request["guid"] != null) ? context.Request["guid"].ToString() : "";
        string type = (context.Request["type"] != null) ? context.Request["type"].ToString() : "";
        DataTable dt = new DataTable();
        dt = dal.log_serch(guid,type);
        string xml_sql = "";
        string xml_data = "";
        if (dt.Rows.Count > 0)
        {
            xml_sql += "<dataList>";

            if (type == "P")//判斷專案,子項目,卡片
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    xml_sql += "<data_item>";
                    xml_sql += "<log_guid>" + dt.Rows[i]["log_guid"].ToString() + "</log_guid>";
                    xml_sql += "<log_finel_time>" + dt.Rows[i]["p_log_finel_time"].ToString() + "</log_finel_time>";
                    xml_sql += "<log_Modify>" + common.GetEmpName(dt.Rows[i]["p_log_Modify"].ToString()) + "</log_Modify>";
                    xml_sql += "</data_item>";
                }
            }
            else if (type == "S")
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    xml_sql += "<data_item>";
                    xml_sql += "<log_guid>" + dt.Rows[i]["log_guid"].ToString() + "</log_guid>";
                    xml_sql += "<log_finel_time>" + dt.Rows[i]["s_log_finel_time"].ToString() + "</log_finel_time>";
                    xml_sql += "<log_Modify>" + common.GetEmpName(dt.Rows[i]["s_log_Modify"].ToString()) + "</log_Modify>";
                    xml_sql += "</data_item>";
                }
            }
            else if (type == "C")
            {
                    for (int i = 0; i < dt.Rows.Count; i++)
                {
                    xml_sql += "<data_item>";
                    xml_sql += "<log_guid>" + dt.Rows[i]["log_guid"].ToString() + "</log_guid>";
                    xml_sql += "<log_finel_time>" + dt.Rows[i]["cd_log_finel_time"].ToString() + "</log_finel_time>";
                    xml_sql += "<log_Modify>" + common.GetEmpName(dt.Rows[i]["cd_log_Modify"].ToString()) + "</log_Modify>";
                    xml_sql += "</data_item>";
                }
            }
            xml_sql += "</dataList>";
        }
        xml_data = "<root>" + xml_sql + "</root>";
        context.Response.Write(xml_data);


    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}