<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="multileselect.aspx.cs" Inherits="Trello_re.singleselect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="css/font-awesome.min.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<%--    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>--%>
    <script src="js/jquery-ui.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            工號：<input id="empno" type ="text" /> 
            姓名：<input id="name" type="text" />
            <input id="serch" type="button" value="搜尋" />
            <input id="closed" type="button"  value="確定"/>
            <input id="clen" type="button"  value="取消" />
            <input id="hed_emp" type="hidden" />
            <input id="hed_name" type="hidden" />
            <div id="leder_list" style="width:500px;height:300px;overflow:auto">
                <ul id="all">
                </ul>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        $(document).ready(function () {
            var empno_ary = [];
            var name_ary = [];
            $(document).on("change", 'input[name="name_list"]', function () {
                if ($(this).prop('checked')) {
                    empno_ary.push($(this).attr('empnos'));
                    name_ary.push($(this).attr('names'));
                    var emp_str = "";
                    var name_str = "";
                    for (var i = 0; i < empno_ary.length; i++) {
                        emp_str += empno_ary[i] + ";";
                        name_str += name_ary[i] + ";";
                    }
                    $('#hed_emp').val(emp_str);
                    $("#hed_name").val(name_str);

                }
                else {
                    var emp_no = empno_ary.indexOf($(this).attr('empnos'));
                    empno_ary.splice(emp_no, 1);
                    name_ary.splice(emp_no, 1);
                    var emp_str = "";
                    var name_str = "";
                    for (var i = 0; i < empno_ary.length; i++) {
                        emp_str += empno_ary[i] + ";";
                        name_str += name_ary[i] + ";";
                    }
                    $('#hed_emp').val(emp_str);
                    $("#hed_name").val(name_str);

                }
            });
            //回傳字串
            $(document).on('click', "#closed", function () {
                parent.select_fun($('#hed_emp').val(), $('#hed_name').val());
                parent.$('div[name="mut_emp_sle"]').css("display", "none");
                $("#all").empty();
                $("#empno").val('');
                $("#name").val('');
                empno_ary = [];
                name_ary = [];
            });

            $(document).on('click', '#clen', function () {
                parent.$('div[name="mut_emp_sle"]').css("display", "none");
                parent.$('div[name="mut_emp_if"]').attr('src', $("#mut_sle").attr('src'));
            });
            $(document).on('click', '#serch', function () {

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
                                    for (var i = 0; i <= empno_ary.length; i++) {
                                        if (empno_ary[i] == $(this).children("empno").text().trim()) {
                                            check = true;
                                            break;
                                        }
                                        else {
                                            check = false;
                                        }
                                    }
                                    if (check == true) {
                                        chkstr += "<li><input type='checkbox' name='name_list' names='" + $(this).children("name").text().trim() + "' empnos='" + $(this).children("empno").text().trim() + "'checked>";
                                        chkstr += $(this).children("name").text().trim() + " " + $(this).children("empno").text().trim() + " " + $(this).children("dep").text().trim() + "</li>";
                                    }
                                    else {
                                        chkstr += "<li><input type='checkbox' name='name_list' names='" + $(this).children("name").text().trim() + "' empnos='" + $(this).children("empno").text().trim() + "' >";
                                        chkstr += $(this).children("name").text().trim() + " " + $(this).children("empno").text().trim() + " " + $(this).children("dep").text().trim() + "</li>";
                                    }
                                });
                            }
                            else {
                                alert('沒有資料');
                            }
                        }
                        $("#all").append(chkstr);
                    }
                });

            });

        });


           
    </script>
</body>
</html>
