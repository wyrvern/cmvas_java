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

   public static void print_content (HttpsURLConnection con) {

      if (con != null) {
 
         try {

	    System.out.println("---------------------");
	    BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));

	    String input;

	    while ((input = br.readLine()) != null){
	       System.out.println(input);
	    }
	    br.close();

         }catch (IOException e) {
	    e.printStackTrace();
	 }
      }
   }

   public static void main(String[] args) {

      try {

/**

http.keepAlive=<boolean>

"Keep-Alive" ":" 1#keep-alive-info

**/

         String httpsURL = "https://www.cellc.co.za/cellc/jsp/profile/login_ajax.jsp";
         String http_URL = "https://www.cellc.co.za/cellc/jsp/myaccount/my-account-loginBalance-ajax.jsp";

         String query = "username="+URLEncoder.encode("0743552582","UTF-8"); 
         query += "&";
         query += "password="+URLEncoder.encode("pz1609pz", "UTF-8") ;

         URL myurl = new URL(httpsURL);
         URL __url = new URL(http_URL);

         HttpsURLConnection  con = (HttpsURLConnection)myurl.openConnection();
         HttpsURLConnection _con = (HttpsURLConnection)__url.openConnection();

         con.setRequestMethod("POST");

         con.setRequestProperty("Content-length", String.valueOf(query.length())); 
         con.setRequestProperty("Content-Type","application/x-www-form-urlencoded;charset=utf-8"); 
         con.setRequestProperty("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:50.0) Gecko/20100101 Firefox/50.0");


         con.setRequestProperty("Connection", "Keep-Alive");
         con.setRequestProperty("Keep-Alive", "header");

       //System.out.println(con.getHeaderField("Set-Cookie"));

         con.setDoOutput(true); 
         con.setDoInput(true); 

         DataOutputStream output = new DataOutputStream(con.getOutputStream());  

         output.writeBytes(query);

         output.close();

         //System.out.println(con.getHeaderField("Set-Cookie"));

         print_content (con);

/**
         DataInputStream input = new DataInputStream( con.getInputStream() ); 

         for (int c = input.read(); c != -1; c = input.read()) {
            System.out.print( (char)c ); 
         }
         input.close(); 
*/

         System.out.println("Resp Code:"+con .getResponseCode()); 
         System.out.println("Resp Message:"+ con .getResponseMessage()); 

         con = (HttpsURLConnection)__url.openConnection();

         con.setRequestMethod("POST");

         con.setRequestProperty("Content-length", String.valueOf(query.length())); 
         con.setRequestProperty("Content-Type","application/x-www-form-urlencoded;charset=utf-8"); 
         con.setRequestProperty("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:50.0) Gecko/20100101 Firefox/50.0");


         con.setRequestProperty("Connection", "Keep-Alive");
         con.setRequestProperty("Keep-Alive", "header");

         con.setDoOutput(true); 
         con.setDoInput(true); 

       //con.setRequestMethod("POST");

       //con.setRequestProperty("Content-length", String.valueOf(query.length())); 
       //_con.setRequestProperty("Content-Type","application/x-www-form-urlencoded;charset=utf-8"); 
       //_con.setRequestProperty("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:50.0) Gecko/20100101 Firefox/50.0"); 
       //_con.setRequestProperty("Connection", "Keep-Alive"); 

       //_con.setDoOutput(true); 
       //_con.setDoInput(true);

         print_content (con);

         System.out.println("Resp Code:"+_con .getResponseCode()); 
         System.out.println("Resp Message:"+ _con .getResponseMessage()); 

       //httpsURL = "https://www.cellc.co.za/cellc/jsp/myaccount/my-account-loginBalance-ajax.jsp";

      } catch (MalformedURLException mue) {
         mue.printStackTrace();
      } catch (IOException ioe) {
         ioe.printStackTrace();
      } 
   }
}
