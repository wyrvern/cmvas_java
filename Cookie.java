HttpsURLConnection conn = (HttpsURLConnection) new URL("https://test.com").openConnection();

conn.setInstanceFollowRedirects(false);
conn.setInstanceFollowRedirects(false); 
conn.setRequestMethod("GET"); 
conn.setUseCaches(false);


String s = conn.getHeaderField("Set-Cookie");
if( s != null ) {
    response.setHeader("Set-Cookie", java.net.URLDecoder.decode(s, "UTF-8"));
}

conn.disconnect();
