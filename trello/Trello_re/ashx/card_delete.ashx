<%@ WebHandler Language="C#" Class="card_delete" %>

using System;
using System.Web;

public class card_delete : IHttpHandler {
      public dal dal = new dal();
    public void ProcessRequest (HttpContext context) {
       string guid = (context.Request["guid"] != null) ? context.Request["guid"].ToString() : "";
        dal.card_delete(guid);
        context.Response.Write("已刪除");
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}