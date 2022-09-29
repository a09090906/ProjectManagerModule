<%@ WebHandler Language="C#" Class="card_insert" %>

using System;
using System.Web;

public class card_insert : IHttpHandler {

    dal dal = new dal();
    public void ProcessRequest (HttpContext context) {
        string s_guid = (context.Request["s_guid"] != null) ? context.Request["s_guid"].ToString() : "";
        string p_guid = (context.Request["p_guid"] != null) ? context.Request["p_guid"].ToString() : "";
        string title = (context.Request["title"] != null) ? context.Request["title"].ToString() : "";
        string text = (context.Request["text"] != null) ? context.Request["text"].ToString() : "";
        string user = (context.Request["user"] != null) ? context.Request["user"].ToString() : "";
        string  host = (context.Request["host"] != null) ? context.Request["host"].ToString() : "";
        string  start_time = (context.Request["start_time"] != null) ? context.Request["start_time"].ToString() : "";
        string  end_time = (context.Request["end_time"] != null) ? context.Request["end_time"].ToString() : "";
        string  cd_guid = (context.Request["cd_guid"] != null) ? context.Request["cd_guid"].ToString() : "";

        int sort = dal.card_sort(s_guid) + 1;
        dal.card_insert(cd_guid,p_guid, s_guid, title, user, host, text,start_time,end_time,sort);
        dal.card_log_insert(cd_guid, p_guid, s_guid, title, user, host, text, start_time, end_time);
        context.Response.Write("已新增");
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}