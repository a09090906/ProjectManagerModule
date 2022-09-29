<%@ Page Language="C#" AutoEventWireup="true" Inherits="trello_tast" Codebehind="trello_tast.aspx.cs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=11; IE=10; IE=9; IE=8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="keywords" content="關鍵字內容" />
    <meta name="description" content="描述" />
    <!--告訴搜尋引擎這篇網頁的內容或摘要。-->
    <meta name="generator" content="Notepad" />
    <!--告訴搜尋引擎這篇網頁是用什麼軟體製作的。-->
    <meta name="author" content="工研院 資科中心" />
    <!--告訴搜尋引擎這篇網頁是由誰製作的。-->
    <meta name="copyright" content="本網頁著作權所有" />
    <!--告訴搜尋引擎這篇網頁是...... -->
    <meta name="revisit-after" content="3 days" />
    <!--告訴搜尋引擎3天之後再來一次這篇網頁，也許要重新登錄。-->
    <title>專案建立</title>
    <link rel="stylesheet" href="css/bootstrap.css" />
    <!-- normalize & bootstrap's grid system -->
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <!-- css icon -->
    <link href="css/superfish.css" rel="stylesheet" type="text/css" />
    <!-- 下拉選單 -->
    <link href="css/jquery.mmenu.css" rel="stylesheet" type="text/css" />
    <!-- mmenu css:行動裝置選單 -->
    <link href="css/jquery.powertip.css" rel="stylesheet" type="text/css" />
    <!-- powertip:tooltips -->
    <link href="css/jquery.datetimepicker.css" rel="stylesheet" type="text/css" />
    <!-- datepicker -->
    <link href="css/magnific-popup.css" rel="stylesheet" type="text/css" />
    <!-- popup dialog -->
    <link href="css/OchiLayout.css" rel="stylesheet" type="text/css" />
    <!-- ochsion layout base -->
    <link href="css/OchiColor.css" rel="stylesheet" type="text/css" />
    <!-- ochsion layout color -->
    <link href="css/OchiRWD.css" rel="stylesheet" type="text/css" />
    <!-- ochsion layout RWD -->
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery.simplecolorpicker.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery-ui.css" rel="stylesheet" />
    <!-- IE 瀏覽器版本低於 9 處理 -->
    <!--[if lte IE 9]>
<link href="css/cssie9.css" rel="stylesheet" type="text/css" />
<![endif]-->
    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.breakpoint-min.js"></script>
    <!-- 斷點設定 -->
    <script type="text/javascript" src="js/superfish.min.js"></script>
    <!-- 下拉選單 -->
    <script type="text/javascript" src="js/supposition.js"></script>
    <!-- 下拉選單:修正最後項在視窗大小不夠時的BUG -->
    <script type="text/javascript" src="js/jquery.mmenu.min.js"></script>
    <!-- mmenu js:行動裝置選單 -->
    <script type="text/javascript" src="js/jquery.touchSwipe.min.js"></script>
    <!-- 增加JS觸控操作 for mmenu -->
    <script type="text/javascript" src="js/jquery.powertip.min.js"></script>
    <!-- powertip:tooltips -->
    <script type="text/javascript" src="js/jquery.datetimepicker.js"></script>
    <!-- datepicker -->
    <script type="text/javascript" src="js/jquery.easytabs.min.js"></script>
    <!-- easytabs tab -->
    <script type="text/javascript" src="js/jquery.magnific-popup.min.js"></script>
    <!-- popup dialog -->
    <script type="text/javascript" src="js/jquery-ui.min.js"></script>
    <!-- 拖拉元件 -->
    <script type="text/javascript" src="js/jquery.ns-autogrow.min.js"></script>
    <!-- textarea autogrow -->
    <script type="text/javascript" src="js/jquery.inline-edit.js"></script>
    <script type="text/javascript" src="js/jquery.simplecolorpicker.js"></script>
    <script src="js/jquery-ui.js"></script>
    <!-- dialog -->
    <script src="js/jquery.colorbox-min.js"></script>
    <script type="text/javascript" src="js/jquery.placeholder.min.js"></script>
    <script type="text/javascript" src="js/jquery.collapse.js"></script>
    <!-- 收合展開 -->
    <script type="text/javascript" src="js/jquery.collapse_storage.js"></script>
    <!-- 收合展開:增加記憶功能 -->
    <link href="css/colorbox.css" rel="stylesheet" />

