<%@ WebHandler Language="C#" Class="card_sort" %>

using System;
using System.Web;

public class card_sort : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        dal dal = new dal();
        string card_sort = (context.Request["card_sort"] != null) ? context.Request["card_sort"].ToString() : "";
        string[] sort = card_sort.Split(',');
        for (int i=0; i < sort.Length; i++)
        {
            dal.card_chenge(sort[i], i + 1);
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}