import java.net.URL;
import java.net.URLConnection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import java.net.MalformedURLException;
import java.net.URL;
import java.security.cert.Certificate;
import java.io.*;

import java.net.HttpURLConnection;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLPeerUnverifiedException;

import java.net.HttpURLConnection;
import java.nio.charset.StandardCharsets;

import java.net.URLEncoder;
	 
public class cookie {

   public static void print_content (URLConnection con) {

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

   public void SetCookie (String cookievalue) {

      try {

         String query            = URLEncoder.encode("key", "UTF-8") + "=" + URLEncoder.encode("value", "UTF-8");
         String cookies          = cookievalue; //"session_cookie=" + cookievalue; //"session_cookie=value";
         URL url                 = new URL("https://www.cellc.co.za/cellc/jsp/myaccount/my-account-loginBalance-ajax.jsp");
         HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();

         conn.setRequestProperty ("Cookie", cookies);
         conn.setRequestMethod   ("POST");
         conn.setDoInput         (true);
         conn.setDoOutput        (true);

         DataOutputStream out   = new DataOutputStream(conn.getOutputStream());
         out.writeBytes(query);
         out.flush();
         out.close();

         BufferedReader in      = new BufferedReader(new InputStreamReader(conn.getInputStream()));
         String decodedString;

         while ((decodedString = in.readLine()) != null) {
            System.out.println(decodedString);
         }
         in.close();

    //Send the request to the server
    //conn.connect();

      } catch (MalformedURLException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
   }

   public String GetCookie () {

         String c = null;

      try {

         URL url            = new URL("https://www.cellc.co.za/cellc/jsp/profile/login_ajax.jsp");

         String query = "username="+URLEncoder.encode("0743552582","UTF-8"); 
         query += "&";
         query += "password="+URLEncoder.encode("pz1609pz", "UTF-8") ;

       //URLConnection conn = url.openConnection();
         HttpsURLConnection conn = (HttpsURLConnection)url.openConnection();

         conn.setRequestMethod  ("POST");
         conn.setRequestProperty("Content-length", String.valueOf(query.length())); 
         conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8"); 
         conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:50.0) Gecko/20100101 Firefox/50.0");
         conn.setRequestProperty("Connection", "Keep-Alive");
         conn.setRequestProperty("Keep-Alive", "header");

         conn.setDoOutput       (true); 
         conn.setDoInput        (true); 

         DataOutputStream output = new DataOutputStream(conn.getOutputStream());  

         output.writeBytes(query);

         output.close();

         print_content (conn);

	 Map<String, List<String>> headerFields = conn.getHeaderFields();	 

	 Set<String> headerFieldsSet = headerFields.keySet();
	 Iterator<String> hearerFieldsIter = headerFieldsSet.iterator();

         while (hearerFieldsIter.hasNext()) {

            String headerFieldKey = hearerFieldsIter.next();

            if ("Set-Cookie".equalsIgnoreCase(headerFieldKey)) {                  

               List<String> headerFieldValue = headerFields.get(headerFieldKey);                 

               for (String headerValue : headerFieldValue) {                     

                //System.out.println("Cookie Found...");
                  String[] fields = headerValue.split(";\\s*");
                  String cookieValue = fields[0];

                  c = cookieValue;

                  String expires = null;
                  String path = null;
                  String domain = null;

                  boolean secure = false;

                  // Parse each field

                  for (int j = 1; j < fields.length; j++) {

                     if ("secure".equalsIgnoreCase(fields[j])) {
                        secure = true;
                     }
                     else if (fields[j].indexOf('=') > 0) {

                        String[] f = fields[j].split("=");

                        if ("expires".equalsIgnoreCase(f[0])) {
	                   expires = f[1];
	                }
                        else if ("domain".equalsIgnoreCase(f[0])) {
                           domain = f[1];
                        }
                        else if ("path".equalsIgnoreCase(f[0])) {
                           path = f[1];
                        }
                     }
                  }
                  //System.out.println("cookieValue:" + cookieValue);
                  //System.out.println("expires:" + expires);
                  //System.out.println("path:" + path);
                  //System.out.println("domain:" + domain);
                  //System.out.println("secure:" + secure);
                  //System.out.println("*****************************************");
               }
            }
         }

      } catch (MalformedURLException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
      return c;

   }

    public static void main(String[] args) throws Exception {

       cookie c = new cookie();
       String s = c.GetCookie ();

       System.out.println (s);

       c.SetCookie (s);

     //System.out.println (":" + s);

   }
}
