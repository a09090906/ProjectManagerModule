using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class trello_sub : System.Web.UI.Page
{
    public SSOUtil.SSOLoginUser sso = new SSOUtil.SSOLoginUser();
    public dal dal = new dal();
    public common common = new common();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
          
        }
        sso.GetEmpInfo();
        hello.InnerText = "登入者：" + sso.empName + "     ";
        helloempno.InnerText = sso.empNo;
    }


  


}