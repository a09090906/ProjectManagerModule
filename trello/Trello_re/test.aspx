<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="Trello_re.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        <div id="login_div" runat="server">          
            e-mail <input runat="server" id ="login_mail"  type="text"/><span id="mail_span" style="color:red" runat="server"></span><br />
            password<input runat="server" id="login_pass" type="password"/><span id="password_span" style="color:red"></span><br />
            <asp:Button id="login_btn" Text="登入"  OnClick="btn_click"  runat="server"/>
            <asp:Button ID="longin_pass" runat="server" Text="忘記密碼" OnClick="find_password"  />
            <a id="pass" href="#">忘記密碼</a>
        </div>
            <a id="msg" runat="server"></a>       
    <div id="find_password_div" runat="server" style="display:none">
        請輸入e-mail<input runat="server" id ="find_email" type="text"/> 
        <asp:Label ID="find_lbl" runat="server" BackColor="Red"></asp:Label>
        <asp:Button ID="find_btn" Text="送出" runat="server" OnClick="password_find" />
    </div>
    </form>
    <script type="text/javascript">
        var r = true;
        $(document).on('click','#pass', function () {
            if (r == true) {
                $("#find_password_div").css("display", "");
                r = false;
            }
            else {
                $("#find_password_div").css("display", "none");
                r = true;
            }

        });

    </script>
</body>
</html>
