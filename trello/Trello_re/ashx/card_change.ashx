<%@ WebHandler Language="C#" Class="card_change" %>

using System;
using System.Web;
using System.Data;


public class card_change : IHttpHandler {
    dal dal = new dal();

    public void ProcessRequest (HttpContext context)
    {
        string s_guid = (context.Request["s_guid"] != null) ? context.Request["s_guid"].ToString() : "";
        string cd_guid = (context.Request["cd_guid"] != null) ? context.Request["cd_guid"].ToString() : "";
        string user = (context.Request["user"] != null) ? context.Request["user"].ToString() : "";
        dal.card_move(s_guid, cd_guid);
        DataTable dt = dal.select_card_guid(cd_guid);
        string title = dt.Rows[0]["cd_title"].ToString();
        string host = dt.Rows[0]["cd_host"].ToString();
        string text = dt.Rows[0]["cd_text"].ToString();
        string start_time = dt.Rows[0]["cd_start_time"].ToString();
        string end_time = dt.Rows[0]["cd_end_time"].ToString();
        string p_guid = dt.Rows[0]["cd_project"].ToString().Trim();
        int sort = dal.card_sort(s_guid) + 1;
        dal.card_log_insert(cd_guid,p_guid,s_guid, title, user, host, text, start_time, end_time);
        dal.card_chenge(s_guid, sort);


        context.Response.Write("");
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}