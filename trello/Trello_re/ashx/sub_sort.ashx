<%@ WebHandler Language="C#" Class="sub_sort" %>

using System;
using System.Web;

public class sub_sort : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        dal dal = new dal();
        string sub_sort = (context.Request["sub_sort"] != null) ? context.Request["sub_sort"].ToString() : "";
        string[] sort = sub_sort.Split(',');
        for (int i=0; i < sort.Length; i++)
        {
            dal.sub_chenge(sort[i], i + 1);
        }


    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}