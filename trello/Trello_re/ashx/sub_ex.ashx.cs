using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Trello_re.ashx
{
    /// <summary>
    /// sub_ex 的摘要描述
    /// </summary>
    public class sub_ex : IHttpHandler
    {
        dal dal = new dal();
        public void ProcessRequest(HttpContext context)
        {
            string guid = (context.Request["guid"] != null) ? context.Request["guid"].ToString() : "";
            context.Response.Write(dal.sub_ex(guid));

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