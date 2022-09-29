<%@ WebHandler Language="C#" Class="team_list" %>

using System;
using System.Web;
using System.Data;

public class team_list : IHttpHandler {
    dal dal = new dal();
    common common = new common();
    public void ProcessRequest (HttpContext context) {
        string project = (context.Request["project"] != null) ? context.Request["project"].ToString() : "";
        string host = (context.Request["host"] != null) ? context.Request["host"].ToString() : "";
        DataTable dt= dal.team_list(project);
        string xml_sql = "";
        string xml_data = "";
        if (dt.Rows.Count > 0 )
        {
         xml_sql += "<dataList>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                xml_sql += "<data_item>";
                xml_sql += "<c_name>" + dt.Rows[i]["c_name"].ToString() + "</c_name>";
                xml_sql += "<c_user>" + dt.Rows[i]["c_user"].ToString() + "</c_user>";
                xml_sql += "<c_dep>" + common.GetEmpOrgcd(dt.Rows[i]["c_user"].ToString()) + "</c_dep>";
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