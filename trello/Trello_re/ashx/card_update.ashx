<%@ WebHandler Language="C#" Class="card_update" %>

using System;
using System.Web;
using System.Data;

public class card_update : IHttpHandler {
    dal dal = new dal();
    common common = new common();
    public void ProcessRequest (HttpContext context) {
        string s_guid = (context.Request["s_guid"] != null) ? context.Request["s_guid"].ToString() : "";
        string guid = (context.Request["guid"] != null) ? context.Request["guid"].ToString() : "";
        string title = (context.Request["title"] != null) ? context.Request["title"].ToString() : "";
        string text = (context.Request["text"] != null) ? context.Request["text"].ToString() : "";
        string host = (context.Request["host"] != null) ? context.Request["host"].ToString() : "";
        string start_time = (context.Request["start_time"] != null) ? context.Request["start_time"].ToString() : "";
        string end_time = (context.Request["end_time"] != null) ? context.Request["end_time"].ToString() : "";
        string user = (context.Request["user"] != null) ? context.Request["user"].ToString() : "";
        bool ex = dal.sub_list_bool(guid); //判斷是否為範例進度追蹤
        DataTable dt = dal.select_card_guid(guid);
        dal.card_update(ex,s_guid,guid, title, host, text, start_time, end_time);
        dal.card_log_insert(guid, dt.Rows[0]["cd_project"].ToString().Trim(), s_guid, title, user, host, text, start_time, end_time);
        context.Response.Write("已編輯");
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}