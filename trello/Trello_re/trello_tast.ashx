<%@ WebHandler Language="C#" Class="trello_tast" %>

using System;
using System.Web;
using System.Data;

public class trello_tast : IHttpHandler {
    public dal dal = new dal();

    public void ProcessRequest (HttpContext context) {

        string pj = (context.Request["project"] != null) ? context.Request["project"].ToString() : "";

        DataTable dt = dal.new_project(pj);
        string xml_sql = "";
        string xml_data = "";

        if (dt.Rows.Count > 0)
        {
            xml_sql += "<dataList>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                xml_sql += "<data_item>";
                xml_sql += "<p_guid>" + dt.Rows[i]["p_guid"].ToString() + "</p_guid>";
                xml_sql += "<p_name>" + dt.Rows[i]["p_name"].ToString() + "</p_name>";
                xml_sql += "<p_text>" + dt.Rows[i]["p_text"].ToString() + "</p_text>";
                xml_sql += "<p_colar>" + dt.Rows[i]["p_colar"].ToString() + "</p_colar>";
                if (dt.Rows[i]["p_startdate"].ToString() == "") {
                    xml_sql += "<p_startdate>" +dt.Rows[i]["p_startdate"].ToString()+ "</p_startdate>";
                }
                else{
                    xml_sql += "<p_startdate>" +DateTime.Parse(dt.Rows[i]["p_startdate"].ToString()).ToString("yyyy-MM-dd")+ "</p_startdate>";
                }
                if (dt.Rows[i]["p_enddate"].ToString() == "")
                {
                    xml_sql += "<p_enddate>" +dt.Rows[i]["p_enddate"].ToString()+ "</p_enddate>";
                }
                else
                {
                    xml_sql += "<p_enddate>" + DateTime.Parse(dt.Rows[i]["p_enddate"].ToString()).ToString("yyyy-MM-dd") + "</p_enddate>";
                }
                xml_sql += "<p_host>" + dt.Rows[i]["p_host"].ToString() + "</p_host>";
                xml_sql += "<p_groups>" + dt.Rows[i]["p_groups"].ToString() + "</p_groups>";
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