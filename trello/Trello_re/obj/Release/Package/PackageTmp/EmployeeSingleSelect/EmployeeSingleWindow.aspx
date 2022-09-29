<%@ Page Language="C#" AutoEventWireup="true" Inherits="chooseEmployee1" Codebehind="EmployeeSingleWindow.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.colorbox.js"></script>
    <link href="../EmployeeSingleSelect/css/popwindows.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
        //將已挑選成員回傳到母視窗的TextBox與HiddenField
        function setValue(cname_string, tbxid, empno_string, hfid) {
                var topWin = null;
                if (window.opener)
                    topWin = window.opener;
                else if (window.dialogArguments)
                    topWin = window.dialogArguments;
                else
                    return false;

                topWin.document.getElementById(tbxid).value = cname_string;
                topWin.document.getElementById(hfid).value = empno_string;
            }
        function cclick(parentField, rtn_value) {
            window.opener.document.getElementById(parentField).value = rtn_value;
            window.opener.__doPostBack('txtName', '');
            window.close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    

    <div class="pop_block">
     <p class="pop_title">
            挑選成員清單: &nbsp;<asp:LinkButton ID="lbtn_bydept" 
                runat="server" onclick="lbtn_bydept_Click" Enabled="False">部門</asp:LinkButton>&nbsp;|<asp:LinkButton ID="lbtn_byname" runat="server" onclick="lbtn_byname_Click">姓名</asp:LinkButton>
                               
     </p>
     <p class="pop_search" runat="server" id="p_search" style="display:none">
         <asp:TextBox ID="txt_keyword" runat="server"   onfocus="if(this.value.indexOf('請輸入搜尋關鍵字')!=-1)this.value=''" onblur="if(this.value=='')this.value='請輸入搜尋關鍵字'" value="請輸入搜尋關鍵字"></asp:TextBox>
         <asp:Button ID="btn_search" runat="server" Text="搜尋" CssClass="btn" onclick="btn_search_Click" /> <font class="pop_title" color="black">關鍵字包含姓名、工號、部門代號、部門名稱</font>
     </p>
    <table align="left">
        <tr>
            <td>
                <table id="table1" runat="server" style="display:block" class="pop_input">
                    <tr>
                        <th>單位</th>
                        <th>部門</th>
                        <th>姓名</th>
                    </tr>
                    <tr>
                        <td >
                            <asp:ListBox ID="listbox_org" runat="server" Height="428px" Width="130px" 
                                AutoPostBack="True" 
                                onselectedindexchanged="listbox_org_SelectedIndexChanged"></asp:ListBox>&nbsp;
                        </td>
                        <td>
                            <asp:ListBox ID="listbox_dept" runat="server" Height="428px" 
                                AutoPostBack="True" 
                                onselectedindexchanged="listbox_dept_SelectedIndexChanged" Width="230px"></asp:ListBox>&nbsp;
                        </td>
                        <td>
                            <div style="overflow: auto; height: 428px; width:150px" >                          
                                 <asp:Repeater ID="rpDeptMember" runat="server"    onitemdatabound="rpDeptMember_ItemDataBound" OnItemCommand="rpDeptMember_ItemCommand">                    
                                     <ItemTemplate>                          
                                                <asp:ImageButton ID="imgbtn_add1" ImageUrl="../EmployeeSingleSelect/images/icon_unchecked.png"   runat="server" CommandName="linbtn_add1_cmd"  CommandArgument='<%# Eval("com_empno")%>' />
                                                <asp:LinkButton ID="linbtn_add1" runat="server"  CommandName="linbtn_add1_cmd" CommandArgument='<%# Eval("com_empno")%>'><%# Eval("com_cname")%></asp:LinkButton>
                                                 <asp:HiddenField ID="hf_com_empno" runat="server" Value='<%# Eval("com_empno")%>' />
                                               <br />
                                     </ItemTemplate>                      
                                    </asp:Repeater>
                               </div>
                            </td> 
                    </tr>
                </table>
                 <asp:Label ID="lbl_info" runat="server" Visible="false" Width="200px"></asp:Label>
                 <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="False" 
                                AllowPaging="True" AllowSorting="True" CssClass="pop_input" 
                                onpageindexchanging="gvList_PageIndexChanging" onrowcreated="gvList_RowCreated" 
             PageSize="20" onsorting="gvList_Sorting" Visible="False" 
                    onrowdatabound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
                                <HeaderStyle />
                                <Columns>
                                    <asp:TemplateField SortExpression="com_cname">
                                        <ItemStyle Width="130px" />
                                        <HeaderTemplate>
                                            <asp:LinkButton ID="sortCname" runat="server" CommandName="Sort" CommandArgument="com_cname">姓名</asp:LinkButton>
                                                &nbsp;<asp:ImageButton ID="imgCnameSort" runat="server" ImageUrl="../EmployeeSingleSelect/images/arrow_desc.png"  CommandName="Sort" CommandArgument="com_cname" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtn_add2" runat="server" CommandName="linbtn_add1_cmd" CommandArgument='<%# Bind("com_empno") %>' ImageUrl="../EmployeeSingleSelect/images/icon_unchecked.png" />
                                            <asp:LinkButton ID="linbtn_add2" runat="server" CommandName="linbtn_add1_cmd" CommandArgument='<%# Bind("com_empno") %>'  Text='<%# Bind("com_cname") %>'></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField SortExpression="com_empno">
                                            <ItemStyle Width="100px" />
                                            <HeaderTemplate>
                                                <asp:LinkButton ID="sortEmpno" runat="server" CommandName="Sort" CommandArgument="com_empno">工號</asp:LinkButton>
                                                    &nbsp;<asp:ImageButton ID="imgEmpnoSort" runat="server" ImageUrl="../EmployeeSingleSelect/images/arrow_desc.png"  CommandName="Sort" CommandArgument="com_empno" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="com_empno" runat="server" Text='<%# Bind("com_empno") %>'></asp:Label>
                                            </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField SortExpression="deptid">
                                            <ItemStyle Width="100px" />
                                            <HeaderTemplate>
                                                <asp:LinkButton ID="sortDeptid" runat="server" CommandName="Sort" CommandArgument="deptid">部門代號</asp:LinkButton>
                                                    &nbsp;<asp:ImageButton ID="imgDeptidSort" runat="server" ImageUrl="../EmployeeSingleSelect/images/arrow_desc.png"  CommandName="Sort" CommandArgument="deptid" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="deptid" runat="server" Text='<%# Bind("deptid") %>'></asp:Label>
                                            </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField SortExpression="dep_deptname">
                                            <ItemStyle Width="250px" />
                                            <HeaderTemplate>
                                                <asp:LinkButton ID="sortDeptname" runat="server" CommandName="Sort" CommandArgument="dep_deptname">部門名稱</asp:LinkButton>
                                                    &nbsp;<asp:ImageButton ID="imgDeptnameSort" runat="server" ImageUrl="../EmployeeSingleSelect/images/arrow_desc.png"  CommandName="Sort" CommandArgument="dep_deptname" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="dep_deptname" runat="server" Text='<%# Bind("dep_deptname") %>'></asp:Label>
                                            </ItemTemplate>
                                    </asp:TemplateField>

                              </Columns>
                                <PagerTemplate>
                                 <center>
                                     <asp:LinkButton ID="ibStart" runat="server" onclick="ibStart_Click">首頁</asp:LinkButton>
                                     &nbsp;<asp:LinkButton ID="ibPrev" runat="server" onclick="ibPrev_Click">前頁</asp:LinkButton>
                
                                     <asp:PlaceHolder ID="phdPageNumber" runat="server"></asp:PlaceHolder>
                                     &nbsp;<asp:LinkButton ID="ibNext" runat="server" onclick="ibNext_Click">下頁</asp:LinkButton>
                                     &nbsp;<asp:LinkButton ID="ibLast" runat="server" onclick="ibLast_Click">末頁</asp:LinkButton>
                                     &nbsp;<asp:DropDownList ID="ddlstDispCount" runat="server" 
                                         AutoPostBack="True"  Visible="false"
                                         onselectedindexchanged="ddlstDispCount_SelectedIndexChanged" Enabled="False">
                                         <asp:ListItem>20</asp:ListItem>
                                        
                                     </asp:DropDownList>
                                     (合計<span class="org"></span><asp:Label ID="lblTotalRecord" runat="server"></asp:Label>
                                     筆，共<span class="org"></span><asp:Label ID="lblTotalPage" runat="server" 
                                         Text=""></asp:Label>
                                     頁) &nbsp;最多顯示200筆
                                     </center>
                                 </PagerTemplate>
                            </asp:GridView>
            </td>            
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lbl_Msg" runat="server"></asp:Label>
                <asp:Label ID="lbl_flag" runat="server" Text="0" Visible="False"></asp:Label>
            </td>
        </tr>         
    </table>
    </form>
</body>
</html>
