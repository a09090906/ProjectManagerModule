<%@ WebHandler Language="C#" Class="trello_sub" %>

using System;
using System.Web;
using System.Data;

public class trello_sub : IHttpHandler {
    dal dal = new dal();
    common common = new common();
    public void ProcessRequest (HttpContext context) {
        string project = (context.Request["project"] != null) ? context.Request["project"].ToString() : "";
        DataSet ds =  dal.new_sub(project);
        string xml_sql = "";
        string xml_data = "";

        if (ds.Tables[0].Rows.Count > 0 |ds.Tables[1].Rows.Count > 0)
        {
            string colorcode = string.Empty;
            colorcode = ds.Tables[1].Rows[0]["p_colar"].ToString();
            xml_sql += "<p_colar>" + colorcode + "</p_colar>";
            xml_sql += "<dataList>";
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                xml_sql += "<data_item>";
                xml_sql += "<s_guid>" + ds.Tables[0].Rows[i]["s_guid"].ToString() + "</s_guid>";
                xml_sql += "<s_name>" + ds.Tables[0].Rows[i]["s_name"].ToString() + "</s_name>";                
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