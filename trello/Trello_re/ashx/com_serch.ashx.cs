using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace Trello_re.ashx
{
    /// <summary>
    /// com_serch 的摘要描述
    /// </summary>
    public class com_serch : IHttpHandler
    {
        common common = new common();
        dal dal = new dal();
        public void ProcessRequest(HttpContext context)
        {
            string empno = (context.Request["empno"] != null) ? context.Request["empno"].ToString() : "";
            string name = (context.Request["name"] != null) ? context.Request["name"].ToString() : "";
            DataSet ds = common.com_all(empno, name);
            string xml_sql = "";
            string xml_data = "";

            if (ds.Tables[0].Rows.Count > 0)
            {
                xml_sql += "<dataList>";
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    xml_sql += "<data_item>";
                    xml_sql += "<empno>" + ds.Tables[0].Rows[i]["com_empno"].ToString() + "</empno>";
                    xml_sql += "<name>" + ds.Tables[0].Rows[i]["com_cname"].ToString() + "</name>";
                    xml_sql += "<dep>" + common.GetEmpOrgcd(ds.Tables[0].Rows[i]["com_empno"].ToString()) + "</dep>";
                    xml_sql += "</data_item>";
                }
                xml_sql += "</dataList>";
            }
            xml_data = "<root>" + xml_sql + "</root>";
            context.Response.Write(xml_data);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}