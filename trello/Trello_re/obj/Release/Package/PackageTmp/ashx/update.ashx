<%@ WebHandler Language="C#" Class="update" %>

using System;
using System.Web;
using System.Data;

public class update : IHttpHandler {

    dal dal = new dal();
    public void ProcessRequest (HttpContext context) {

        string guid = (context.Request["guid"] != null) ? context.Request["guid"].ToString() : "";
        string title = (context.Request["title"] != null) ? context.Request["title"].ToString() : "";
        string text = (context.Request["text"] != null) ? context.Request["text"].ToString() : "";
        string type = (context.Request["type"] != null) ? context.Request["type"].ToString() : "";
        string colar =(context.Request["colar"] != null) ? context.Request["colar"].ToString() : "";
        string date_start =(context.Request["date_start"] != null) ? context.Request["date_start"].ToString() : "";
        string date_end =(context.Request["date_end"] != null) ? context.Request["date_end"].ToString() : "";
        string host =(context.Request["host"] != null) ? context.Request["host"].ToString() : "";
        string allname =(context.Request["allname"] != null) ? context.Request["allname"].ToString() : "";
        string host_emp = (context.Request["host_emp"] != null) ? context.Request["host_emp"].ToString() : "";
        string all_emp = (context.Request["all_emp"] != null) ? context.Request["all_emp"].ToString() : "";
        string host_name = (context.Request["host_name"] != null) ? context.Request["host_name"].ToString() : "";
        string saa_name = (context.Request["saa_name"] != null) ? context.Request["saa_name"].ToString() : "";
        string saa_empno = (context.Request["saa_empno"] != null) ? context.Request["saa_empno"].ToString() : "";

        string [] name_group = allname.Trim().Split(';');
        string [] empno_group = all_emp.Trim().Split(';');

        dal.project_update(title, text, guid,type,colar,date_start,date_end,host_name,(name_group.Length-1).ToString(),allname,all_emp,host_emp,saa_name,saa_empno);

        dal.update_group_d(guid);

        for(int i = 0; i <= empno_group.Length-2; i++)
        {
            dal.group_join(guid, empno_group[i], host_emp,name_group[i],"N",host_name,all_emp);
        }
        dal.group_join(guid, host_emp, host_emp, host_name,"Y",host_name,all_emp);
        dal.group_join(guid, saa_empno, host_emp, saa_name,"A",host_name,all_emp);
            dal.project_log_insert(guid,title,text,"",colar,date_start,date_end,host,"",allname,all_emp,host_emp,saa_name,saa_empno,"UP");
        context.Response.Write("已編輯");

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}