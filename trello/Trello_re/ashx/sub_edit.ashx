<%@ WebHandler Language="C#" Class="sub_edit" %>

using System;
using System.Web;
using System.Data;

public class sub_edit : IHttpHandler {
    dal dal = new dal();
    public void ProcessRequest (HttpContext context) {
        string guid = (context.Request["guid"] != null) ? context.Request["guid"].ToString() : "";

        DataTable dt = dal.edit_sub(guid);
        string xml_sql = "";
        string xml_data = "";
        if (dt.Rows.Count > 0)

        {
            xml_sql += "<dataList>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                xml_sql += "<data_item>";
                xml_sql += "<s_guid>" + dt.Rows[i]["s_guid"].ToString() + "</s_guid>";
                xml_sql += "<s_name>" + dt.Rows[i]["s_name"].ToString() + "</s_name>";
                xml_sql += "<s_text>" + dt.Rows[i]["s_text"].ToString() + "</s_text>";
                xml_sql += "<s_author>" + dt.Rows[i]["s_author"].ToString() + "</s_author>";
                if (dt.Rows[i]["s_start_time"].ToString() == "") {
                    xml_sql += "<s_start_time>" +dt.Rows[i]["s_start_time"].ToString()+ "</s_start_time>";
                }
                else{
                    xml_sql += "<s_start_time>" +DateTime.Parse(dt.Rows[i]["s_start_time"].ToString()).ToString("yyyy-MM-dd")+ "</s_start_time>";
                }
                if (dt.Rows[i]["s_end_time"].ToString() == "")
                {
                    xml_sql += "<s_end_time>" +dt.Rows[i]["s_end_time"].ToString()+ "</s_end_time>";
                }
                else
                {
                    xml_sql += "<s_end_time>" + DateTime.Parse(dt.Rows[i]["s_end_time"].ToString()).ToString("yyyy-MM-dd") + "</s_end_time>";
                }
                xml_sql += "</data_item>";
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