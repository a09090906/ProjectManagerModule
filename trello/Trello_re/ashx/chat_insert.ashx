<%@ WebHandler Language="C#" Class="chat_insert" %>

using System;
using System.Web;

public class chat_insert : IHttpHandler {
    dal dal = new dal();
    public void ProcessRequest (HttpContext context) {
        string guid = (context.Request["guid"] != null) ? context.Request["guid"].ToString() : "";
        string user = (context.Request["user"] != null) ? context.Request["user"].ToString() : "";
        string text = (context.Request["text"] != null) ? context.Request["text"].ToString() : "";
        dal.chat_insert(guid, user, text);

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}