using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Security.AntiXss;
using Microsoft.Security.Application;


namespace Trello_re.ashx
{
    /// <summary>
    /// sub_list 的摘要描述
    /// </summary>
    public class sub_list : IHttpHandler
    {
        public dal dal = new dal();
        public void ProcessRequest(HttpContext context)
        {
            string guid = (context.Request["guid"] != null) ? context.Request["guid"].ToString() : "";

            DataTable dt = dal.sub_list_ex(guid);
            string xml_sql = "";
            string xml_data = "";
            if (dt.Rows.Count > 0)

            {
                xml_sql += "<dataList>";
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    xml_sql += "<data_item>";
                    xml_sql += "<s_guid>" + AntiXss.HtmlEncode(dt.Rows[i]["s_guid"].ToString()) + "</s_guid>";
                    xml_sql += "<s_name>" + AntiXss.HtmlEncode(dt.Rows[i]["s_name"].ToString()) + "</s_name>";
                    xml_sql += "</dataList>";
                }


                xml_data = "<root>" + xml_sql + "</root>";
                context.Response.Write(xml_data);

            }

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