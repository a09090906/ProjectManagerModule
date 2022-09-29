<%@ WebHandler Language="C#" Class="sub_delete" %>

using System;
using System.Web;

public class sub_delete : IHttpHandler {
    public dal dal = new dal();
    public void ProcessRequest (HttpContext context) {
        string guid = (context.Request["guid"] != null) ? context.Request["guid"].ToString() : "";
        dal.delete_sub(guid);
        context.Response.Write("已刪除");

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}