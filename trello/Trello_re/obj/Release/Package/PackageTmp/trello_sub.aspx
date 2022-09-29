<%@ Page Language="C#" AutoEventWireup="true" Inherits="trello_sub" Codebehind="trello_sub.aspx.cs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=11; IE=10; IE=9; IE=8" />
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta name="keywords" content="關鍵字內容" />
<meta name="description" content="描述" /><!--告訴搜尋引擎這篇網頁的內容或摘要。--> 
<meta name="generator" content="Notepad" /><!--告訴搜尋引擎這篇網頁是用什麼軟體製作的。--> 
<meta name="author" content="工研院 資科中心" /><!--告訴搜尋引擎這篇網頁是由誰製作的。--> 
<meta name="copyright" content="本網頁著作權所有" /><!--告訴搜尋引擎這篇網頁是...... --> 
<meta name="revisit-after" content="3 days" /><!--告訴搜尋引擎3天之後再來一次這篇網頁，也許要重新登錄。-->
<title>專案內容</title>
<link rel="stylesheet" href="css/bootstrap.css" /><!-- normalize & bootstrap's grid system -->
<link href="css/font-awesome.min.css" rel="stylesheet"/><!-- css icon -->
<link href="css/superfish.css" rel="stylesheet" type="text/css" /><!-- 下拉選單 -->
<link href="css/jquery.mmenu.css" rel="stylesheet" type="text/css" /><!-- mmenu css:行動裝置選單 -->
<link href="css/jquery.powertip.css" rel="stylesheet" type="text/css" /><!-- powertip:tooltips -->
<link href="css/jquery.datetimepicker.css" rel="stylesheet" type="text/css" /><!-- datepicker -->
<link href="css/magnific-popup.css" rel="stylesheet" type="text/css" /><!-- popup dialog -->
<link href="css/OchiLayout.css" rel="stylesheet" type="text/css" /><!-- ochsion layout base -->
<link href="css/OchiColor.css" rel="stylesheet" type="text/css" /><!-- ochsion layout color -->
<link href="css/OchiRWD.css" rel="stylesheet" type="text/css" /><!-- ochsion layout RWD -->
<link href="css/style.css" rel="stylesheet" type="text/css" />
<!-- IE 瀏覽器版本低於 9 處理 -->
<!--[if lte IE 9]>
<link href="css/cssie9.css" rel="stylesheet" type="text/css" />
<![endif]-->
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="js/jquery.breakpoint-min.js"></script><!-- 斷點設定 -->
<script type="text/javascript" src="js/superfish.min.js"></script><!-- 下拉選單 -->
<script type="text/javascript" src="js/supposition.js"></script><!-- 下拉選單:修正最後項在視窗大小不夠時的BUG -->
<script type="text/javascript" src="js/jquery.mmenu.min.js"></script><!-- mmenu js:行動裝置選單 -->
<script type="text/javascript" src="js/jquery.touchSwipe.min.js"></script><!-- 增加JS觸控操作 for mmenu -->
<script type="text/javascript" src="js/jquery.powertip.min.js"></script><!-- powertip:tooltips -->
<script type="text/javascript" src="js/jquery.datetimepicker.js"></script><!-- datepicker -->
<script type="text/javascript" src="js/jquery.easytabs.min.js"></script><!-- easytabs tab -->
<script type="text/javascript" src="js/jquery.magnific-popup.min.js"></script><!-- popup dialog -->
<script type="text/javascript" src="js/jquery-ui.min.js"></script><!-- 拖拉元件 -->
<script type="text/javascript" src="js/jquery.ns-autogrow.min.js"></script><!-- textarea autogrow -->
<script type="text/javascript" src="js/jquery.inline-edit.js"></script>
<script type="text/javascript" src="js/jquery.simplecolorpicker.js"></script>
<script src="js/jquery-ui.js"></script>
    <!-- dialog -->
<script src="js/jquery.colorbox-min.js"></script>
<script type="text/javascript" src="js/jquery.placeholder.min.js"></script>
<script type="text/javascript" src="js/jquery.collapse.js"></script><!-- 收合展開 -->
<script type="text/javascript" src="js/jquery.collapse_storage.js"></script><!-- 收合展開:增加記憶功能 -->
<link href="css/colorbox.css" rel="stylesheet" />
</head>
<body>
<!-- 開頭用div:修正mmenu form bug -->
<div>
    <form id="form1" runat="server">
<div class="WrapperBody">
	<div class="WrapperHeader">
		<div class="MainMenu">
        <!-- 置中版面控制:滿版可移除container或改成container-fluid -->
			<div class="twocol padding5RL">
            	<div class="left"><a class="font-bold font-size4 font-white padding5TB" href="trello_tast.aspx"><img src="images/logo.png"/>&nbsp;ITRI專案管理模組</a></div><!-- left -->
                <div class="right">
                	<div class="padding5TB"><span id="hello"  runat="server" style="color:white">   </span><p id="helloempno"  runat="server" style="display:none"></p></div>
                </div><!-- right -->
            </div><!-- twocol -->      
		</div><!-- MainMenu -->    
    </div><!-- WrapperHeader -->
   

   <div class="margin15T padding10RL">
   
   
