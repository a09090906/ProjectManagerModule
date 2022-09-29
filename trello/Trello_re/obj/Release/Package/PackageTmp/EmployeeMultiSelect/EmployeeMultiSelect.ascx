<%@ Control Language="C#" AutoEventWireup="true" Inherits="Comp_EmployeeMultiSelect_EmployeeMultiSelect" Codebehind="EmployeeMultiSelect.ascx.cs" %>
<asp:TextBox runat="server" id="TB_MtName" name="TB_MtName" ReadOnly="true" />
<asp:ImageButton ID="img_search" runat="server"   ImageUrl="../EmployeeMultiSelect/images/icon_find.png"    onclick="img_search_Click" style="width: 16px" />
<div style="display:none">
    <asp:TextBox ID="TB_empno_string" runat="server"></asp:TextBox>
</div> 


