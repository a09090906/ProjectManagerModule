<%@ WebHandler Language="C#" Class="log_data" %>

using System;
using System.Web;
using System.Data;

public class log_data : IHttpHandler {
    public dal dal = new dal();
    public common common = new common();
    public void ProcessRequest (HttpContext context) {
        string type = (context.Request["type"] != null) ? context.Request["type"].ToString() : "";
        string log_id = (context.Request["log_id"] != null) ? context.Request["log_id"].ToString() : "";
        string id = (context.Request["id"] != null) ? context.Request["id"].ToString() : "";
        DataSet dt = new DataSet();
        dt = dal.log_view(log_id, type,id);
        string xml_sql = "";
        string xml_data = "";
        if (dt.Tables[0].Rows.Count > 0)
        {
            xml_sql += "<dataList>";

            if (type == "P")//判斷專案,子項目,卡片
            {
                for (int i = 0; i < dt.Tables[0].Rows.Count; i++)
                {
                    xml_sql += "<data_item>";
                    xml_sql += "<log_name>" + dt.Tables[0].Rows[i]["p_log_name"].ToString() + "</log_name>";
                    xml_sql += "<log_text>" + dt.Tables[0].Rows[i]["p_log_text"].ToString() + "</log_text>";
                    xml_sql += "<log_colar>" + dt.Tables[0].Rows[i]["p_log_colar"].ToString() + "</log_colar>";
                    if (dt.Tables[0].Rows[i]["p_log_startdate"].ToString() == "") {
                        xml_sql += "<log_start_time>" +dt.Tables[0].Rows[i]["p_log_startdate"].ToString()+ "</log_start_time>";
                    }
                    else{
                        xml_sql += "<log_start_time>" +DateTime.Parse(dt.Tables[0].Rows[i]["p_log_startdate"].ToString()).ToString("yyyy-MM-dd")+ "</log_start_time>";
                    }
                    if (dt.Tables[0].Rows[i]["p_log_enddate"].ToString() == "")
                    {
                        xml_sql += "<log_end_time>" +dt.Tables[0].Rows[i]["p_log_enddate"].ToString()+ "</log_end_time>";
                    }
                    else
                    {
                        xml_sql += "<log_end_time>" + DateTime.Parse(dt.Tables[0].Rows[i]["p_log_enddate"].ToString()).ToString("yyyy-MM-dd") + "</log_end_time>";
                    }
                    if (dt.Tables[1].Rows.Count > 0)//修改判斷
                    {
                        if (dt.Tables[0].Rows[i]["p_log_name"].ToString() == dt.Tables[1].Rows[i]["p_log_name"].ToString())//判斷是否有修改過
                        {
                            xml_sql += "<name_edit>#000000</name_edit>";
                        }
                        else
                        {
                            xml_sql += "<name_edit>#FF0000</name_edit>";
                        }
                        if (dt.Tables[0].Rows[i]["p_log_text"].ToString() == dt.Tables[1].Rows[i]["p_log_text"].ToString())
                        {
                            xml_sql += "<text_edit>#000000</text_edit>";

                        }
                        else
                        {
                            xml_sql += "<text_edit>	#FF0000</text_edit>";
                        }
                        if (dt.Tables[0].Rows[i]["p_log_colar"].ToString() == dt.Tables[1].Rows[i]["p_log_colar"].ToString())
                        {
                            xml_sql += "<colar_edit>#000000</colar_edit>";
                        }
                        else
                        {
                            xml_sql += "<colar_edit>#FF0000</colar_edit>";
                        }
                        if (dt.Tables[0].Rows[i]["p_log_startdate"].ToString() == dt.Tables[1].Rows[i]["p_log_startdate"].ToString())
                        {
                            xml_sql += "<start_time_edit>#000000</start_time_edit>";
                        }
                        else
                        {
                            xml_sql += "<start_time_edit>#FF0000</start_time_edit>";
                        }
                        if (dt.Tables[0].Rows[i]["p_log_enddate"].ToString() == dt.Tables[1].Rows[i]["p_log_enddate"].ToString())
                        {
                            xml_sql += "<end_time_edit>#000000</end_time_edit>";
                        }
                        else
                        {
                            xml_sql += "<end_time_edit>#FF0000</end_time_edit>";
                        }
                    }
                    else
                    {
                        xml_sql += "<name_edit>#000000</name_edit>";
                        xml_sql += "<text_edit>#000000</text_edit>";
                        xml_sql += "<colar_edit>#000000</colar_edit>";
                        xml_sql += "<start_time_edit>#000000</start_time_edit>";
                        xml_sql += "<end_time_edit>#000000</end_time_edit>";
                    }

                    xml_sql += "</data_item>";
                }
            }
            else if (type == "S")
            {
                for (int i = 0; i < dt.Tables[0].Rows.Count; i++)
                {
                    xml_sql += "<data_item>";
                    xml_sql += "<log_name>" + dt.Tables[0].Rows[i]["s_log_name"].ToString() + "</log_name>";
                    xml_sql += "<log_text>" + dt.Tables[0].Rows[i]["s_log_text"].ToString() + "</log_text>";
                    xml_sql += "<log_host>" + common.GetEmpName(dt.Tables[0].Rows[i]["s_log_author"].ToString()) + "</log_host>";
                    if (dt.Tables[0].Rows[i]["s_log_start_time"].ToString() == "") {
                        xml_sql += "<log_start_time>" +dt.Tables[0].Rows[i]["s_log_start_time"].ToString()+ "</log_start_time>";
                    }
                    else{
                        xml_sql += "<log_start_time>" +DateTime.Parse(dt.Tables[0].Rows[i]["s_log_start_time"].ToString()).ToString("yyyy-MM-dd")+ "</log_start_time>";
                    }
                    if (dt.Tables[0].Rows[i]["s_log_end_time"].ToString() == "")
                    {
                        xml_sql += "<log_end_time>" +dt.Tables[0].Rows[i]["s_log_end_time"].ToString()+ "</log_end_time>";
                    }
                    else
                    {
                        xml_sql += "<log_end_time>" + DateTime.Parse(dt.Tables[0].Rows[i]["s_log_end_time"].ToString()).ToString("yyyy-MM-dd") + "</log_end_time>";
                    }
                    if (dt.Tables[1].Rows.Count > 0)//判斷更改了哪一些項目
                    {
                        if (dt.Tables[0].Rows[i]["s_log_name"].ToString() == dt.Tables[1].Rows[i]["s_log_name"].ToString())//判斷是否有修改過
                        {
                            xml_sql += "<name_edit>#000000</name_edit>";
                        }
                        else
                        {
                            xml_sql += "<name_edit>	#FF0000</name_edit>";
                        }
                        if (dt.Tables[0].Rows[i]["s_log_text"].ToString() == dt.Tables[1].Rows[i]["s_log_text"].ToString())
                        {
                            xml_sql += "<text_edit>#000000</text_edit>";
                        }
                        else
                        {
                            xml_sql += "<text_edit>#FF0000</text_edit>";
                        }
                        if (dt.Tables[0].Rows[i]["s_log_author"].ToString() == dt.Tables[1].Rows[i]["s_log_author"].ToString())
                        {
                            xml_sql += "<host_edit>#000000</host_edit>";
                        }
                        else
                        {
                            xml_sql += "<host_edit>#FF0000</host_edit>";
                        }
                        if (dt.Tables[0].Rows[i]["s_log_start_time"].ToString() == dt.Tables[1].Rows[i]["s_log_start_time"].ToString())
                        {
                            xml_sql += "<start_time_edit>#000000</start_time_edit>";
                        }
                        else
                        {
                            xml_sql += "<start_time_edit>#FF0000</start_time_edit>";
                        }
                        if (dt.Tables[0].Rows[i]["s_log_end_time"].ToString() == dt.Tables[1].Rows[i]["s_log_end_time"].ToString())
                        {
                            xml_sql += "<end_time_edit>#000000</end_time_edit>";
                        }
                        else
                        {
                            xml_sql += "<end_time_edit>#FF0000</end_time_edit>";
                        }
                    }
                    else
                    {
                        xml_sql += "<name_edit>#000000</name_edit>";
                        xml_sql += "<text_edit>#000000</text_edit>";
                        xml_sql += "<host_edit>#000000</host_edit>";
                        xml_sql += "<start_time_edit>#000000</start_time_edit>";
                        xml_sql += "<end_time_edit>#000000</end_time_edit>";
                    }
                    xml_sql += "</data_item>";
                }
            }
            else if (type == "C")
            {
                for (int i = 0; i < dt.Tables[0].Rows.Count; i++)
                {
                    xml_sql += "<data_item>";
                    xml_sql += "<log_name>" + dt.Tables[0].Rows[i]["cd_log_title"].ToString() + "</log_name>";
                    xml_sql += "<log_text>" + dt.Tables[0].Rows[i]["cd_log_text"].ToString() + "</log_text>";
                    xml_sql += "<log_host>" + common.GetEmpName(dt.Tables[0].Rows[i]["cd_log_host"].ToString()) + "</log_host>";
                    if (dt.Tables[0].Rows[i]["cd_log_start_time"].ToString() == "") {
                        xml_sql += "<log_start_time>" +dt.Tables[0].Rows[i]["cd_log_start_time"].ToString()+ "</log_start_time>";
                    }
                    else{
                        xml_sql += "<log_start_time>" +DateTime.Parse(dt.Tables[0].Rows[i]["cd_log_start_time"].ToString()).ToString("yyyy-MM-dd")+ "</log_start_time>";
                    }
                    if (dt.Tables[0].Rows[i]["cd_log_end_time"].ToString() == "")
                    {
                        xml_sql += "<log_end_time>" +dt.Tables[0].Rows[i]["cd_log_end_time"].ToString()+ "</log_end_time>";
                    }
                    else
                    {
                        xml_sql += "<log_end_time>" + DateTime.Parse(dt.Tables[0].Rows[i]["cd_log_end_time"].ToString()).ToString("yyyy-MM-dd") + "</log_end_time>";
                    }
                    xml_sql += "<sub_name>" + dal.card_sub(dt.Tables[0].Rows[i]["cd_log_sub"].ToString()) + "</sub_name>";
                    if (dt.Tables[1].Rows.Count > 0)
                    {
                        if (dt.Tables[0].Rows[i]["cd_log_title"].ToString() == dt.Tables[1].Rows[i]["cd_log_title"].ToString())
                        {
                            xml_sql += "<name_edit>#000000</name_edit>";
                        }
                        else
                        {
                            xml_sql += "<name_edit>	#FF0000</name_edit>";
                        }
                        if (dt.Tables[0].Rows[i]["cd_log_text"].ToString() == dt.Tables[1].Rows[i]["cd_log_text"].ToString())//判斷是否有修改過
                        {
                            xml_sql += "<text_edit>#000000</text_edit>";
                        }
                        else
                        {
                            xml_sql += "<text_edit>	#FF0000</text_edit>";
                        }
                        if (dt.Tables[0].Rows[i]["cd_log_host"].ToString() == dt.Tables[1].Rows[i]["cd_log_host"].ToString())
                        {
                            xml_sql += "<host_edit>#000000</host_edit>";
                        }
                        else
                        {
                            xml_sql += "<host_edit>#FF0000</host_edit>";
                        }
                        if (dt.Tables[0].Rows[i]["cd_log_start_time"].ToString() == dt.Tables[1].Rows[i]["cd_log_start_time"].ToString())
                        {
                            xml_sql += "<start_time_edit>#000000</start_time_edit>";
                        }
                        else
                        {
                            xml_sql += "<start_time_edit>#FF0000</start_time_edit>";
                        }
                        if (dt.Tables[0].Rows[i]["cd_log_end_time"].ToString() == dt.Tables[1].Rows[i]["cd_log_end_time"].ToString())
                        {
                            xml_sql += "<end_time_edit>#000000</end_time_edit>";
                        }
                        else
                        {
                            xml_sql += "<end_time_edit>#FF0000</end_time_edit>";
                        }
                        if (dt.Tables[0].Rows[i]["cd_log_sub"].ToString() == dt.Tables[1].Rows[i]["cd_log_sub"].ToString())
                        {
                            xml_sql += "<sub_edit>#000000</sub_edit>";
                        }
                        else
                        {
                            xml_sql += "<sub_edit>#FF0000</sub_edit>";
                        }
                    }
                    else
                    {
                        xml_sql += "<name_edit>#000000</name_edit>";
                        xml_sql += "<text_edit>#000000</text_edit>";
                        xml_sql += "<host_edit>#000000</host_edit>";
                        xml_sql += "<start_time_edit>#000000</start_time_edit>";
                        xml_sql += "<end_time_edit>#000000</end_time_edit>";
                        xml_sql += "<sub_edit>#000000</sub_edit>";
                    }

                    xml_sql += "</data_item>";
                }
            }
            xml_sql += "</dataList>";
        }
        xml_data = "<root>" + xml_sql + "</root>";
        context.Response.Write(xml_data);


    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}