<ul class='monsortable monlist padding10TB' id="monsortable">
</ul>  


   
   </div><!-- margin15T -->
   
        
</div><!-- WrapperBody -->

<div class="WrapperFooter">
	<div class="footerblock container font-white">
版權所有©2018 工業技術研究院｜ 建議瀏覽解析度1024x768以上<br />
業務窗口：劉冠麟(分機：19487)｜網站製作：資科中心｜意見反應｜系統使用說明書
	</div><!--{* footerblock *}-->
</div><!-- WrapperFooter -->

<!-- 側邊選單內容:動態複製主選單內容 -->
<div id="sidebar-wrapper">
   
</div><!-- sidebar-wrapper -->

      
    </form>
</div>
<!-- 結尾用div:修正mmenu form bug -->

<!-- Magnific Popup -->
<div id="editcardblock" class="magpopup magSizeM mfp-hide">
  <div id="title_card" class="magpopupTitle">編輯卡片</div>
  <div class="padding10ALL">
      <div class="row">
      <div class="col-lg-6 col-md-6">
 		<div class="margin5B font-size3">卡片內容</div>
				<textarea id="card_title" rows="2" class="card  inputexPlus width100 margin10B addplaceholder" style="min-height:40px;" placeholder="標題"></textarea>
  				<textarea id="card_text" rows="4" class="card inputexPlus width100 addplaceholder" style="min-height:200px;" placeholder="內容請填於此..."></textarea>
	    
        <p id="sa_p"></p>
        卡片負責人:
      <select id="card_host"></select><br />
        起訖日期:
      <input id="card_start_time" type="text" style="width:120px" class="card Jdatepicker time" />&nbsp;~&nbsp;<input id="card_end_time"  style="width:120px" type="text" class="card Jdatepicker time" />          
          <input id="upload_btn" type="button" class="genbtn"  value="上傳檔案"/>
          <ul id="file_ul"></ul>
          </div><!-- col -->
          			<div id="chat_all" class="col-lg-6 col-md-6">
					<div class="margin5B font-size3">討論區</div>
					<div id="chat_scr" class="bbsheight bbsbg">
						<div id="chat_room" class="bbstrueheight" style="height:350px;" >
	
						</div><!-- bbstrueheight -->
					</div><!-- bbsheight -->
					<textarea id="text_send" rows="4" class="inputexPlus width100 addplaceholder margin5T" style="min-height:60px;" placeholder="我想說..."></textarea>
					<div id="chat_send" class=" textright margin5T"><a href="#" class="genbtnS">發表</a></div>
			</div><!-- col -->
          </div>
  	<div class="twocol margin10T">
    	    <div class="left"><a id="card_log" href="#" class="genbtn">紀錄檢視</a></div>
          <div class="right"><input id="cd_guid_tex" type="text" style="display:none" value=""/><a href="#" class="genbtn closemagnificPopup">關閉</a><a id="save" guid="" href="#" class="genbtn closemagnificPopup">建立</a><a id="edit" style="display:none" guid="" href="#" class="genbtn closemagnificPopup">編輯</a></div>
    </div><!-- twocol -->
  </div><!-- padding10ALL -->
</div><!--magpopup -->



    <!-- Magnific Popup -->
<div id="insert_sub" class="magpopup magSizeM mfp-hide">
  <div id="title_div" class="magpopupTitle">編輯子項目</div>
  <div class="padding10ALL">
  子項目標題:
  <textarea id="add_sub_title" rows="1" class="inputex width100 margin10B" style="height:30px;"></textarea>
  子項目內文:
  <textarea id="add_sub_text" rows="3" class="inputex width100" style="height:80px;"></textarea>
      子項目主持人:
      <select id="sub_host"></select><br />
      子項目成員:
    <div style="width:350px;height:200px;overflow:auto;">
        <ul  id="sub_team"></ul>
    </div>  
      起訖日期:
      <input id="starttime" type="text" class=" Jdatepicker" />&nbsp;~&nbsp;<input id="endtime" type="text" class="  Jdatepicker" /><%--inputex width40--%>
  	<div class="twocol margin10T">        
    	<div class="right"><a href="#" class="genbtn closemagnificPopup">關閉</a></div>
        <div id="save_div" class="right"><a href="#" name="save_btn" class="genbtn closemagnificPopup" onclick="insert_sub()">儲存</a></div>
          <div id="edit_div" class="right" style="display:none"><a name="edit_btn" href="#" class="genbtn closemagnificPopup" onclick="update_sub()" >編輯</a></div>
          <div class="left"><a id="log" href="#" class="genbtn">紀錄檢視</a></div>
    </div><!-- twocol -->
  </div><!-- padding10ALL -->
   
</div><!--magpopup -->



<!-- 本頁面使用的JS -->
<script type="text/javascript">   
    var p_id = getParameterName('id');
    var sa = getParameterName('name');
