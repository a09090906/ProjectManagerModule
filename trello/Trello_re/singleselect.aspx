<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="singleselect.aspx.cs" Inherits="Trello_re.singleselect1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="css/font-awesome.min.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            工號：<input id="empno" type="text" />
            姓名：<input id="name" type="text" />          
            <input id="serch" type="button" value="查詢"  onclick="databuid()" />
            <input id="serch" type="button" value="取消"  onclick="close_select()" />
           <input id="sa_chenge" type="text" style="display:none;" /> 
            <div id="leder_list" style="width:500px;height:300px;overflow:auto">
                <ul id="all"></ul>
            </div>
        </div>
    </form>
    <script type="text/javascript">

        function close_select() {

            if ($("#sa_chenge").val() == 'A') { //是否為助理主持人 助理主持人=A 主持人 =SA
                parent.single_select_fun("", "");
                parent.$('div[name="ast_emp_sle"]').css("display", "none");
            }
            else {
                parent.sa_select_fun("", "");
                parent.$('div[name="sa_emp_sle"]').css("display", "none");
            }
        }

        function databuid() {
            $.ajax({
                type: "POST",
                async: false, //在沒有返回值之前,不會執行下一步動作
                url: "ashx/com_serch.ashx",
                data: {
                    empno: $("#empno").val(),
                    name: $("#name").val()
                },
                error: function (xhr) {
                    alert("Error " + xhr.status);
                    console.log(xhr.responseText);
                },
                success: function (data) {
                    $("#all").empty();
                    if (data != null) {
                        data = $.parseXML(data);
                        var chkstr = '';
                        var check = false;
                        if ($(data).find("data_item").length > 0) {
                            $(data).find("data_item").each(function (i) {
                                chkstr += "<li><a href='#'  name='name_list' names=" + $(this).children("name").text().trim() + " empnos=" + $(this).children("empno").text().trim() + ">";
                                chkstr += $(this).children("name").text().trim() + " " + $(this).children("empno").text().trim() + " " + $(this).children("dep").text().trim() + "</a></li>";
                            });
                        }
                        else {
                            alert('沒有資料');
                        }
                    }
                    $("#all").append(chkstr);
                }
            });
            $(document).on('click', "a[name='name_list']", function () {
                var empno_str = $(this).attr('empnos');
                var name_str = $(this).attr('names');
                $("#empno").val('');
                $("#name").val('');
                $("#all").empty();
                if ($("#sa_chenge").val() == 'A') {
                    parent.single_select_fun(empno_str, name_str);
                    parent.$('div[name="ast_emp_sle"]').css("display", "none");
                }
                else {
                    parent.sa_select_fun(empno_str, name_str);
                    parent.$('div[name="sa_emp_sle"]').css("display", "none");
                }
            });
        }

    </script>
</body>
</html>