</head>
<body>
    <!-- 開頭用div:修正mmenu form bug -->
    <div>
        <form>
            <div class="WrapperBody">
                <div class="WrapperHeader">
                    <div class="MainMenu">
                        <!-- 置中版面控制:滿版可移除container或改成container-fluid -->
                        <div class="twocol padding5RL">
                            <div class="left">
                                <div class="font-bold font-size4 font-white padding5TB"><img src="images/logo.png"/>&nbsp;ITRI 專案管理模組</div>
                            </div>
                            <!-- left -->
                            <div class="right padding10TB">
                                <p id="hello_empno" runat="server" style="display: none"></p>
                                <p id="saname" runat="server" style="display: none"></p>
                                <span id="hello" runat="server" class=" font-white font-size2"></span></div>
                            <!-- right -->
                        </div>
                        <!-- twocol -->
                    </div>
                    <!-- MainMenu -->
                </div>
                <!-- WrapperHeader -->



                <div id="mycasewrapper">
                    <div class="titlepadding">
                        <div class="twocol">
                            <div class="left font-white font-size4">我的專案</div>
                            <div class="right"><a href="#" id="switchsharecasebtn" class="genbtn">檢視分享給我的專案</a></div>
                        </div>
                        <!-- twocol -->
                        <ul class='monsortable monlist padding10TB' id="monsortable">

                        </ul>
                    </div>
                    <!-- padding10RL -->
                </div>
                <!-- mycasewrapper -->

                <div id="sharecasewrapper" class="padding10ALL RWDhide">
                    <div class="twocol">
                        <div class="left font-white font-size4">與我分享的專案</div>
                        <div class="right"><a href="#" id="switchmycasebtn" class="genbtnS">檢視我的專案</a></div>
                    </div>
                    <ul id="sharelist" class='sharelist padding10TB'></ul>
                </div>
                <!-- padding10RL -->
            </div>
            <!-- WrapperBody -->

            <div class="WrapperFooter">
                <div class="footerblock container font-white">
                    版權所有©2018 工業技術研究院｜ 建議瀏覽解析度1024x768以上<br />
                    業務窗口：劉冠麟(分機：19487)｜網站製作：資科中心｜意見反應｜系統使用說明書
                </div>
                <!--{* footerblock *}-->
            </div>
            <!-- WrapperFooter -->

            <!-- 側邊選單內容:動態複製主選單內容 -->
            <div id="sidebar-wrapper">
            </div>
            <!-- sidebar-wrapper -->

        </form>
    </div>
    <!-- 結尾用div:修正mmenu form bug -->
    <div id="log_table" class="magpopup magSizeM mfp-hide">
        <div class="magpopupTitle">編輯紀錄</div>
         <div class="gentable margin5T">
        <table id="log_tab" width="100%" border="0" cellspacing="0" cellpadding="0"></table>
         </div>

    </div>


    <!-- Magnific Popup 新增 -->
    <div id="editcardblock" class="magpopup magSizeM mfp-hide">
        <div class="magpopupTitle">編輯項目</div>
        <div class="padding10ALL">
            <textarea id="pro_title" rows="2" class="inputexPlus width100 margin10B addplaceholder" placeholder="標題"></textarea>
            <textarea id="pro_text" rows="4" class="inputexPlus width100 addplaceholder" placeholder="內容請填於此..."></textarea>

            <div class="twocol margin10T">
                <div class="right font-normal">
                    <i class="fa fa-plus-square-o" aria-hidden="true"></i><a href="#" id="collapse1open">全部展開</a>&nbsp;&nbsp;
                    <i class="fa fa-minus-square-o" aria-hidden="true"></i><a href="#" id="collapse1close">全部關閉</a>
                </div>
                <!-- right -->
            </div>
            <!-- twocol -->
            <!-- 收合內容開始 -->
            <div id="collapseblock" class="">
                <div class="collapseTitle font-size3">
                    <div class="filetitlewrapper"><span class="filetitle">進階設定</span></div>
                </div>
                <div>
                    <!-- 內容start -->
                    <div class="gentable margin5T">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td class="widht13 titlebg" align="right">
                                    <div class="font-title titlebackicon">範本</div>
                                </td>
                                <td class="width87">
                                    <select id="sele" class=" inputex width100">
                                        <option value="ex0" selected="selected">無</option>
                                        <option value="ex1">範例一</option>
                                        <option value="ex2">問題追蹤</option>
                                        <option value="ex3">進度管理</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td align="right" class="titlebg" nowrap="nowrap">
                                    <div class="font-title titlebackicon">起迄日期</div>
                                </td>
                                <td>
                                    <input id="starttime" type="text" class=" inputex width40 Jdatepicker" />&nbsp;~&nbsp;<input id="endtime" type="text" class=" inputex width40 Jdatepicker" /></td>
                            </tr>
                            <tr>
                                <td align="right" class="titlebg" nowrap="nowrap">
                                    <div class="font-title titlebackicon">主持人</div>
                                    <div style="display: none">
                                        <input type="text" id="emp_tex" runat="server" />
                                    </div>
                                </td>
                                <td>
                                    <input id="sa_tex" runat="server" type="text" class=" inputex width40" />&nbsp;
                                    <a onclick="Find_Empno1('emp_tex','1')">
                                        <img id="img_name" src="../EmployeeMultiSelect/images/icon_search.gif" border="0" class="ajax_mesg btn_mouseout" /><%--<i class="fa fa-binoculars" aria-hidden="true"/>--%>
                                    </a></td>
                            </tr>
                            <tr>
                                <td align="right" class="titlebg" nowrap="nowrap">
                                    <div class="font-title titlebackicon">助理/協同主持人</div>
                                    <div style="display: none">
                                        <input type="text" id="empa_tex" runat="server" class="emp" />
                                    </div>
                                </td>
                                <td>
                                    <input id="saa_tex" runat="server" type="text" class="emp inputex width40" />&nbsp;
                                    <a onclick="Find_Empno3('empa_tex','1')">
                                        <img id="img_saa" src="../EmployeeMultiSelect/images/icon_search.gif" border="0" class="ajax_mesg btn_mouseout" /><%--<i class="fa fa-binoculars" aria-hidden="true"/>--%>
                                    </a></td>

                            </tr>
                            <tr>
                                <td align="right" class="titlebg" nowrap="nowrap">
                                    <div class="font-title titlebackicon">人員</div>
                                    <div style="display: none"><input type="text" id="empno_tex" /></div>
                                </td>
                                <td>
                                    <input id="name_tex" type="text" class="emp inputex width80" />&nbsp;
                                    <a onclick="Find_Empno('empno_tex','2')">
                                        <%--<i class="fa fa-binoculars" aria-hidden="true"/>--%>
                                        <img id="img_promoter_name" src="../EmployeeMultiSelect/images/icon_search.gif" border="0" class="ajax_mesg btn_mouseout" />
                                    </a></td>
                            </tr>
                            <tr>
                                <td align="right" class="titlebg" nowrap="nowrap">
                                    <div class="font-title titlebackicon">上傳附檔</div>
                                </td>
                                <td>
                                    <input id="upload_btn" guid="" type="button" class="genbtn" value="上傳附檔" onclick="update()" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <!-- 內容ed -->
                <div class="margin10T">
                    <div class="collapseTitle font-size3">
                        <div class="filetitlewrapper"><span class="filetitle">畫面設定</span></div>
                    </div>
                    <div>
                        <!-- 內容start -->

                        <div class=" margin5T" id="color_edit">顏色:</div>
                        <select name="colorpicker">
                            <option value="#edf2f3">gray</option>
                            <option value="#B8E3FE">blue</option>
                            <option value="#b8fef7">blue1</option>
                            <option value="#b8fec2">green1</option>
                            <option value="#e6feb8">green</option>
                            <option value="#fee9b8">Yellow</option>
                            <option value="#FFCECE">pink1</option>
                            <option value="#F1CEFF">pink</option>
                        </select>
                    </div>
                    <!-- 內容ed -->
                </div>
            </div>
            <!-- collapseblock -->
            <div class="twocol margin10T">
                <div id="save" class="right"><a href="#" class="genbtn " onclick="tast()">儲存</a></div>
                <div class="right"><a href="#" class="genbtn closemagnificPopup">關閉</a></div>
            </div>


        </div>
        <!-- twocol -->
    </div>
    <!-- padding10ALL -->

    <!--magpopup編輯 -->
    <div id="edit_project" class="magpopup magSizeM mfp-hide">
        <div class="magpopupTitle">編輯專案</div>
        <div class="padding10ALL">
            <textarea id="edit_title" rows="2" class="inputexPlus width100 margin10B addplaceholder" placeholder="標題"></textarea>
            <textarea id="edit_text" rows="4" class="inputexPlus width100 addplaceholder" placeholder="內容請填於此..."></textarea>

            <!-- 收合內容開始 -->
            <div id="collapseblock1" class="">
                <div class="collapseTitle font-size3">
                    <div class="filetitlewrapper"><span class="filetitle">進階設定</span></div>
                </div>
                <div>
                    <!-- 內容start -->

                    <div class="gentable margin5T">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                           
                            <tr>
                                <td align="right" class="titlebg" nowrap="nowrap">
                                    <div class="font-title titlebackicon">起迄日期</div>
                                </td>
                                <td>
                                    <input id="edit_time_start" type="text" class=" inputex width40 Jdatepicker" />&nbsp;~&nbsp;<input id="edit_time_end" type="text" class=" inputex width40 Jdatepicker" /></td>
                            </tr>
                            <tr>
                                <td align="right" class="titlebg" nowrap="nowrap">
                                    <div class="font-title titlebackicon">主持人</div>
                                    <div style="display: none">
                                        <input type="text" id="edit_empno_sa" /></div>
                                </td>
                                <td>
                                    <input id="edit_text_sa" type="text" class=" inputex width40" />&nbsp;
                                    <a class="colse" onclick="Find_Empno1('edit_empno_sa','1')">
                                        <img id="img_name1" src="../EmployeeMultiSelect/images/icon_search.gif" border="0" class="ajax_mesg btn_mouseout" /><%--<i class="fa fa-binoculars" aria-hidden="true" />--%>
                                    </a>
                                </td>
                            </tr>
                             <tr>
                                <td align="right" class="titlebg" nowrap="nowrap">
                                    <div class="font-title titlebackicon">助理/協同主持人</div>
                                    <div style="display: none">
                                        <input type="text" id="edit_empno_a" runat="server" />
                                    </div>
                                </td>
                                <td>
                                    <input id="edit_name_a" runat="server" type="text" class=" inputex width40" />&nbsp;
                                    <a onclick="Find_Empno3('edit_empno_a','1')">
                                        <img id="img_sa" src="../EmployeeMultiSelect/images/icon_search.gif" border="0" class="ajax_mesg btn_mouseout" /><%--<i class="fa fa-binoculars" aria-hidden="true"/>--%>
                                    </a></td>

                            </tr>
                            <tr>
                                <td align="right" class="titlebg" nowrap="nowrap">
                                    <div class="font-title titlebackicon">人員</div>
                                    <div style="display: none">
                                        <input type="text" id="edit_empno_name" /></div>
                                </td>
                                <td>
                                    <input id="edit_text_name" type="text" class=" inputex width80" />&nbsp;
                                    <a class="colse" onclick="Find_Empno('edit_empno_name','2')">
                                        <%--<i class="fa fa-binoculars" aria-hidden="true" />--%>
                                        <img id="img_promoter_name1" src="../EmployeeMultiSelect/images/icon_search.gif" border="0" class="ajax_mesg btn_mouseout" />
                                    </a>
                                </td>
                            </tr>
                            <tr id="tr_upload">
                                <td align="right" class="titlebg" nowrap="nowrap">
                                    <div class="font-title titlebackicon">上傳附檔</div>
                                </td>
                                <td>
                                    <input id="edit_upload_btn" guid="" type="button" class="genbtn" value="上傳附檔" onclick="edit_update()" /></td>

                            </tr>
                            <tr>
                                <td align="right" class="titlebg" nowrap="nowrap">
                                    <div class="font-title titlebackicon">檔名</div>
                                </td>
                                <td>
                                    <ul id="file_download"></ul>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <!-- 內容ed -->
                <div id="div_color" class="margin10T">
                    <div class="collapseTitle font-size3">
                        <div class="filetitlewrapper"><span class="filetitle">畫面設定</span></div>
                    </div>
                    <div>
                        <!-- 內容start -->

                        <div class=" margin5T">顏色:</div>
                        <select name="colorpicker" id="color_save">
                            <option value="#edf2f3">gray</option>
                            <option value="#B8E3FE">blue</option>
                            <option value="#b8fef7">blue1</option>
                            <option value="#b8fec2">green1</option>
                            <option value="#e6feb8">green</option>
                            <option value="#fee9b8">Yellow</option>
                            <option value="#FFCECE">pink1</option>
                            <option value="#F1CEFF">pink</option>
                        </select>
                    </div>
                    <!-- 內容ed -->
                </div>
            </div>
            <!-- collapseblock -->
            
            <div class="twocol margin10T">                
                 <div class="right"><a href="#" class="genbtn closemagnificPopup">關閉</a></div>               
                <div id="edit_save" class="right"><a href="#" class="genbtn " onclick="save()">儲存</a></div>
               <div  id="save_log" class="left"><a href="#" class="genbtn " onclick="">紀錄檢視</a></div>
            </div>


        </div>
        <!-- twocol -->
    </div>
    <!-- padding10ALL -->
    <!--magpopup -->





    <!-- 本頁面使用的JS -->
    <script type="text/javascript">
        var p_user = $("#hello_empno").text(); //使用者傳值 原本傳guid  測試用666

        $(document).ready(function () {

            sharebuid();
            databuid();
           

            $("select[name='colorpicker']").simplecolorpicker();
            $("#monsortable").sortable({
                connectWith: "#monsortable"
            }).disableSelection();


            //顏色試用
            $("select[name='colorpicker']").change(function () {
                $("#pro_text").css("background-color", $("select[name='colorpicker']").find(":selected").val());
                $("#edit_text").css("background-color", $("select[name='colorpicker']").find(":selected").val());
            });


            //開窗動態綁定
            $('#open-popup-link').magnificPopup({
                type: 'inline',
                midClick: false, // 是否使用滑鼠中鍵
                closeOnBgClick: true,//點擊背景關閉視窗
                showCloseBtn: true,//隱藏關閉按鈕
                fixedContentPos: true,//彈出視窗是否固定在畫面上
                mainClass: 'mfp-fade',//加入CSS淡入淡出效果
                tClose: '關閉',//翻譯字串
            });

            //刪除看板 
            $('body').on('click', '.deleteboard', function () {
                var r = confirm("是否要刪除!");
                if (r == true) {
                    $.ajax({
                        type: "POST",
                        async: false, //在沒有返回值之前,不會執行下一步動作
                        url: "ashx/delete.ashx",
                        data: {
                            guid: $(this).parent("div").parent("div").parent("div").parent("li").attr("guid")
                        },
                        error: function (xhr) {
                            alert("Error " + xhr.status);
                            console.log(xhr.responseText);
                        },
                        success: function (data) {
                            alert(data);
                        }
                    });
                    databuid();
                } else {
                    return;
                }
                
            });

            //刪除file 
            $('body').on('click', '.delete_file', function () {

                $.ajax({
                    type: "POST",
                    async: false, //在沒有返回值之前,不會執行下一步動作
                    url: "ashx/edit_delete_file.ashx",
                    data: {
                        guid: $(this).parent("li").attr('guid')
                    },
                    error: function (xhr) {
                        alert("Error " + xhr.status);
                        console.log(xhr.responseText);
                    },
                    success: function (data) {
                        alert(data);
                    }
                });
                file_edit($("#edit_upload_btn").attr('guid'));

            });

            //新增專案
            $(document).on('click', "a[name='addboardbtn']", function () {
                $(".inputex").attr("readonly", false);
                $(".inputexPlus").attr("readonly", false);
                $(".emp").val('');
                $(".inputexPlus").val('');
                $("#sele").val('ex0');
                $("#collapseblock").trigger("close")
                //<option value="#edf2f3">
                upload_guid();
                $.magnificPopup.open({
                    items: {
                        src: '#editcardblock',
                        type: 'inline',
                        midClick: false, // 是否使用滑鼠中鍵
                        closeOnBgClick: true,//點擊背景關閉視窗
                        showCloseBtn: true,//隱藏關閉按鈕
                        fixedContentPos: true,//彈出視窗是否固定在畫面上
                        mainClass: 'mfp-fade',//加入CSS淡入淡出效果
                        tClose: '關閉'//翻譯字串
                    }
                });

            
            });

            //分享專案開啟
            $(document).on('click', "a[name='share_edit']", function () {
                var guid_g = $(this).parent("div").parent("div").parent("div").parent("li").attr("guid");
                edit_project(guid_g);
                file_edit(guid_g,'Y');
                $("#tr_upload").css("display", "none");            
                $("#edit_save").css("display", "none");
                $("#div_color").css("display", "none");
                $(".colse").css("display", "none");
                $(".inputex").attr("readonly", true);
                $(".inputexPlus").attr("readonly", true);
                $("#img_sa").css("display", "none");
                
                $.magnificPopup.open({
                    items: {
                        src: '#edit_project',
                        type: 'inline',
                        midClick: false, // 是否使用滑鼠中鍵
                        closeOnBgClick: true,//點擊背景關閉視窗
                        showCloseBtn: true,//隱藏關閉按鈕
                        fixedContentPos: true,//彈出視窗是否固定在畫面上
                        mainClass: 'mfp-fade',//加入CSS淡入淡出效果
                        tClose: '關閉'//翻譯字串
                    }
                });
                
            });

            //代入編輯專案
            $(document).on('click', "a[name='editbtn']", function () {
                var guid_g = $(this).parent("div").parent("div").parent("div").parent("li").attr("guid");
                $("#tr_upload").css("display", "");
                $("#edit_save").css("display", "");
                $("#div_color").css("display", "");
                $(".colse").css("display", "");
                $(".inputex").attr("readonly", false);
                $(".inputexPlus").attr("readonly", false);
                $("#img_sa").css("display", "");
                edit_project(guid_g);
                file_edit(guid_g,'N');

                $.magnificPopup.open({
                    items: {
                        src: '#edit_project',
                        type: 'inline',
                        midClick: false, // 是否使用滑鼠中鍵
                        closeOnBgClick: true,//點擊背景關閉視窗
                        showCloseBtn: true,//隱藏關閉按鈕
                        fixedContentPos: true,//彈出視窗是否固定在畫面上
                        mainClass: 'mfp-fade',//加入CSS淡入淡出效果
                        tClose: '關閉'//翻譯字串
                    }
                });
              
            });
            //昨天寫到這 ----貸出編輯紀錄 以跳窗模式展開 研究家彬給的fancybox
            $(document).on('click', "#save_log", function () {
                var guid_g = $("#edit_save").attr("guid");
                window.open('log.aspx?guid=' + $("#edit_upload_btn").attr('guid') + "&type=P", '紀錄查詢', config = 'height=450,width=700,toolbar=no');
                

            });

        });

        //匯入專案
        function databuid() {
            $.ajax({
                type: "POST",
                async: false, //在沒有返回值之前,不會執行下一步動作
                url: "trello_tast.ashx",
                data: {
                    project: p_user //u_guid 查詢
                },
                error: function (xhr) {
                    alert("Error " + xhr.status);
                    console.log(xhr.responseText);
                },
                success: function (data) {
                    $("#monsortable").empty();
                    var news = '<li><a name="addboardbtn" href= "#editcardblock" class="addbtnbox width100  open-popup-link" > <i class="fa fa-plus-circle font-size18" aria-hidden="true"></i> <br/>新增專案</a ></li >';
                    if (data != null) {
                        data = $.parseXML(data);
                        var tabstr = '';
                        if ($(data).find("data_item").length > 0) {
                            $(data).find("data_item").each(function (i) {
                                tabstr += "<li guid='" + $(this).children("p_guid").text().trim() + "'><div class='monbox widthFixbig'><div class='twocol margin10B'>";
                                //tabstr += "<div class='right'><a href='#edit_project' name='editbtn' class='editb open-popup-link' > 編輯</a> <a href='#' class='deleteboard'>";
                                tabstr += "<div class='right'><a href='javascript:void(0);' name='editbtn' class='editb open-popup-link' ><i class='fa fa-clipboard' aria-hidden='true'></i></a> <a href='#' class='deleteboard'>";
                                tabstr += "<i class='fa fa-times font-red' aria- hidden='true' ></i ></a ></div > <div class='left'><div class='inlineEditInput'><font size='4'>" + $(this).children("p_name").text().trim() + "</font></div></div>";
                                tabstr += "<div class='right'></div></div><ul><li class='sonbox additional-field-model' style= 'background:" + $(this).children("p_colar").text().trim() + "'>"
                                tabstr += "<div guid='" + $(this).children("p_guid").text().trim() + "' class='margin5TB lineheight02' style= 'background:" + $(this).children("p_colar").text().trim() + "; white-space:normal; cursor:pointer;' onclick='loc(this)' > ";
                                tabstr += $(this).children("p_text").text().trim() + ".......</div></li></ul><div class='margin5T'>";
                                tabstr += "<div class='left width50'>日期起迄：" + $(this).children("p_startdate").text().trim() + " ~" + $(this).children("p_enddate").text().trim();
                                tabstr += "<br/> 主持人：" + $(this).children("p_host").text().trim() + "<br/> 成員人數：" + $(this).children("p_groups").text().trim() + "</div></div></div></li>";
                            });
                            $("#monsortable").append(tabstr);
                        }
                      
                    }
                    $("#monsortable").append(news);
                }
            });
                       
            //讓ie9之前版本可以支援placeholder
            $('.addplaceholder').placeholder({ customClass: 'myplaceholder' });


        }
        //編輯時 代入專案
        function edit_project(guid_d) {
            $.ajax({
                type: "POST",
                async: false, //在沒有返回值之前,不會執行下一步動作
                url: "ashx/edit.ashx",
                data: {
                    guid: guid_d
                },
                error: function (xhr) {
                    alert("Error " + xhr.status);
                    console.log(xhr.responseText);
                },
                success: function (data) {
                    $("#edit_title").val('');
                    $("#edit_text").val('');
                    if ($(data).find("data_item").length > 0) {
                        $(data).find("data_item").each(function (i) {
                            $("#edit_title").val($(this).children("p_name").text().trim());
                            $("#edit_text").val($(this).children("p_text").text().trim());
                            $("#edit_save").attr("guid", $(this).children("p_guid").text().trim());
                            $("select[name='colorpicker']").val($(this).children("p_colar").text().trim());
                            $("#edit_time_start").val($(this).children("p_startdate").text().trim());
                            $("#edit_time_end").val($(this).children("p_enddate").text().trim());
                            $("#edit_text_sa").val($(this).children("p_host").text().trim());
                            $("#edit_text_name").val($(this).children("p_allname").text().trim());
                            $("#edit_empno_sa").val($(this).children("p_hostempno").text().trim());
                            $("#edit_empno_name").val($(this).children("p_allenpno").text().trim());
                            $("#edit_name_a").val($(this).children("p_host_name_a").text().trim());
                            $("#edit_empno_a").val($(this).children("p_host_empno_a").text().trim());                        
                            $("#edit_upload_btn").attr('guid', guid_d);
                        });

                    }

                }
            });
        }
        //update 編輯資料
        function save() {

            if (Date.parse($("#edit_time_start").val()).valueOf() > Date.parse($("#edit_time_end").val()).valueOf()) {
                alert("注意開始時間不能晚於結束時間！");
                return;
            }
            else {
                $.ajax({
                    type: "POST",
                    async: false, //在沒有返回值之前,不會執行下一步動作
                    url: "ashx/update.ashx",
                    data: {
                        guid: $('#edit_save').attr('guid'),
                        title: $("#edit_title").val(),
                        text: $("#edit_text").val(),
                        colar: $("#color_save").val(),
                        date_start: $("#edit_time_start").val(),
                        date_end: $("#edit_time_end").val(),
                        host: $("select[name='name_list']").val(),
                        host_name: $("#edit_text_sa").val(),
                        host_emp: $("#edit_empno_sa").val(),
                        all_emp: $("#edit_empno_name").val(),
                        allname: $("#edit_text_name").val(),
                        saa_name: $("#edit_name_a").val(),
                        saa_empno: $("#edit_empno_a").val()
                    },
                    error: function (xhr) {
                        alert("Error " + xhr.status);
                        console.log(xhr.responseText);
                    },
                    success: function (data) {
                        alert(data);

                        databuid();

                        $.magnificPopup.close();
                    }
                });
            }

        }
        //新增專案
        function tast() {
            var new_guid = "";
            new_guid = guid().toLocaleUpperCase();
            if ($("#pro_title").val() == '') {

                alert('請輸入標題');
                return;
            }
            if ($("#pro_text").val() == '') {
                alert('請輸入內容');
                return;
            }
            if ($("#sa_tex").val() == '') {
                alert('請選擇主持人');
                return;
            }
            if (Date.parse($("#starttime").val()).valueOf() > Date.parse($("#endtime").val()).valueOf()) {
                alert("注意開始時間不能晚於結束時間！");
                return;
            }

            $.ajax({
                type: "POST",
                async: false, //在沒有返回值之前,不會執行下一步動作
                url: "ashx/insert.ashx",
                data: {
                    guid: $('#upload_btn').attr('guid'),
                    title: $("#pro_title").val(),
                    text: $("#pro_text").val(),
                    type_new: $("#sele").val(),
                    colar: $("select[name='colorpicker']").val(),
                    datestart: $("#starttime").val(),
                    dateend: $("#endtime").val(),
                    host: $("select[name='name_list']").val(),
                    sa: $("#sa_tex").val(),
                    sa_emp: $("#emp_tex").val(),
                    name: $("#name_tex").val(),
                    empno: $("#empno_tex").val(),
                    saa_name: $("#saa_tex").val(),
                    saa_empno: $("#empa_tex").val(),
                    user: p_user
                    
                },
                error: function (xhr) {
                    alert("Error " + xhr.status);
                    console.log(xhr.responseText);
                },
                success: function (data) {
                    alert(data);
                }
            });
            databuid();

            $('div.inlineEditInput').inlineEdit('click');
            $(".sonsortable").sortable({
                connectWith: ".sonsortable"
            }).disableSelection();
            $("#pro_title").val('');
            $("#pro_text").val('');
            $("select[name='name_list']").val('');
            $("select[name='colorpicker']").val('');
            $("#sa_tex").val($("#saname").text());
            $("#emp_tex").val($("#hello_empno").text());
            $("#name_tex").val('');
            $("#saa_tex").val('');
            $.magnificPopup.close();
        }
        //匯入分享專案
        function sharebuid() {
            $.ajax({
                type: "POST",
                async: false, //在沒有返回值之前,不會執行下一步動作
                url: "ashx/share.ashx",
                data: {                   
                    user:p_user
                },
                error: function (xhr) {
                    alert("Error " + xhr.status);
                    console.log(xhr.responseText);
                },
                success: function (data) {
                    $("#sharelist").empty();                  
                    if (data != null) {
                        data = $.parseXML(data);
                        var tabstr = '';
                        if ($(data).find("data_item").length > 0) {
                            $(data).find("data_item").each(function (i) {
                                tabstr += "<li guid='" + $(this).children("p_guid").text().trim() + "'><div class='monbox widthFixbig'><div class='twocol margin10B'>";                         
                                tabstr += "<div class='right'><a href='javascript:void(0);' name='share_edit' class='editb open-popup-link' ><i class='fa fa-clipboard' aria-hidden='true'></i></a>";
                                tabstr += "</div > <div class='left'><div class='inlineEditInput'><font size='4'>" + $(this).children("p_name").text().trim() + "</font></div></div>";
                                tabstr += "<div class='right'></div></div><ul><li class='sonbox additional-field-model' style= 'background:" + $(this).children("p_colar").text().trim() + "'>"
                                tabstr += "<div guid='" + $(this).children("p_guid").text().trim() + "' class='margin5TB lineheight02' style= 'background:" + $(this).children("p_colar").text().trim() + "; white-space:normal; cursor:pointer;' onclick='loc(this)' > ";
                                tabstr += $(this).children("p_text").text().trim() + ".......</div></li></ul><div class='margin5T'>";
                                tabstr += "<div class='left width50'>日期起迄：" + $(this).children("p_startdate").text().trim() + " ~" + $(this).children("p_enddate").text().trim();
                                tabstr += "<br/> 主持人：" + $(this).children("p_host").text().trim() + "<br/> 成員人數：" + $(this).children("p_groups").text().trim() + "</div></div></div></li>";
                            });
                            $("#sharelist").append(tabstr);
                        }
                       
                    }
                }
            });

        }
        //代入上傳檔案
        function file_edit(guid_g, share) {
            if (share == 'N') {
                $.ajax({
                    type: "POST",
                    async: false, //在沒有返回值之前,不會執行下一步動作
                    url: "ashx/edit_file.ashx",
                    data: {
                        guid: guid_g
                    },
                    error: function (xhr) {
                        alert("Error " + xhr.status);
                        console.log(xhr.responseText);
                    },
                    success: function (data) {
                        $("#file_download").empty();
                        var tbstr = '';
                        if ($(data).find("data_item").length > 0) {
                            $(data).find("data_item").each(function (i) {
                                tbstr += '<li guid=' + $(this).children("file_encryname").text().trim() + '><a class="delete_file" href="#">'
                                tbstr += '<i class="fa fa-times font-red" aria- hidden="true"></i></a>' + $(this).children("file_orgname").text().trim()
                                tbstr += $(this).children("file_exten").text().trim() + '</li> '
                            });
                            $("#file_download").append(tbstr);
                        }
                    }
                }); 
            }
            else if (share=='Y') {
                $.ajax({
                    type: "POST",
                    async: false, //在沒有返回值之前,不會執行下一步動作
                    url: "ashx/edit_file.ashx",
                    data: {
                        guid: guid_g
                    },
                    error: function (xhr) {
                        alert("Error " + xhr.status);
                        console.log(xhr.responseText);
                    },
                    success: function (data) {
                        $("#file_download").empty();
                        var tbstr = '';
                        if ($(data).find("data_item").length > 0) {
                            $(data).find("data_item").each(function (i) {
                                tbstr += '<li guid=' + $(this).children("file_encryname").text().trim() + '>'
                                tbstr += '<a href="D:\\' + $(this).children("file_encryname").text().trim() + '.' + $(this).children("file_exten").text().trim() + '" download="' + $(this).children("file_orgname").text().trim()+'">'
                                tbstr += $(this).children("file_orgname").text().trim() + '.'
                                tbstr += $(this).children("file_exten").text().trim() + '</a></li> '
                            });
                            $("#file_download").append(tbstr);
                        }
                    }
                }); 
            }
        }
        //導回首頁
        function back() {
            location.href = "trello_tast.aspx?";
        }
        // js抓自訂屬性 getAttribute 抓guid
        function loc(guid_me) {
            location.href = "trello_sub.aspx?id=" + guid_me.getAttribute("guid") + "&name=" + $("#hello_empno").text();
        }
        //呼叫上傳頁面
        function update() {
            window.open('File_Upload.aspx?id=' + $("#upload_btn").attr('guid'), '附檔上傳', config = 'height=450,width=450,toolbar=no');
        }
        //呼叫上傳頁面_編輯時
        function edit_update() {
            window.open('File_Upload.aspx?id=' + $("#edit_upload_btn").attr('guid'), '附檔上傳', config = 'height=450,width=450,toolbar=no');
        }
        //傳入guid至上傳頁面
        function upload_guid() {
            var ggd = guid();
            $("#upload_btn").attr("guid", ggd);
        }

        //成員挑選
        function Find_Empno(obj, arg_sw) {
            $(".ajax_mesg").colorbox({
                href: "../EmployeeMultiSelect/EmployeeWindow.aspx?hfValue=" + $('#' + obj).val()
                , iframe: true, width: "780px", height: "600px", transition: "none", opacity: "0.5", overlayClose: false
                , title: '多人挑選'             
                , onClosed: function () {
                    $('html, body').css('overflow', '');
                    var strURL = '../EmployeeMultiSelect/ret_employee_kw.aspx';
                    if (arg_sw == "2") {
                        $.getJSON(strURL + '?callback=?', jsonp_callback2);
                    }
                }
            });
        }

        //成員挑選
        function jsonp_callback2(data) {
            switch (data.c_com_cname) {
                case "danger":
                    alert("有危險字眼!");
                    break;
                case "error0":
                    alert("查無此人 或 空值!");
                    break;
                case "error2":
                    alert("查到的資料有2筆以上,請填較精確的值!");
                    break;
                default:
                    $('#name_tex').val(data.c_com_cname);
                    $('#edit_text_name').val(data.c_com_cname);
                    $('#empno_tex').val(data.c_com_empno);
                    $('#edit_empno_name').val(data.c_com_empno);
            }
        }

        //主持人挑選
        function Find_Empno1(obj, arg_sw) {
            $(".ajax_mesg").colorbox({
                href: "../EmployeeSingleSelect/EmployeeSingleWindow.aspx"
                , iframe: true, width: "700px", height: "630px", transition: "none", opacity: "0.5", overlayClose: false
                , title: '單人挑選'
                , onClosed: function () {
                    $('html, body').css('overflow', '');
                    var strURL = '../EmployeeSingleSelect/ret_employee_kw.aspx';
                    if (arg_sw == "1") {
                        $.getJSON(strURL + '?callback=?', jsonp_callback1);
                    }
                }
                
            });
        }

        //主持人挑選
        function jsonp_callback1(data) {
            switch (data.c_com_cname) {
                case "danger":
                    alert("有危險字眼!");
                    break;
                case "error0":
                    alert("查無此人 或 空值!");
                    break;
                case "error2":
                    alert("查到的資料有2筆以上,請填較精確的值!");
                    break;
                default:
                    $('#emp_tex').val(data.c_com_empno);
                    $('#edit_empno_sa').val(data.c_com_empno);
                    $('#sa_tex').val(data.c_com_cname);
                    $('#edit_text_sa').val(data.c_com_cname);
            }
        }

        //助理主持人挑選
        function Find_Empno3(obj, arg_sw) {
            $(".ajax_mesg").colorbox({
                href: "../EmployeeSingleSelect/EmployeeSingleWindow.aspx"
                , iframe: true, width: "700px", height: "630px", transition: "none", opacity: "0.5", overlayClose: false
                , title: '單人挑選'
                , onClosed: function () {
                    $('html, body').css('overflow', '');
                    var strURL = '../EmployeeSingleSelect/ret_employee_kw.aspx';
                    if (arg_sw == "1") {
                        $.getJSON(strURL + '?callback=?', jsonp_callback3);
                    }
                }

            });
        }

        //助理主持人挑選
        function jsonp_callback3(data) {
            switch (data.c_com_cname) {
                case "danger":
                    alert("有危險字眼!");
                    break;
                case "error0":
                    alert("查無此人 或 空值!");
                    break;
                case "error2":
                    alert("查到的資料有2筆以上,請填較精確的值!");
                    break;
                default:
                    $('#empa_tex').val(data.c_com_empno);
                    $('#edit_empno_a').val(data.c_com_empno);
                    $('#saa_tex').val(data.c_com_cname);
                    $('#edit_name_a').val(data.c_com_cname);
            }
        }


        //產生guid
        function guid() {
            function s4() {
                return Math.floor((1 + Math.random()) * 0x10000).toString(16).substring(1);
            }
            return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
        }
        //時間日期格式統一
        $(function () {
            NowDate = new Date()
            $("#starttime").val(NowDate.getFullYear() + "-" + (NowDate.getMonth() + 1) + "-" + NowDate.getDate());

            $("#starttime").datepicker({ dateFormat: "yy-mm-dd" });

        });
        $(function () {
            $("#endtime").val('2018-12-31');
            $("#endtime").datepicker({ dateFormat: "yy-mm-dd" });
        });
        $(function () {
            $("#edit_time_start").datepicker({ dateFormat: "yy-mm-dd" });
        });
        $(function () {
            $("#edit_time_end").datepicker({ dateFormat: "yy-mm-dd" });
        });

        //RWD切換我的專案與分享
        $("#switchmycasebtn").click(function () {
            $("body").removeClass("sharebg");
            $("#mycasewrapper").removeClass("RWDhide");
            $("#sharecasewrapper").addClass("RWDhide");

        });

        $("#switchsharecasebtn").click(function () {
            $("body").addClass("sharebg");
            $("#sharecasewrapper").removeClass("RWDhide");
            $("#mycasewrapper").addClass("RWDhide");

        });
        //讓ie9之前版本可以支援placeholder
        $('.addplaceholder').placeholder({ customClass: 'myplaceholder' });

        //收合展開
        $("#collapseblock").collapse({
            query: 'div.collapseTitle',//收合標題樣式名
            persist: false,//是否記憶收合,需配合jquery.collapse_storage.js
            open: function () {
                this.slideDown(100);//動畫效果
            },
            close: function () {
                this.slideUp(100);//動畫效果
            },
        });

        //收合展開
        $("#collapse1open").click(function () {
            $("#collapseblock").trigger("open")
        });
        $("#collapse1close").click(function () {
            $("#collapseblock").trigger("close")
        });

    </script>


    <script type="text/javascript" src="js/GenCommon.js"></script>
    <!-- UIcolor JS -->
    <script type="text/javascript" src="js/PageCommon.js"></script>
    <!-- 系統共用 JS -->
    <script type="text/javascript" src="js/autoHeight.js"></script>
    <!-- 高度不足頁面的絕對置底footer -->
</body>

</html>