$(document).ready(function(){
    
    $("#sub_host").val(sa);
    $("#monsortable").sortable({
        connectWith: "#monsortable",
    }).disableSelection();


    databuid();

    team_list($("#sub_host").val());
    //子項目排序
    $("#monsortable").on("sortupdate", function (event, ui) {

        var tmpval = "";
        $("li[name='subgid']").each(function () {
            if (tmpval != "") tmpval += ",";
            tmpval += $(this).attr("guid");
        });

        $.ajax({
            type: "POST",
            async: false, //在沒有返回值之前,不會執行下一步動作
            url: "ashx/sub_sort.ashx",
            data: {
                sub_sort: tmpval
            },
            error: function (xhr) {
                alert("Error " + xhr.status);
                console.log(xhr.responseText);
            },
            success: {

            }
        });


    });
    //卡片排序
     $(".selector").on("sortupdate", function (event, ui) {

        var tmpval = "";
        $("li[name='cardgid']").each(function () {
            if (tmpval != "") tmpval += ",";
            tmpval += $(this).attr("guid");
        });

        $.ajax({
            type: "POST",
            async: false, //在沒有返回值之前,不會執行下一步動作
            url: "ashx/card_sort.ashx",
            data: {
                card_sort: tmpval
            },
            error: function (xhr) {
                alert("Error " + xhr.status);
                console.log(xhr.responseText);
            },
            success: {

            }
        });


    });

    //傳送輸入內容
    $(document).on('click', '#chat_send', function () {
        if ($("#text_send").val() == '') {
            return;
        }
        else {
            $.ajax({
                type: "POST",
                async: false, //在沒有返回值之前,不會執行下一步動作
                url: "ashx/chat_insert.ashx",
                data: {
                    guid: $("#save").attr('guid'),
                    user: sa,
                    text: $("#text_send").val(),

                },
                error: function (xhr) {
                    alert("Error " + xhr.status);
                    console.log(xhr.responseText);
                }
            });
            chat_buid($("#save").attr('guid'));
            $("#text_send").empty();
        }      
    });
    //卡片拖曳 位置交換 
    $(".selector").on("sortreceive", function (event, item) {       
        $.ajax({
            type: "POST",
            async: false, //在沒有返回值之前,不會執行下一步動作
            url: "ashx/card_change.ashx",
            data: {
                s_guid: $(this).attr("guid"),
                cd_guid: item.item[0].getAttribute("guid"),
                user:sa
            },
            error: function (xhr) {
                alert("Error " + xhr.status);
                console.log(xhr.responseText);
            }
        });
    });
    
    //刪除子項目 
    $('body').on('click', '.deleteboard', function () {      
    $.ajax({
        type: "POST",
        async: false, //在沒有返回值之前,不會執行下一步動作
        url: "ashx/sub_delete.ashx",
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

});

    //新增卡片
    $('body').on('click', '.addcardbtn', function () {
        $("#card_log").css("display", "none");
        $(".card").attr("readonly", false);
        $("#chat_all").css("display", "none");
        $("#file_ul").empty();
        $("#save").attr("guid", $(this).parent("div").parent("div").parent("li").attr("guid"));
        $("#save").css("display", "");
        $("#edit").css("display", "none");
        $("#upload_btn").css("display", "");
        $("#card_title").empty();
        $("#card_text").empty();
        $("#sa_p").css("display", "none");
        card_host_val = sa;
        var new_guid = guid().toLocaleUpperCase();
        $("#cd_guid_tex").val(new_guid);
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
        $(function () {
            NowDate = new Date()
            $("#card_start_time").val(NowDate.getFullYear() + "-" + (NowDate.getMonth() + 1) + "-" + NowDate.getDate());

            $("#card_start_time").datepicker({ dateFormat: "yy/mm/dd" });

        });
        $(function () {
            $("#card_end_time").val('2018-12-31');
            $("#card_end_time").datepicker({ dateFormat: "yy/mm/dd" });
        });
        $("#card_host").val($("#helloempno").text());
    });
    //刪除卡片
    $(document).on('click', '.deletecard', function () {       
        $.ajax({
            type: "POST",
            async: false, //在沒有返回值之前,不會執行下一步動作
            url: "ashx/card_delete.ashx",
            data: {
                guid: $(this).parent("div").parent("li").attr("guid")
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
    });
    //代出編輯卡片
    $(document).on('click', "a[name='chat_card']", function () {
        $("#card_log").css("display", "");
        $("#chat_all").css("display", "");
        $(".card").attr("readonly", false);
        $("#title_card").text("卡片編輯")
        $("#edit").css("display", "");
        $("#save").css("display", "none");
        $("#upload_btn").css("display", "");
        $("#sa_p").css("display", "");
        $.ajax({
            type: "POST",
            async: false, //在沒有返回值之前,不會執行下一步動作
            url: "ashx/card_view.ashx",
            data: {
                guid: $(this).parent("div").parent("li").attr("guid")
            },
            error: function (xhr) {
                alert("Error " + xhr.status);
                console.log(xhr.responseText);
            },
            success: function (data) {
                $("#card_title").val('');
                $("#card_text").val('');
                if ($(data).find("data_item").length > 0) {
                    $(data).find("data_item").each(function (i) {
                        $("#save").attr("guid", $(this).children("cd_guid").text().trim());
                        $("#card_title").val($(this).children("cd_title").text().trim());
                        $("#sa_p").text('建立者:' + $(this).children("cd_user").text().trim());
                        $("#card_text").val($(this).children("cd_text").text().trim());
                        $("#card_start_time").val($(this).children("cd_start_time").text().trim());
                        $("#card_end_time").val($(this).children("cd_end_time").text().trim());
                        $("#card_host").val($(this).children("cd_host").text().trim());
                    });

                }

            }
        });

        file_edit($(this).parent("div").parent("li").attr("guid"));
        chat_buid($(this).parent("div").parent("li").attr("guid"));
       
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

    //upadate卡片
    $(document).on('click', "#edit", function () {
        $.ajax({
            type: "POST",
            async: false, //在沒有返回值之前,不會執行下一步動作
            url: "ashx/card_update.ashx",
            data: {
                guid: $("#save").attr('guid'),
                title: $("#card_title").val(),
                text: $("#card_text").val(),
                host: $("#card_host").val(),
                start_time: $("#card_start_time").val(),
                end_time: $("#card_end_time").val(),
                user: sa
                
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



    });
    //建立卡片
    $(document).on('click', "#save", function () {
       
        $.ajax({
            type: "POST",
            async: false, //在沒有返回值之前,不會執行下一步動作
            url: "ashx/card_insert.ashx",
            data: {
                cd_guid: $("#cd_guid_tex").val(),
                s_guid: $("#save").attr("guid"),
                p_guid: getParameterName('id'),
                title: $("#card_title").val(),
                text: $("#card_text").val(),
                user: sa,
                host: card_host_val,    /*$("#card_host:selected").val()*/       
                start_time: $("#card_start_time").val(),
                end_time: $("#card_end_time").val()
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

        //讓textarea可以自動延伸
        $('textarea').autogrow({
            horizontal: false,//控制水平不要自動延伸
        });
        //開窗動態綁定
        $('.open-popup-link').magnificPopup({
            type: 'inline',
            midClick: false, // 是否使用滑鼠中鍵
            closeOnBgClick: true,//點擊背景關閉視窗
            showCloseBtn: true,//隱藏關閉按鈕
            fixedContentPos: true,//彈出視窗是否固定在畫面上
            mainClass: 'mfp-fade',//加入CSS淡入淡出效果
            tClose: '關閉',//翻譯字串
        });
        $.magnificPopup.close();
    });
    //人員選取事件
    var card_host_val = '';
    $("#card_host").change(function () {
        $(this).attr("selected", "selected"); //或是給"selected"也可 
        card_host_val = $(this).val();
    });
    //編輯子項目
    $(document).on('click', "a[name='editbtn']", function () {
        var guid_g = $(this).parent("div").parent("div").parent("div").parent("li").attr("guid");
        $("#save_div").css("display", "none");
        $("#edit_div").css("display", "");
        $("#title_div").text("編輯子項目");
        $("#log").css("display", "");
        edit_sub(guid_g);
        edit_sub_team_list(guid_g);
        $.magnificPopup.open({
            items: {
                src: '#insert_sub',
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
    //新增子項目
    $(document).on('click', "a[name='insert_btn']", function () {
        var guid_g = $(this).parent("div").parent("div").parent("div").parent("li").attr("guid");
        $("#add_sub_title").val('')
        $("#add_sub_text").val('')
        $("#save_div").css("display", "");
        $("#edit_div").css("display", "none");
        $("#title_div").text("新增子項目")
        $("#starttime").empty();
        $("#endtime").empty();
       
        $.magnificPopup.open({
            items: {
                src: '#insert_sub',
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
    $(document).on('click', "#addboardbtn1", function () {
        var guid_g = $(this).parent("div").parent("div").parent("div").parent("li").attr("guid");
        $("#add_sub_title").val('')
        $("#add_sub_text").val('')
        $("#save_div").css("display", "");
        $("#edit_div").css("display", "none");
        $("#title_div").text("新增子項目");   
        $("#log").css("display", "none");
        team_list()
        $("#sub_host").val(sa);
        $.magnificPopup.open({
            items: {
                src: '#insert_sub',
                type: 'inline',
                midClick: false, // 是否使用滑鼠中鍵
                closeOnBgClick: true,//點擊背景關閉視窗
                showCloseBtn: true,//隱藏關閉按鈕
                fixedContentPos: true,//彈出視窗是否固定在畫面上
                mainClass: 'mfp-fade',//加入CSS淡入淡出效果
                tClose: '關閉'//翻譯字串
            }
        });
        $(function () {
            NowDate = new Date()
            $("#starttime").val(NowDate.getFullYear() + "-" + (NowDate.getMonth() + 1) + "-" + NowDate.getDate());

            $("#starttime").datepicker({ dateFormat: "yy/mm/dd" });

        });
        $(function () {
            $("#endtime").val('2018-12-31');
            $("#endtime").datepicker({ dateFormat: "yy/mm/dd" });
        });
    });
    //上傳檔案頁面
    $(document).on('click', '#upload_btn', function () {
        window.open('File_Upload.aspx?id=' + $("#cd_guid_tex").val() + '&type=02', '附檔上傳', config = 'height=450,width=450,toolbar=no');
        file_edit($("#cd_guid_tex").val(),'Y');
    });
    //刪除檔案
    $(document).on('click', '.delete_file', function () {
        
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
        file_edit($("#save").val());

    });
    //檢視編輯紀錄 log
    $(document).on('click', '#log', function () {
        var guid_g = $("#edit_save").attr("guid");
        window.open('log.aspx?guid=' + $("#edit_div").attr('guid') + "&type=S", '紀錄查詢', config = 'height=450,width=700,toolbar=no');
    });
    //卡片檢視編輯紀錄LOG
    $(document).on('click', '#card_log', function () {
        var guid_g = $("#edit_save").attr("guid");
        window.open('log.aspx?guid=' + $("#save").attr('guid') + "&type=C", '紀錄查詢', config = 'height=450,width=700,toolbar=no');
    });
    });
    //資料匯入
    function databuid() {
        $.ajax({
            type: "POST",
            async: false, //在沒有返回值之前,不會執行下一步動作
            url: "ashx/trello_sub.ashx",
            data: {
                project: p_id //u_guid 查詢
            },
            error: function (xhr) {
                alert("Error " + xhr.status);
                console.log(xhr.responseText);
            },
            success: function (data) {
                $("#monsortable").empty();
                var news = ' <li><a href="#" class="addbtnbox width100" id="addboardbtn1"><i class="fa fa-plus-circle font-size18" aria-hidden="true"></i><br>新增看板</a></li>';
                if (data != null) {
                    data = $.parseXML(data);
                    var j = 0;
                    var tabstr = ''; /*javascript: void (0); '*/
                    if ($(data).find("data_item").length > 0) {                       
                        $(data).find("data_item").each(function (i) {
                            tabstr += "<li guid =" + $(this).children("s_guid").text().trim() + " class='selector' name='subgid'><div class='monbox widthFixbig'><div class='twocol margin10B'><div class='left'><div class='inlineEditInput'>" + $(this).children("s_name").text().trim() + "</div></div>";
                            tabstr += "<div class='right'><a href='#' name='editbtn' class='editb open-popup-link' ><i class='fa fa-pencil' aria-hidden='true'></i></a><a href='#' class='deleteboard'><i class='fa fa-times font-red' aria-hidden='true'></i></a></div ></div >"
                            tabstr += "<ul  class='sonsortable' guid=" + $(this).children("s_guid").text().trim() + " ></ul> <div class='margin5T font-normal'guid=" + $(this).children("s_guid").text().trim() + " ><a href='#' class='addcardbtn'>新增卡片</a></div></div ></li >";
                        });
                       
                    }
                    if ($("p_colar", data).text().trim() != "#edf2f3") {
                        $('body').css('background', $("p_colar", data).text().trim());
                    }                   
                }
                $("#monsortable").append(tabstr+news);
            }
        });
        card_buid();
        $("#save_div").css("display", "");
        $("#edit_div").css("display", "none");
        $(".sonsortable").sortable({
            connectWith: ".sonsortable",
            dropOnEmpty: false
        }).disableSelection();

        $(".selector").on("sortreceive", function (event, item) {
            $.ajax({
                type: "POST",
                async: false, //在沒有返回值之前,不會執行下一步動作
                url: "ashx/card_change.ashx",
                data: {
                    s_guid: $(this).attr("guid"),
                    cd_guid: item.item[0].getAttribute("guid"),
                    user: sa
                },
                error: function (xhr) {
                    alert("Error " + xhr.status);
                    console.log(xhr.responseText);
                }
            });
            databuid();

        });
    }

    //子項目成員匯入
    function team_list() {
        $.ajax({
            type: "POST",
            async: false, //在沒有返回值之前,不會執行下一步動作
            url: "ashx/team_list.ashx",
            data: {
                project: p_id //u_guid 查詢               
            },
            error: function (xhr) {
                alert("Error " + xhr.status);
                console.log(xhr.responseText);
            },
            success: function (data) {
                $("#sub_host").empty();
                $("#sub_team").empty();
                $("#card_host").empty();
                if (data != null) {
                    data = $.parseXML(data);
                    var tabstr = '';
                    var chkstr = '';
                    var cardstr = '';
                    if ($(data).find("data_item").length > 0) {
                        $(data).find("data_item").each(function (i) {                           
                            cardstr += "<option value='" + $(this).children("c_user").text().trim() + "'>";
                            cardstr += $(this).children("c_name").text().trim() + " " + $(this).children("c_user").text().trim() + " " + $(this).children("c_dep").text().trim() + "</option > ";                              
                            tabstr += "<option value='" + $(this).children("c_user").text().trim() + "'>";
                            tabstr += $(this).children("c_name").text().trim() + " " + $(this).children("c_user").text().trim() + " " + $(this).children("c_dep").text().trim() + "</option > ";
                            chkstr += "<li><input type='checkbox' name='name_list' value='" + $(this).children("c_user").text().trim() + "'>";
                            chkstr += $(this).children("c_name").text().trim() + " " + $(this).children("c_user").text().trim() + " " + $(this).children("c_dep").text().trim() + "</li>";                           
                        });
                    }                  
                }
                $("#card_host").append(cardstr);
                $("#sub_host").append(tabstr);
                $("#sub_team").append(chkstr);
                

            }
        });



    }
    //子項目成員 隱藏主持人
    function team_list_chang(s_host) {
        $.ajax({
            type: "POST",
            async: false, //在沒有返回值之前,不會執行下一步動作
            url: "ashx/team_group_run.ashx",
            data: {
                project: p_id, //u_guid 查詢   
                host: s_host
            },
            error: function (xhr) {
                alert("Error " + xhr.status);
                console.log(xhr.responseText);
            },
            success: function (data) {
                
                $("#sub_team").empty();
                if (data != null) {
                    data = $.parseXML(data);
                    var tabstr = '';
                    var chkstr = ''
                    if ($(data).find("data_item").length > 0) {
                        $(data).find("data_item").each(function (i) {
                            chkstr += "<li><input type='checkbox' name='name_list' value='" + $(this).children("c_user").text().trim() + "'>";
                            chkstr += $(this).children("c_name").text().trim() + " " + $(this).children("c_user").text().trim() + " " + $(this).children("c_dep").text().trim() + "</li>";
                        });
                    }
                }

                $("#sub_team").append(chkstr);
            }
        });
    }
    $("#sub_host").change(function () {
        team_list_chang($("#sub_host").val()); //.find(":selected")
    });
    //檔案匯入
    function file_edit(guid_g,view) {
     
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
                    $("#file_ul").empty();
                    var tbstr = '';
                    if ($(data).find("data_item").length > 0) {
                        $(data).find("data_item").each(function (i) {
                            if (view == 'Y') {
                                tbstr += '<li guid=' + $(this).children("file_encryname").text().trim() + '>'
                                tbstr += '<a href="\\itri.ds\intratest\webdev5_trello-upload\" '+ $(this).children("file_encryname").text().trim() + '.' + $(this).children("file_exten").text().trim() + '" download="' + $(this).children("file_orgname").text().trim() + '">'
                                tbstr += $(this).children("file_orgname").text().trim() + '.'
                                tbstr += $(this).children("file_exten").text().trim() + '</a></li> '
                            }
                            else {
                                tbstr += '<li guid=' + $(this).children("file_encryname").text().trim() + '><a class="delete_file" href="#">'
                                tbstr += '<i class="fa fa-times font-red" aria- hidden="true"></i></a>' + $(this).children("file_orgname").text().trim()
                                tbstr += $(this).children("file_exten").text().trim() + '</li> '
                            }                           
                        });
                        $("#file_ul").append(tbstr);
                    }
                }
            });
                     
        
    }
     //新增子項目 
    function insert_sub() {
        var new_guid = "";
       
        var team_group = "";
        $("input[name=name_list]:checked").each(function () {
            if (team_group == "") {
                team_group += $(this).val();
            } else {
                team_group += "," + $(this).val();
            }           
        });

        new_guid = guid().toLocaleUpperCase();
        if ($("#add_sub_title").val() == '') {

            alert('請輸入標題');
            return;
        }
        if ($("#add_sub_text").val() == '') {
            alert('請輸入內容');
            return;
        }

        $.ajax({
            type: "POST",
            async: false, //在沒有返回值之前,不會執行下一步動作
            url: "ashx/sub_insert.ashx",
            data: {
                s_guid: new_guid,
                p_guid: getParameterName('id'),
                title: $("#add_sub_title").val(),
                text: $("#add_sub_text").val(),
                sa: $("#sub_host").val(), //user.db u_guid
                start_time: $("#starttime").val(),
                end_time: $("#endtime").val(),
                team: team_group,
                host: $("#sub_host").find(":selected").val(),
                emp:sa
            },
            error: function (xhr) {
                alert("Error " + xhr.status);
                console.log(xhr.responseText);
            },
            success: function (data) {
                alert(data);
            }
        });
        
        $("#add_sub_title").val('');
        $("#add_sub_text").val('');
        $.magnificPopup.close();
        
        databuid();
    }
    //編輯子項目匯入
    function edit_sub(guid_d) {
        $.ajax({
            type: "POST",
            async: false, //在沒有返回值之前,不會執行下一步動作
            url: "ashx/sub_edit.ashx",
            data: {
                guid: guid_d                
            },
            error: function (xhr) {
                alert("Error " + xhr.status);
                console.log(xhr.responseText);
            },
            success: function (data) {
                $("#add_sub_title").val('');
                $("#add_sub_text").val('');
                if ($(data).find("data_item").length > 0) {
                    $(data).find("data_item").each(function (i) {
                        $("#edit_div").attr("guid", $(this).children("s_guid").text().trim());
                        $("#add_sub_title").val($(this).children("s_name").text().trim());
                        $("#add_sub_text").val($(this).children("s_text").text().trim());
                        $("#sub_host").val($(this).children("s_author").text().trim())
                        $("#starttime").val($(this).children("s_start_time").text().trim());
                        $("#endtime").val($(this).children("s_end_time").text().trim());
                    });

                }

            }
        });
    }
    //編輯匯入子項目成員勾選
    function edit_sub_team_list(s_guid) {
        $.ajax({
            type: "POST",
            async: false, //在沒有返回值之前,不會執行下一步動作
            url: "ashx/sub_edit_group.ashx",
            data: {
                guid: s_guid,
                p_guid:p_id
            },
            error: function (xhr) {
                alert("Error " + xhr.status);
                console.log(xhr.responseText);
            },
            success: function (data) {
                var chk = '';
                var chkstr = '';
                $("#sub_team").empty();
                if ($(data).find("data_item").length > 0) {
                    $(data).find("data_item").each(function (i) {
                        if ($(this).children("check").text().trim() == 'Y') {
                            chk = 'checked';
                        }
                        else {
                            chk = '';
                        }
                            chkstr += "<li><input type='checkbox' name='name_list' value='" + $(this).children("c_user").text().trim() + "'"+chk+">";
                            chkstr += $(this).children("c_name").text().trim() + " " + $(this).children("c_user").text().trim() + " " + $(this).children("c_dep").text().trim() + "</li>";                      
                    });

                }
                $("#sub_team").append(chkstr);
            }
        });
    }
    //編輯子項目update
    function update_sub() {
        if ($("#add_sub_title").val() == '') {

            alert('請輸入標題');
            return;
        }
        if ($("#add_sub_text").val() == '') {
            alert('請輸入內容');
            return;
        }
        var team_group = "";
        $("input[name=name_list]:checked").each(function () {
            if (team_group == "") {
                team_group += $(this).val();
            } else {
                team_group += "," + $(this).val();
            }
        });
        $.ajax({
            type: "POST",
            async: false, //在沒有返回值之前,不會執行下一步動作
            url: "ashx/sub_update.ashx",
            data: {
                guid: $('#edit_div').attr('guid'),
                title: $("#add_sub_title").val(),
                text: $("#add_sub_text").val(),
                host: $("#sub_host").val(),
                start_time: $("#starttime").val(),
                end_time: $("#endtime").val(),
                team: team_group,
                p_guid: p_id,
                emp:sa
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
    //載入卡片
    function card_buid() {
        $.ajax({
            type: "POST",
            async: false, //在沒有返回值之前,不會執行下一步動作
            url: "ashx/card.ashx",
            data: {               
                p_guid: getParameterName('id'),                
            },
            error: function (xhr) {
                alert("Error " + xhr.status);
                console.log(xhr.responseText);
            },
            success: function (data) {               
                if (data != null) {
                    data = $.parseXML(data);
                    var tabstr = ''; /*javascript: void (0); '*/
                    if ($(data).find("data_item").length > 0) {
                        $(data).find("data_item").each(function (i) {
                            
                            tabstr += "<li name='cardgid' guid=" + $(this).children("cd_guid").text().trim() + " class='sonbox additional-field-model cardbox' >"
                            tabstr += "<textarea rows= '1' class='width100 textareaUI autoheight' readonly='true'guid=" + $(this).children("cd_guid").text().trim() + "  onclick='card_veiw(this)' style='cursor:pointer;'> " + $(this).children("cd_title").text().trim()+"</textarea > "
                            tabstr += "<div class='margin10T margin5B'> <a href='#' class='deletecard'><i class='fa fa-times font-red' aria-hidden='true'></i></a>&nbsp;"
                            tabstr += "<a name= 'chat_card' href= '#' class='open-popup-link'> <i class='fa fa-pencil-square-o' aria-hidden='true'></i></a><br\>";
                            tabstr += "主持人：" + $(this).children("cd_host").text().trim() + "<br\>起訖日期：" + $(this).children("cd_start_time").text().trim() + "~" + $(this).children("cd_end_time").text().trim()+"</div></li>";
                            $("ul[guid=" + $(this).children("cd_sub").text().trim() + "]").append(tabstr);
                            tabstr = '';
                        });

                    }                  
                }
            }
            
        });
    }
   
    $('.open-popup-link').magnificPopup({
        type: 'inline',
        midClick: false, // 是否使用滑鼠中鍵
        closeOnBgClick: true,//點擊背景關閉視窗
        showCloseBtn: true,//隱藏關閉按鈕
        fixedContentPos: true,//彈出視窗是否固定在畫面上
        mainClass: 'mfp-fade',//加入CSS淡入淡出效果
        tClose: '關閉',//翻譯字串
    });


    //檢視卡片
    function card_veiw(cd_guid) {    
        $("#save").css("display", "none");
        $(".card").attr("readonly", true);
        $("#title_card").text("卡片內容")
        $("#edit").css("display", "none");
        $("#chat_all").css("display", "");
        $("#upload_btn").css("display", "");
        $("#sa_p").css("display", "");
        $("#card_log").css("display", "");
        $("#cd_guid_tex").val(cd_guid.getAttribute("guid"));
        $.ajax({
            type: "POST",
            async: false, //在沒有返回值之前,不會執行下一步動作
            url: "ashx/card_view.ashx",
            data: {
                guid: cd_guid.getAttribute("guid")
            },
            error: function (xhr) {
                alert("Error " + xhr.status);
                console.log(xhr.responseText);
            },
            success: function (data) {
                $("#card_title").val('');
                $("#card_text").val('');
                if ($(data).find("data_item").length > 0) {
                    $(data).find("data_item").each(function (i) {
                        $("#save").attr("guid", $(this).children("cd_guid").text().trim());
                        $("#card_title").val($(this).children("cd_title").text().trim());
                        $("#sa_p").text('建立者:'+$(this).children("cd_user").text().trim());
                        $("#card_text").val($(this).children("cd_text").text().trim());
                        $('#card_host option[value=' + $(this).children("cd_host_sle").text().trim() + ']').attr('selected', 'selected');
                        $("#card_start_time").val($(this).children("cd_start_time").text().trim())
                        $("#card_end_time").val($(this).children("cd_end_time").text().trim())
                    });

                }

            }
        });
        file_edit(cd_guid.getAttribute("guid"),'Y');
        chat_buid(cd_guid.getAttribute("guid"));
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

    }
    //匯出聊天
    function chat_buid(guid) {
        $.ajax({
            type: "POST",
            async: false, //在沒有返回值之前,不會執行下一步動作
            url: "ashx/chat.ashx",
            data: {
                c_guid: guid,
            },
            error: function (xhr) {
                alert("Error " + xhr.status);
                console.log(xhr.responseText);
            },
            success: function (data) {
                if (data != null) {
                    data = $.parseXML(data);
                    var tabstr = '';
                    $("#chat_room").empty();
                    if ($(data).find("data_item").length > 0) {
                        $(data).find("data_item").each(function (i) {
                            if (sa == $(this).children("cc_user_emp").text().trim()) {
                                tabstr += '<div guid=' + $(this).children("cc_guid").text().trim()+' class="margin15B"> <div class=" margin5B">我';
                                tabstr += '&nbsp;<span class="font-size1">於 ' + $(this).children("cc_time").text().trim() + ' 說:</span></div>';
                                if ( $(this).children("cc_text").text().trim().substring(0, 7) == 'https://') {
                                    tabstr += '<div class="bubbleR"><a href="' + $(this).children("cc_text").text().trim()+'">' + $(this).children("cc_text").text().trim() + '</a></div></div>';
                                }
                                else {
                                    tabstr += '<div class="bubbleR">' + $(this).children("cc_text").text().trim() + '</div></div>';
                                }
                                
                            }
                            else {
                                tabstr += '<div  guid=' + $(this).children("cc_guid").text().trim() +' class="margin15B"> <div class=" margin5B">' + $(this).children("cc_user").text().trim();
                                tabstr += '&nbsp;<span class="font-size1">於 ' + $(this).children("cc_time").text().trim() + ' 說:</span></div>';
                                if ($(this).children("cc_text").text().trim().substring(0, 7) == 'https://') {
                                    tabstr += '<div class="bubbleR"><a href="' + $(this).children("cc_text").text().trim() + '">' + $(this).children("cc_text").text().trim() + '</a></div></div>';
                                }
                                else {
                                    tabstr += '<div class="bubbleL">' + $(this).children("cc_text").text().trim() + '</div></div>';
                                }
                               
                            }
                                                              		    
                        });
                    }
                    $("#chat_room").append(tabstr);
                }
            }

        });
        $("#chat_scr").animate({ scrollTop: $(this).height() });
    }

 //------------------------------實用function--------------------------------// 
    function getParameterName(skey) { //抓url 
        var s = location.search.replace(/^\?/, '');
        if (s == '' || skey == null || skey == '') return unescape(s);
        var re = new RegExp('(&|^)' + skey + '=([^&]*)(&|$)');
        var a = re.exec(s);
        return unescape(a ? a[2] : '');
    }

    function guid() { //newid()
        function s4() {
            return Math.floor((1 + Math.random()) * 0x10000).toString(16).substring(1);
        }
        return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
    }

    function back() {
        location.href = "trello_tast.aspx?";
    }

</script>
<script type="text/javascript" src="js/GenCommon.js"></script><!-- UIcolor JS -->
<script type="text/javascript" src="js/PageCommon.js"></script><!-- 系統共用 JS -->
<script type="text/javascript" src="js/autoHeight.js"></script><!-- 高度不足頁面的絕對置底footer -->
</body>
</html>
