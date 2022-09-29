<%@ WebHandler Language="C#" Class="delete" %>

using System;
using System.Web;
using System.Data;

public class delete : IHttpHandler {
   dal dal = new dal();
    public void ProcessRequest (HttpContext context) {
             string guid = (context.Request["guid"] != null) ? context.Request["guid"].ToString() : "";
            dal.project_delete(guid);
            context.Response.Write("已刪除");

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}