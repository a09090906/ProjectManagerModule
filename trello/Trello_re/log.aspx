<%@ Page Language="C#" AutoEventWireup="true" Inherits="log" Codebehind="log.aspx.cs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="js/jquery-1.11.2.min.js"></script>
    <script src="js/jquery-ui-1.10.2.custom.min.js"></script>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 303px;
            height: 77px;
        }
    </style>
</head>
<body>
    <script type="text/javascript">
        var id = getParameterName('guid');
        var type = getParameterName('type');
        $(document).ready(function () {
            databuid();
            $("#select_log").change(function () {
                log_view(); //.find(":selected")
            });

            $(document).on('click', "a[name='log_view']", function () {



            });
        });
        function databuid() {
            $.ajax({
                type: "POST",
                async: false, //在沒有返回值之前,不會執行下一步動作
                url: "../ashx/log.ashx",
                data: {
                    guid: id,
                    type: type
                },
                error: function (xhr) {
                    alert("Error " + xhr.status);
                    console.log(xhr.responseText);
                },
                success: function (data) {
                    if (data != null) {
                        data = $.parseXML(data);
                        $("#tablist tbody").empty();
                        $("#slect_log").empty();
                        var tabstr = '';
                        var sle = '';
                        if ($(data).find("data_item").length > 0) {
                            $(data).find("data_item").each(function (i) {                                
                                sle += '<option value=' + $(this).children("log_guid").text().trim() + '>更新人：' + $(this).children("log_Modify").text().trim()
                                sle += ' 變更日期:' + $(this).children("log_finel_time").text().trim()+'</option>';
                            });
                            $("#select_log").append(sle);
                        }
                    }

                }

            });
        }


        function log_view() {
            var log_guid = $("#select_log").val();
            $.ajax({
                type: "POST",
                async: false, //在沒有返回值之前,不會執行下一步動作
                url: "../ashx/log_data.ashx",
                data: 'log_id=' + log_guid +
                '&type=' + type +
                '&id=' + id
                ,
                error: function (xhr) {
                    alert("Error " + xhr.status);
                    console.log(xhr.responseText);
                },
                success: function (data) {
                    if (data != null) {
                        data = $.parseXML(data);
                        $("#log_data").empty();
                        var tabstr = '';
                        if ($(data).find("data_item").length > 0) {
                            $(data).find("data_item").each(function (i) {
                                if (type == 'P') {
                                    tabstr += '<span style="color:' + $(this).children("name_edit").text().trim() + '">標題：' + $(this).children("log_name").text().trim() + '</span></br>';
                                    tabstr += '<span style="color:' + $(this).children("text_edit").text().trim() + '">內容：' + $(this).children("log_text").text().trim() + '</span></br>';
                                    tabstr += '<span style="color:' + $(this).children("colar_edit").text().trim() +'">背景顏色：</span><div style="background-color:' + $(this).children("log_colar").text().trim() + ';padding:10px;margin-bottom:5px;"></div></br>'
                                    tabstr += '<span style="color:' + $(this).children("start_time_edit").text().trim() + '">開始日期：' + $(this).children("log_start_time").text().trim() + '</span></br>';
                                    tabstr += '<span style="color:' + $(this).children("end_time_edit").text().trim() + '">結束日期：' + $(this).children("log_end_time").text().trim() + '</span></br>';
                                }
                                else if (type == 'S') {
                                    tabstr += '<span style="color:' + $(this).children("name_edit").text().trim() + '">標題：' + $(this).children("log_name").text().trim() + '</span></br>';
                                    tabstr += '<span style="color:' + $(this).children("text_edit").text().trim() + '">內容：' + $(this).children("log_text").text().trim() + '</span></br>';
                                    tabstr += '<span style="color:' + $(this).children("host_edit").text().trim() + '">主持人：' + $(this).children("log_host").text().trim() + '</span></br>';
                                    tabstr += '<span style="color:' + $(this).children("start_time_edit").text().trim() + '">開始日期：' + $(this).children("log_start_time").text().trim() + '</span></br>';
                                    tabstr += '<span style="color:' + $(this).children("end_time_edit").text().trim() + '">結束日期：' + $(this).children("log_end_time").text().trim() + '</span></br>';
                                }
                                else if (type == 'C') {
                                    tabstr += '<span style="color:' + $(this).children("name_edit").text().trim() + '">標題：' + $(this).children("log_name").text().trim() + '</span></br>';
                                    tabstr += '<span style="color:' + $(this).children("text_edit").text().trim() + '">內容：' + $(this).children("log_text").text().trim() + '</span></br>';
                                    tabstr += '<span style="color:' + $(this).children("host_edit").text().trim() + '">主持人：' + $(this).children("log_host").text().trim() + '</span></br>';
                                    tabstr += '<span style="color:' + $(this).children("sub_edit").text().trim() + '">所屬子項目：' + $(this).children("sub_name").text().trim() + '</span></br>';
                                    tabstr += '<span style="color:' + $(this).children("start_time_edit").text().trim() + '">開始日期：' + $(this).children("log_start_time").text().trim() + '</span></br>';
                                    tabstr += '<span style="color:' + $(this).children("end_time_edit").text().trim() + '">結束日期：' + $(this).children("log_end_time").text().trim() + '</span></br>';
                                }

                            });
                            $("#log_data").append(tabstr);
                           
                        }
                    }

                }

            });
        }

        function getParameterName(skey) { //抓url 
            var s = location.search.replace(/^\?/, '');
            if (s == '' || skey == null || skey == '') return unescape(s);
            var re = new RegExp('(&|^)' + skey + '=([^&]*)(&|$)');
            var a = re.exec(s);
            return unescape(a ? a[2] : '');
        }
   </script>


    <form id="form1" runat="server">
        <div style="float:left;width:50%;/*overflow:auto;*/">     
            <select id ="select_log" style="width:325px;height:350px;"multiple="multiple">

            </select>

        </div>
        <div id="log_data" style="float:left;width:50%">
            
        </div>



    </form>
</body>
</html>
