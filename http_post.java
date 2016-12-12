import java.net.MalformedURLException;
import java.net.URL;
import java.security.cert.Certificate;
import java.io.*;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLPeerUnverifiedException;

import java.net.HttpURLConnection;
import java.nio.charset.StandardCharsets;

import java.net.URLEncoder;

public class http_post {

   public static void main(String[] args) {

      try {

         String httpsURL = "https://www.cellc.co.za/cellc/jsp/profile/login_ajax.jsp";
         String query = "username="+URLEncoder.encode("0743552582","UTF-8"); 
         query += "&";
         query += "password="+URLEncoder.encode("pz1609pz","UTF-8") ;

         URL myurl = new URL(httpsURL);
         HttpsURLConnection con = (HttpsURLConnection)myurl.openConnection();
         con.setRequestMethod("POST");

         con.setRequestProperty("Content-length", String.valueOf(query.length())); 
         con.setRequestProperty("Content-Type","application/x-www- form-urlencoded"); 
         con.setRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 5.0;Windows98;DigExt)"); 
         con.setDoOutput(true); 
         con.setDoInput(true); 

         DataOutputStream output = new DataOutputStream(con.getOutputStream());  

         output.writeBytes(query);

         output.close();

         DataInputStream input = new DataInputStream( con.getInputStream() ); 

         for (int c = input.read(); c != -1; c = input.read()) {
            System.out.print( (char)c ); 
         }
         input.close(); 

         System.out.println("Resp Code:"+con .getResponseCode()); 
         System.out.println("Resp Message:"+ con .getResponseMessage()); 

      } catch (MalformedURLException mue) {
         mue.printStackTrace();
      } catch (IOException ioe) {
         ioe.printStackTrace();
      } 
   }
}