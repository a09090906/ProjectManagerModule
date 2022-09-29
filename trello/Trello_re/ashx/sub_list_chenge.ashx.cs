using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Trello_re.ashx
{
    /// <summary>
    /// sub_list_chenge 的摘要描述
    /// </summary>
    public class sub_list_chenge : IHttpHandler
    {
        dal dal = new dal();
        public void ProcessRequest(HttpContext context)
        {
            string s_guid = (context.Request["s_guid"] != null) ? context.Request["s_guid"].ToString() : "";
            string cd_guid = (context.Request["cd_guid"] != null) ? context.Request["cd_guid"].ToString() : "";

            dal.card_move(s_guid, cd_guid);



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