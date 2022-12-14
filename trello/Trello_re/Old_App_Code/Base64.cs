using System;
using System.Collections.Generic;
using System.Text;

/// <summary>
/// Summary description for Base64
/// </summary>
public sealed class Base64
{

	public static string Encode(string data)
	{
		try
		{
			byte[] encData_byte = new byte[data.Length];
			encData_byte = Encoding.UTF8.GetBytes(data);
			string encodedData = Convert.ToBase64String(encData_byte);
			return encodedData;
		}
		catch(Exception e)
		{
			throw new Exception("Error in base64Encode " + e.Message);
		}
	}

	public static string Decode(string data)
	{
		try
		{
			UTF8Encoding encoder = new UTF8Encoding();
			Decoder utf8Decode = encoder.GetDecoder();

			byte[] todecode_byte = Convert.FromBase64String(data);
			int charCount = utf8Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
			char[] decoded_char = new char[charCount];
			utf8Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
			string result = new String(decoded_char);
			return result;
		}
		catch(Exception e)
		{
			throw new Exception("Error in base64Decode " + e.Message);
		}
	}


    public static string del_sql_xss(string data)
    {
            data.Replace("&","＆");
            data.Replace("$","＄");
            data.Replace("%","％");
            data.Replace("@","＠");
            data.Replace("\"","＂");
            data.Replace("'", "’");
            data.Replace("<", "＜");
            data.Replace(">","＞");
            data.Replace("(","（");
            data.Replace(")","）");
            data.Replace("+","＋");
            data.Replace("\\","＼");
            return data;
    }

    public static string danger_word(string data)
    {
        string str_check = "0";

        if(data.IndexOf("&lt")!= -1)      str_check = "1";
        //if(data.IndexOf("$")!= -1)      str_check = "1";
        //if(data.IndexOf("%")!= -1)      str_check = "1";
        //if(data.IndexOf("@")!= -1)      str_check = "1";
        if(data.IndexOf("\"") != -1)    str_check = "1";
        if(data.IndexOf("'") != -1)     str_check = "1";
        if(data.IndexOf("<") != -1)     str_check = "1";
        if(data.IndexOf(">")!= -1)      str_check = "1";
        //if(data.IndexOf("(")!= -1)      str_check = "1";
        //if(data.IndexOf(")")!= -1)      str_check = "1";
        //if(data.IndexOf("+")!= -1)      str_check = "1";
        if(data.IndexOf("\\") != -1)    str_check = "1";
        //if(data.IndexOf(",") != -1)     str_check = "1";
        //if(data.IndexOf("CR") != -1)    str_check = "1";
        //if(data.IndexOf("LF") != -1)    str_check = "1";
        if(data.IndexOf("|") != -1)     str_check = "1";
        return str_check;
    }
 

    public static string danger_word_mail(string data)
    {
        string str_check = "0";
        //if(data.IndexOf("&")!= -1)                  str_check = "1";
        if(data.IndexOf("$")!= -1)                  str_check = "1";
        //if(data.IndexOf("%")!= -1)                  str_check = "1";
        if(data.IndexOf("\"") != -1)                str_check = "1";
        if(data.IndexOf("'") != -1)                 str_check = "1";
        if(data.IndexOf("<") != -1)                 str_check = "1";
        if(data.IndexOf(">")!= -1)                  str_check = "1";
        if(data.IndexOf("(")!= -1)                  str_check = "1";
        if(data.IndexOf(")")!= -1)                  str_check = "1";
        if(data.IndexOf("+")!= -1)                  str_check = "1";
        if(data.IndexOf("\\") != -1)                str_check = "1";
       // if(data.IndexOf(",") != -1)                 str_check = "1";
        if(data.IndexOf("+") != -1)                 str_check = "1";
        if(data.IndexOf("|") != -1)                 str_check = "1";
        return str_check;
    }

    public static string danger_word_all(string data)
    {
        string str_check = "0";
        if(data.IndexOf("&")!= -1)      str_check = "1";
        if (data.IndexOf("$") != -1)    str_check = "1";
        if(data.IndexOf("%")!= -1)      str_check = "1";
        if (data.IndexOf("\"") != -1)   str_check = "1";
        if (data.IndexOf("'") != -1)    str_check = "1";
        if (data.IndexOf("<") != -1)    str_check = "1";
        if (data.IndexOf(">") != -1)    str_check = "1";
        if (data.IndexOf("(") != -1)    str_check = "1";
        if (data.IndexOf(")") != -1)    str_check = "1";
        if (data.IndexOf("+") != -1)    str_check = "1";
        if (data.IndexOf("\\") != -1)   str_check = "1";
        if(data.IndexOf("-") != -1)     str_check = "1";
        if (data.IndexOf("+") != -1)    str_check = "1";
        if (data.IndexOf("|") != -1)    str_check = "1";
        return str_check;
    }

    public static string danger_word_guid(string data)
    {
        string str_check = "0";
        if (data.IndexOf("&") != -1) str_check = "1";
        if (data.IndexOf("$") != -1) str_check = "1";
        if (data.IndexOf("%") != -1) str_check = "1";
        if (data.IndexOf("\"") != -1) str_check = "1";
        if (data.IndexOf("'") != -1) str_check = "1";
        if (data.IndexOf("<") != -1) str_check = "1";
        if (data.IndexOf(">") != -1) str_check = "1";
        if (data.IndexOf("(") != -1) str_check = "1";
        if (data.IndexOf(")") != -1) str_check = "1";
        if (data.IndexOf("+") != -1) str_check = "1";
        if (data.IndexOf("\\") != -1) str_check = "1";
        if (data.IndexOf("--") != -1) str_check = "1";
        if (data.IndexOf("+") != -1) str_check = "1";
        if (data.IndexOf("|") != -1) str_check = "1";
        return str_check;
    }

}
