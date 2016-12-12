import java.net.MalformedURLException;
import java.net.URL;
import java.security.cert.Certificate;
import java.io.*;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLPeerUnverifiedException;

import java.net.HttpURLConnection;
import java.nio.charset.StandardCharsets;

public class http {

   public static void print_content (HttpURLConnection con) {

      if (con != null) {

         try {

	    System.out.println("****** Content of the URL ********");
	    BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));

	    String input;

	    while ((input = br.readLine()) != null){
	       System.out.println(input);
	    }
	    br.close();

         } catch (IOException e) {
	   e.printStackTrace();
         }
      }
   }

   public static void main(String[] args) {

   try {

      String urlParameters  = "username=0743552582&password=pz1609pz";
      byte[] postData       = urlParameters.getBytes( StandardCharsets.UTF_8 );
      int    postDataLength = postData.length;
      String request        = "https://www.cellc.co.za/cellc/jsp/profile/login_ajax.jsp";
      URL    url            = new URL( request );
      HttpURLConnection conn= (HttpURLConnection) url.openConnection(); 

      conn.setDoOutput( true );
      conn.setInstanceFollowRedirects( false );
      conn.setRequestMethod( "POST" );
      conn.setRequestProperty( "Content-Type", "application/x-www-form-urlencoded"); 
      conn.setRequestProperty( "charset", "utf-8");
      conn.setRequestProperty( "Content-Length", Integer.toString( postDataLength ));
      conn.setUseCaches( false );

      try( DataOutputStream wr = new DataOutputStream( conn.getOutputStream())) {
         wr.write( postData );
      }

      print_content(conn);

     } catch (MalformedURLException mue) {
         mue.printStackTrace();
     } catch (IOException ioe) {
         ioe.printStackTrace();
     } 
   }
}
