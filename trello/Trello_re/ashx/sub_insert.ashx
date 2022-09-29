<%@ WebHandler Language="C#" Class="sub_insert" %>

using System;
using System.Web;
using System.Data;

public class sub_insert : IHttpHandler {
    dal dal = new dal();
    common common = new common();
    public void ProcessRequest (HttpContext context) {
        string s_guid = (context.Request["s_guid"] != null) ? context.Request["s_guid"].ToString() : "";
        string p_guid = (context.Request["p_guid"] != null) ? context.Request["p_guid"].ToString() : "";
        string title = (context.Request["title"] != null) ? context.Request["title"].ToString() : "";
        string text = (context.Request["text"] != null) ? context.Request["text"].ToString() : "";
        string sa = (context.Request["sa"] != null) ? context.Request["sa"].ToString() : "";
        string start_time = (context.Request["start_time"] != null) ? context.Request["start_time"].ToString() : "";
        string end_time = (context.Request["end_time"] != null) ? context.Request["end_time"].ToString() : "";
        string emp = (context.Request["emp"] != null) ? context.Request["emp"].ToString() : "";
        string arr = (context.Request["team"] != null) ? context.Request["team"].ToString() : "";
        string[] team = arr.Split(',');
        string host = (context.Request["host"] != null) ? context.Request["host"].ToString() : "";
        for(int i = 0; i < team.Length; i++)
        {
            dal.sub_group_insert(s_guid, common.GetEmpName(team[i]), team[i], "N");
        }
        dal.sub_group_insert(s_guid, common.GetEmpName(host), host, "Y");
        //成員變更不做紀錄
        int sub_sort = dal.sub_sort(p_guid) + 1;
        
        dal.insert_sub(s_guid, p_guid, title, sa, text,start_time,end_time,sub_sort);
        dal.sub_log(s_guid, p_guid, title, sa, text, start_time, end_time,emp);

        context.Response.Write("已新增");



    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}