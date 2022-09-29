<%@ WebHandler Language="C#" Class="edit_delete_file" %>

using System;
using System.Web;
using System.Data;

public class edit_delete_file : IHttpHandler {

    public dal dal = new dal();
    public void ProcessRequest (HttpContext context) {
            string guid = (context.Request["guid"] != null) ? context.Request["guid"].ToString() : "";
            dal.file_delete(guid);
         context.Response.Write("已刪除");
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}