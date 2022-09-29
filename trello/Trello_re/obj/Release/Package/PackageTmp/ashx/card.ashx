<%@ WebHandler Language="C#" Class="card" %>

using System;
using System.Web;
using System.Data;

public class card : IHttpHandler {
    dal dal = new dal();
    common common = new common();
    public void ProcessRequest (HttpContext context) {
        string p_guid = (context.Request["p_guid"] != null) ? context.Request["p_guid"].ToString() : "";

        DataTable dt = dal.card_buid(p_guid);
        string xml_sql = "";
        string xml_data = "";

        if (dt.Rows.Count > 0)
        {
            xml_sql += "<dataList>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                xml_sql += "<data_item>";
                xml_sql += "<cd_guid>" + dt.Rows[i]["cd_guid"].ToString() + "</cd_guid>";
                xml_sql += "<cd_sub>" + dt.Rows[i]["cd_sub"].ToString() + "</cd_sub>";
                xml_sql += "<cd_title>" + dt.Rows[i]["cd_title"].ToString() + "</cd_title>";
                xml_sql += "<cd_host>" + common.GetEmpName(dt.Rows[i]["cd_host"].ToString()) + "</cd_host>";
                xml_sql += "<cd_text>" + dt.Rows[i]["cd_text"].ToString() + "</cd_text>";
                if (dt.Rows[i]["cd_start_time"].ToString() == "") {
                    xml_sql += "<cd_start_time>" +dt.Rows[i]["cd_start_time"].ToString()+ "</cd_start_time>";
                }
                else{
                    xml_sql += "<cd_start_time>" +DateTime.Parse(dt.Rows[i]["cd_start_time"].ToString()).ToString("yyyy-MM-dd")+ "</cd_start_time>";
                }
                if (dt.Rows[i]["cd_end_time"].ToString() == "") {
                    xml_sql += "<cd_end_time>" +dt.Rows[i]["cd_end_time"].ToString()+ "</cd_end_time>";
                }
                else{
                    xml_sql += "<cd_end_time>" +DateTime.Parse(dt.Rows[i]["cd_end_time"].ToString()).ToString("yyyy-MM-dd")+ "</cd_end_time>";
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