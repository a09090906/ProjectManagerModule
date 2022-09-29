using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class log : common
{
    dal dal = new dal();
    common common = new common();
    DataTable dt = new DataTable();
   
    protected void Page_Load(object sender, EventArgs e)
    {       
        //string guid = (Request["guid"] != null) ? HttpUtility.UrlDecode(Request["guid"].Trim()) : "";
        if (!IsPostBack)
        {
            //dt = dal.log_serch("d1505060-4de8-195a-f969-116f08790d63");
            //DataView dv = new DataView();
            //if (dt.Rows.Count > 0)
            //{
            //    dv = new DataView(dt);
            //    GridView1.DataSource = dv;
            //    GridView1.DataBind();
            //}
            //else
            //{
                
            //    GridView1.DataSource = null;
            //    GridView1.DataBind();
            //}

        }

    }



}