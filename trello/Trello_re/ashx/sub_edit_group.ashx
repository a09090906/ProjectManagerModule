<%@ WebHandler Language="C#" Class="sub_edit_group" %>

using System;
using System.Web;
using System.Data;

public class sub_edit_group : IHttpHandler {
    dal dal = new dal();
    common common = new common();
    public void ProcessRequest (HttpContext context) {
        string guid = (context.Request["guid"] != null) ? context.Request["guid"].ToString() : "";
        string p_guid = (context.Request["p_guid"] != null) ? context.Request["p_guid"].ToString() : "";
        DataSet ds = dal.team_list_edit(guid);//已選定名單
        string host = "";
        if (ds.Tables[0].Rows.Count > 0)
        {
            host = ds.Tables[0].Rows[0]["su_empno"].ToString().Trim();//該子項目主持人
        }
        DataTable dt= dal.team_list_chang(p_guid,host); //所有名單
        string xml_sql = "";
        string xml_data = "";
        string xml_check = "N";

        if ( dt.Rows.Count>0)
        {
            xml_sql += "<dataList>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                xml_sql += "<data_item>";
                xml_sql += "<c_name>" + dt.Rows[i]["c_name"].ToString() + "</c_name>";
                xml_sql += "<c_user>" + dt.Rows[i]["c_user"].ToString() + "</c_user>";
                xml_sql += "<c_dep>" + common.GetEmpOrgcd(dt.Rows[i]["c_user"].ToString()) + "</c_dep>";
                if (ds.Tables[1].Rows.Count > 0 )
                {
                    for (int j = 0; j < ds.Tables[1].Rows.Count; j++)
                    {
                        if (dt.Rows[i]["c_user"].ToString() == ds.Tables[1].Rows[j]["su_empno"].ToString())
                        {
                            xml_check = "Y";
                        }
                    }
                }
                xml_sql += "<check>" + xml_check + "</check>";
                xml_check = "N";
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