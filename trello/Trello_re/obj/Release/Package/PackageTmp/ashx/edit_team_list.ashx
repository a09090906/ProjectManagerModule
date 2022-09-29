<%@ WebHandler Language="C#" Class="edit_team_list" %>

using System;
using System.Web;

public class edit_team_list : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write("Hello World");
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}