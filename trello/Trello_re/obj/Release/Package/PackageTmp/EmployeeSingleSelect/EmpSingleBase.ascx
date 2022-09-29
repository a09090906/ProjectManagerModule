<%@ Control Language="C#" AutoEventWireup="true" Inherits="uc_EmpBase" Codebehind="EmpSingleBase.ascx.cs" %>
<script type="text/javascript" language="javascript">
    function show_OpenWindowEmp(parentField, cname,depcd) {
        var w = window.open("EmployeeSingleWindow.aspx?parentID=" + parentField + "&cname=" + cname + "&depcd=" + depcd, "½Ð¿ï¾Ü", "top=50,left=250,width=800,height=610,center=yes,resizable=yes,status=no,location=no,scrollbars=yes");
        w.focus();
    }			
</script>
<asp:textbox id="txtName"  Width="69px" runat="server"  ontextchanged="txtName_TextChanged" AutoPostBack="True"></asp:textbox>
<asp:ImageButton ID="btnQry" runat="server"   ImageUrl="~/Comp/EmployeeSingleSelect/images/icon_find.png"  onclick="btnQry_Click" />
<asp:Label ID="lblEmpno" runat="server"></asp:Label>
<asp:label id="lblTel" runat="server"></asp:label>
