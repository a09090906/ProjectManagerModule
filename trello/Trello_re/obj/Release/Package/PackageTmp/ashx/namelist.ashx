<%@ WebHandler Language="C#" Class="namelist" %>

using System;
using System.Web;
using System.Data;

public class namelist : IHttpHandler {
    dal dal = new dal();
    public void ProcessRequest (HttpContext context) {
           DataTable dt= dal.new_name();
         string xml_sql = "";
        string xml_data = "";

        if (dt.Rows.Count > 0)
        {
            xml_sql += "<dataList>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                xml_sql += "<data_item>";
                xml_sql += "<u_guid>" + dt.Rows[i]["u_guid"].ToString() + "</u_guid>";
                xml_sql += "<u_name>" + dt.Rows[i]["u_name"].ToString() + "</u_name>";               
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