using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Configuration;


public partial class trello_tast : System.Web.UI.Page
{
    public SSOUtil.SSOLoginUser sso = new SSOUtil.SSOLoginUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        sso.GetEmpInfo();
        hello.InnerText = "登入者："+sso.empName;
        saname.InnerText = sso.empName;
        hello_empno.InnerText = sso.empNo;
        sa_tex.Value = sso.empName;
        emp_tex.Value= sso.empNo;
    }
    //string KeyName = WebConfigurationManager.AppSettings["TestEmpNo"];
    ////Configuration與AppSettingsSection必須引用System.Configuration才可使用！
    //Configuration config = WebConfigurationManager.OpenWebConfiguration(null);
    //AppSettingsSection app = config.AppSettings;
    ////app.Settings.Add("B", "This is B value");
    //app.Settings["A"].Value = "This is not B";
    //config.Save(ConfigurationSaveMode.Modified);




}