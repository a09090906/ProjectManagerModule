using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Trello_re
{
    public partial class test : System.Web.UI.Page
    {
        common common = new common();
        SendMsg sendMsg = new SendMsg();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void btn_click(object sender, EventArgs e)
        {
            if (common.IsValidEmail(login_mail.Value) == false)
            {
                mail_span.InnerHtml = Server.HtmlEncode("mail格式輸入錯誤");
            }



           
        }
        public bool fid = true;

        protected void find_password(object sender, EventArgs e)
        {
            if (fid==true)
            {
                find_password_div.Style["display"] = "";
                fid = false;
            }
          
            else
            {
                find_password_div.Style["display"] = "none";
                fid = true;
            }
                       
        }
        /// <summary>
        /// 發信
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void password_find(object sender, EventArgs e)
        {
            if (common.IsValidEmail(find_email.Value) == false)
            {
                find_lbl.Text = "e-mail格式輸入錯誤";
                return;
            }
            else
            {
                string mail_body = "您好 "+"王八蛋"+" 您的密碼為" + "09487" + "請盡快變更密碼<br>";
                mail_body += "本信件為系統發出 請勿回信";
                sendMsg.SendMailTemp(find_email.Value.Trim(), "", mail_body, "Trello密碼通知");


            }
        }



    }
}