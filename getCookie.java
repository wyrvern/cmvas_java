import java.net.URL;
import java.net.URLConnection;
//  ja va2  s  .  c o m
public class getCookie {
  public static void main(String[] argv) throws Exception {


URL urlReq = new URL("https://www.cellc.co.za/cellc/jsp/profile/login_ajax.jsp");

URLConnection conn = (HttpURLConnection) urlReq.openConnection();
conn.setRequestMethod("GET");
conn.setReadTimeout(8000);
conn.setConnectTimeout(8000);

// Start building other http request parameter
conn.setRequestProperty("User-Agent", "Mozilla/5.0 (X11; Linux i686; rv:21.0) Gecko/20100101 Firefox/21.0");
conn.setRequestProperty("Accept-Language","en-us,en;q=0.5");
conn.setRequestProperty("Accept-Encoding", "gzip, deflate");
conn.setRequestProperty("Accept-Charset", "ISO-8859-1,utf-8;q=0.7,*;q=0.7");
conn.setRequestProperty("Connection", "close");

conn.setDoOutput(true);
conn.setDoInput(true);

conn.connect();
resCode = conn.getResponseCode(); 
if (resCode==HttpURLConnection.HTTP_OK){
 for(Map.Entry<String, List<String>> headers : conn.getHeaderFields().entrySet()){
 if (headers.getKey().equals("set-cookie")){
      logger.info("\t==>"+headers.getKey());
      for(String hval : headers.getValue()){
       logger.info("\t\t==>"+hval);
      }
 }else{
  logger.info("\t==>"+headers.getKey() +" = "+conn.getHeaderField(headers.getKey()));
 }
}

}
}
}
