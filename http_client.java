import java.net.MalformedURLException;
import java.net.URL;
import java.security.cert.Certificate;
import java.io.*;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLPeerUnverifiedException;

public class http_client{

   public static void main(String[] args) {

      URL url;
      InputStream is = null;
      BufferedReader br;
      String line;

      try {
         url = new URL("https://www.cellc.co.za/cellc/jsp/profile/login_ajax.jsp?username=0743552582&password=mp1978mp");
         is = url.openStream();  // throws an IOException
         br = new BufferedReader(new InputStreamReader(is));

         while ((line = br.readLine()) != null) {
            System.out.println(line);
         }
     } catch (MalformedURLException mue) {
         mue.printStackTrace();
     } catch (IOException ioe) {
         ioe.printStackTrace();
     } finally {
        try {
            if (is != null) is.close();
        } catch (IOException ioe) {
            // nothing to see here
        }
    }
  }
}
