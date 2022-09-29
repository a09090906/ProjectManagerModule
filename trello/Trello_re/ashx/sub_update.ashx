<%@ WebHandler Language="C#" Class="sub_update" %>

using System;
using System.Web;

public class sub_update : IHttpHandler {

    dal dal = new dal();
    common common = new common();
    public void ProcessRequest (HttpContext context) {
        string guid = (context.Request["guid"] != null) ? context.Request["guid"].ToString() : "";
        string title = (context.Request["title"] != null) ? context.Request["title"].ToString() : "";
        string text = (context.Request["text"] != null) ? context.Request["text"].ToString() : "";
        string host = (context.Request["host"] != null) ? context.Request["host"].ToString() : "";
        string start_time = (context.Request["start_time"] != null) ? context.Request["start_time"].ToString() : "";
        string end_time = (context.Request["end_time"] != null) ? context.Request["end_time"].ToString() : "";
        string arr = (context.Request["team"] != null) ? context.Request["team"].ToString() : "";
        string[] team = arr.Split(',');
        string p_guid = (context.Request["p_guid"] != null) ? context.Request["p_guid"].ToString() : "";  
        string emp = (context.Request["emp"] != null) ? context.Request["emp"].ToString() : "";
        dal.sub_group_update(guid);

        for (int i = 0; i < team.Length; i++)
        {
            dal.sub_group_insert(guid, common.GetEmpName(team[i]), team[i], "N");
        }
        dal.sub_group_insert(guid, common.GetEmpName(host), host, "Y");
        dal.update_sub(guid, title, text,host,start_time,end_time);
        dal.sub_log(guid, p_guid, title, host, text, start_time, end_time,emp);




        context.Response.Write("已編輯");
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}