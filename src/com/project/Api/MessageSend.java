package com.project.Api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

public class MessageSend {	
	public static void sendMessage(String Message, String Number) throws IOException {
		String myUrl="https://www.fast2sms.com/dev/bulkV2?authorization=PXcTsEZrh4Lq56ASwQIYviaCmG2eg1bntpN3xBDd9zUyVWKMjOVnOJ8A9WEKIStkiwmZTqD3lY6dMhbR&sender_id=TXTIND&message="+Message+"&language=english&route=v3&flash=1&numbers="+Number;
		URL url=new URL(myUrl);
		HttpsURLConnection con=(HttpsURLConnection)url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("User-Agent", "Mozilla/5.0");
		con.addRequestProperty("cache-control", "no-cache");
		System.out.println("Wait");
		int code=con.getResponseCode();
		System.out.println(code);
		StringBuffer response=new StringBuffer();
		BufferedReader br=new BufferedReader(new InputStreamReader(con.getInputStream()));
		while(true) {
			String line=br.readLine();
			if(line==null) {
				break;
			}
			else {
				response.append(line);
			}
		}
		System.out.println(response);
	}	
}
