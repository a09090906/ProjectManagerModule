<%@ WebHandler Language="C#" Class="insert" %>

using System;
using System.Web;
using System.Data;

public class insert : IHttpHandler {
    dal dal = new dal();
    common com = new common();
    SendMsg SendMsg = new SendMsg();
    public void ProcessRequest (HttpContext context) {

        string guid = (context.Request["guid"] != null) ? context.Request["guid"].ToString() : "";
        string pro_title = (context.Request["title"] != null) ? context.Request["title"].ToString() : "";
        string pro_text = (context.Request["text"] != null) ? context.Request["text"].ToString() : "";
        string pro_type = (context.Request["type_new"] != null) ? context.Request["type_new"].ToString() : "";
        string colar =(context.Request["colar"] != null) ? context.Request["colar"].ToString() : "";
        string date_start =(context.Request["datestart"] != null) ? context.Request["datestart"].ToString() : "";
        string date_end =(context.Request["dateend"] != null) ? context.Request["dateend"].ToString() : "";
        string host =(context.Request["host"] != null) ? context.Request["host"].ToString() : "";
        string sa = (context.Request["sa"] != null) ? context.Request["sa"].ToString() : "";
        string sa_emp = (context.Request["sa_emp"] != null) ? context.Request["sa_emp"].ToString() : "";
        string name = (context.Request["name"] != null) ? context.Request["name"].ToString() : "";
        string empno = (context.Request["empno"] != null) ? context.Request["empno"].ToString() : "";
        string saa_name = (context.Request["saa_name"] != null) ? context.Request["saa_name"].ToString() : "";
        string saa_empno = (context.Request["saa_empno"] != null) ? context.Request["saa_empno"].ToString() : "";
            string user = (context.Request["user"] != null) ? context.Request["user"].ToString() : "";
        string [] name_group = name.Trim().Split(';');
        string [] empno_group = empno.Trim().Split(';');
        int group_count = empno_group.Length;
        for(int i = 0; i <= empno_group.Length-2; i++)
        {
            dal.group_join(guid, empno_group[i], sa_emp,name_group[i],"N",sa,name+";"+sa+";"+saa_empno);
            string mail = com.GetEmpEmail(empno_group[i]);
            SendMsg.SendMailTemp(mail, "", "FIY", "[測試信]ITRI專案管理系統");
        }
        //主持人
        dal.group_join(guid, sa_emp, sa_emp, sa,"Y",sa,name+";"+sa+";"+saa_empno);


        //判斷助理是否為空
        if(saa_name != "" && saa_empno != "")
        {
            group_count = empno_group.Length;
            //case_user加入助理主持人
            dal.group_join(guid, saa_empno, sa_emp, saa_name,"A",sa,name+";"+sa+";"+saa_empno);
        }
        else
        {
            group_count = empno_group.Length-1;
        }
        dal.project_log_insert(guid, pro_title, pro_text, pro_type, colar, date_start, date_end, sa, group_count.ToString(), name, empno, sa_emp, saa_name, saa_empno,"ADD");
        dal.insert_project(guid, pro_title, pro_text, pro_type, colar, date_start, date_end, sa, group_count.ToString(), name, empno, sa_emp, saa_name, saa_empno);

        context.Response.Write("已新增");






    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}