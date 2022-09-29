<%@ WebHandler Language="C#" Class="chat" %>

using System;
using System.Web;
using System.Data;

public class chat : IHttpHandler {
    dal dal = new dal();
    common common = new common();
    public void ProcessRequest (HttpContext context) {

        string c_guid = (context.Request["c_guid"] != null) ? context.Request["c_guid"].ToString() : "";

        DataTable dt = dal.chat_buid(c_guid);
        string xml_sql = "";
        string xml_data = "";

        if (dt.Rows.Count > 0)
        {
            xml_sql += "<dataList>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                xml_sql += "<data_item>";
                xml_sql += "<cc_guid>" + dt.Rows[i]["cc_guid"].ToString() + "</cc_guid>";
                xml_sql += "<cc_user>" + common.GetEmpName(dt.Rows[i]["cc_user"].ToString()) + "</cc_user>";
                xml_sql += "<cc_user_emp>" + dt.Rows[i]["cc_user"].ToString() + "</cc_user_emp>";
                xml_sql += "<cc_text>" + dt.Rows[i]["cc_text"].ToString() + "</cc_text>";
                if (dt.Rows[i]["cc_time"].ToString() == "") {
                    xml_sql += "<cc_time>" +dt.Rows[i]["cc_time"].ToString()+ "</cc_time>";
                }
                else{
                    xml_sql += "<cc_time>" +DateTime.Parse(dt.Rows[i]["cc_time"].ToString()).ToString("yyyy-MM-dd hh:mm")+ "</cc_time>";
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