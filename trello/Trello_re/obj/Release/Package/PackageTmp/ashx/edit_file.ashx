<%@ WebHandler Language="C#" Class="edit_file" %>

using System;
using System.Web;
using System.Data;

public class edit_file : IHttpHandler {
    public dal dal = new dal();
    public void ProcessRequest(HttpContext context)
    {
        string guid = (context.Request["guid"] != null) ? context.Request["guid"].ToString() : "";
        DataTable dt = dal.edit_file(guid);
        string xml_sql = "";
        string xml_data = "";
        if (dt.Rows.Count > 0)

        {
            xml_sql += "<dataList>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                xml_sql += "<data_item>";
                xml_sql += "<file_parentid>" + dt.Rows[i]["file_parentid"].ToString() + "</file_parentid>";
                xml_sql += "<file_orgname>" + dt.Rows[i]["file_orgname"].ToString() + "</file_orgname>";
                xml_sql += "<file_encryname>" + dt.Rows[i]["file_encryname"].ToString() + "</file_encryname>";
                xml_sql += "<file_exten>" + dt.Rows[i]["file_exten"].ToString() + "</file_exten>";
                xml_sql += "</dataList>";
            }


            xml_data = "<root>" + xml_sql + "</root>";
            context.Response.Write(xml_data);

        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}