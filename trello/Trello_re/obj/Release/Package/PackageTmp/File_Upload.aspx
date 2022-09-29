<%@ Page Language="C#" AutoEventWireup="true" Inherits="File_Upload" Codebehind="File_Upload.aspx.cs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="../js/jquery-1.11.2.min.js"></script>
<script src="../js_plupload/plupload.full.min.js"></script>
    <script src="../js/downfile.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            try {
 
                var uploader = new plupload.Uploader({
                    runtimes: 'html5,flash,silverlight,html4',
                    browse_button: 'pickfiles', // you can pass in id...
                    container: document.getElementById('uploadblock'), // ... or DOM Element itself
                    url: '../ashx/uploadFile.ashx',
                    flash_swf_url: '../js_plupload/Moxie.swf',
                    silverlight_xap_url: '../js_plupload/Moxie.xap',
                    multipart_params: {
                        pGuid: getParameterName('id'),  //trello_tast傳 P_guid
                        type: '01'
                    },
                    filters: {
                        // Maximum file size
                        max_file_size: '2000mb',
                        // Specify what files to browse for
                        mime_types: [
                            { title: "all files", extensions: "*" }
                        ]
                    },
                    init: {
                        Init: function (up, params) {
                            $('#warningStr').html("<div>目前瀏覽器優先使用: " + params.runtime + "</div>");
                        },
                        FilesAdded: function (up, files) {
                            if (up.total.size >= 2147483648) {
                                up.removeFile(files[0]);
                                alert("所有檔案相加其大小不可超過2GB");
                                return;
                            }


                            var deleteHandle = function (uploaderObject, fileObject) {
                                return function (event) {
                                    event.preventDefault();
                                    uploaderObject.removeFile(fileObject);
                                    $(this).closest("li#" + fileObject.id).remove();
                                };
                            };

                            var fileListTable = '<table width="100%" border="0" cellspacing="0" cellpadding="0">';
                            fileListTable += '<tr>';
                            fileListTable += '<td>檔案列表</td>';
                            fileListTable += '</tr></table>';
                            if ($("#plupload_content").find("table").length == 0) {
                                $("#plupload_content").prepend(fileListTable);
                            }

                            var Flist = '<ul style="list-style-type: none;">';
                            $.each(files, function (i, file) {
                                Flist += '<li id="' + file.id + '">';
                                Flist += '<!--<div class="plupload_fileSizeList" ><span>' + plupload.formatSize(file.size) + '</span></div > -->';
                                Flist += '<div class="fileNameList" style="border-bottom:solid 1px #dddddd;"><a href="javascript:void(0);"><img src="../images/icon-delete-new.png" border="0" id="deleteFile' + files[i].id + '" style="margin-top: 5px;" /></a>';
                                Flist += '<span style="margin-left:10px;">' + file.name + '</span></div></li>';
                            });
                            Flist += '</ul>';
                            $('#filelist').append(Flist);

                            for (var i in files) {
                                $('#deleteFile' + files[i].id).click(deleteHandle(up, files[i]));
                                //調整 li 換行後的間距
                                $("li#" + files[i].id + "").attr("style","margin-bottom:3px");
                            }
                        },
                        //BeforeUpload: function (up, files) {
                        //    $.extend(up.settings.multipart_params, { myfileid: $('#' + files.id + 'myfileid').val() });
                        //},
                        FileUploaded: function (up, files) {
                            if ((uploader.total.uploaded) == uploader.files.length) {
                                alert("檔案上傳完成");
                            }
                        },
                        UploadProgress: function (up, file) {

                        },
                        Error: function (up, err) {
                            if (err.code == "-600") {
                                alert("請選擇低於2GB的檔案上傳");
                            }
                            else {
                                $('#warningStr').append("<div>Error: " + err.code + ", Message: " + err.message + (err.file ? ", File: " + err.file.name : "") + "</div>");
                            }
                            up.refresh(); // Reposition Flash/Silverlight
                        }
                    }
                });

            }
            catch (err) {
                alert(err);
            }

            uploader.init();

            $(document).on("click", "#btnCancel", function () {
                if (confirm("確定離開?") == true) {
                    window.close();
                }
            });

            $(document).on("click", "#btnAdd", function () {
                if ($('#filelist').html().trim().length == 0) {
                    alert("請選擇檔案")
                    return false;
                }
                else {
                    uploader.start();
                }
            });
        });//js end


        function getParameterName(skey) { //抓url 
            var s = location.search.replace(/^\?/, '');
            if (s == '' || skey == null || skey == '') return unescape(s);
            var re = new RegExp('(&|^)' + skey + '=([^&]*)(&|$)');
            var a = re.exec(s);
            return unescape(a ? a[2] : '');
        }
    </script>

</head>
<body>
       <form id="form1" runat="server">
    <div>
        <div class="stripeMe" id="uploadblock">
            <table width="98%" border="0" cellspacing="0" cellpadding="0">
                <tr><th colspan="2">檔案上傳</th></tr>
                <tr id="attachment">
                    <td>
                        <div id="divif">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div id="container">
                                            <input type="button" id="pickfiles" value="選擇檔案" class="genbtn" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div id="plupload_content">
                                            <div id="filelist" style="margin-left:-20px;">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                <td colspan="2" align="right">
                    <span id="loadsp" style="display:none;"><img alt="Loading..." src="../App_Themes/admin/images/LoadingProgressBar.gif" />資料處理中...</span>
                    <span id="btnsp">
                        <input id="btnAdd" type="button" value="新增" class="genbtn" />
                        <input id="btnCancel" type="button" value="取消" class="genbtn" />
                    </span>
                </td>
                </tr>
            </table>
        </div>

    </div>
    </form>
</body>
</html>
