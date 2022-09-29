<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="multileselect.aspx.cs" Inherits="Trello_re.singleselect" %>

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
            工號：<input id="empno" type ="text" /> 
            姓名：<input id="name" type="text" />
            <input id="serch" type="button" value="搜尋" onclick="databuid()"/>
            <div id="leder_list" style="width:500px;height:300px;overflow:auto">
                <ul id="all">

                </ul>
            </div>
            <ul id="select_name">

            </ul>

        </div>
    </form>

    <script type="text/javascript">
        $(Document).ready(function () {
            

            $(document).on('click', ".delete", function () {
                $(this).parent("li").remove();
                  
            });
           
        });
      


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
                    if ($(data).find("data_item").length > 0) {
                        $(data).find("data_item").each(function (i) {
                            chkstr += "<li><input type='checkbox' name='name_list' names='"+$(this).children("name").text().trim()+"' empnos='" + $(this).children("empno").text().trim() + "'>";
                            chkstr += $(this).children("name").text().trim() + " " + $(this).children("empno").text().trim() + " " + $(this).children("dep").text().trim() + "</li>";
                        });
                    }
                    else {
                        alert('沒有資料');
                    }
                }
                $("#all").append(chkstr);                
            }
            });
        $('input[name="name_list"]').change(function () {
            if ($(this).prop('checked')) {
                var str = '';
                str += "<li empnos='" + $(this).attr('empnos') + "'><a class='delete' href='#'><i class='fa fa-times font-red' aria- hidden='true'></i></a>'";
                str += $(this).attr('names') + "</li>";
                $("#select_name").append(str);
            } 
        });
        }
    </script>
</body>
</html>
