//package com.mkyong.client;

import java.net.MalformedURLException;
import java.net.URL;
import java.security.cert.Certificate;
import java.io.*;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLPeerUnverifiedException;

public class HttpsClient{

   public static void main(String[] args)
   {
        new HttpsClient().testIt();
   }

   private void testIt(){

      String https_url = "https://www.cellc.co.za/cellc/jsp/profile/login_ajax.jsp?username=0743552582&password=mp1978mp";
      String httpr_url = "https://www.cellc.co.za/cellc/usage-history";

      String httpi_url = "https://www.cellc.co.za/cellc/dashboard-overview?javascript:history.accountShortName";

      URL url;
      URL uri;
      URL urr;

      try {

	     url = new URL(https_url);
	     uri = new URL(httpr_url);
	     urr = new URL(httpi_url);

	     HttpsURLConnection con = (HttpsURLConnection)url.openConnection();
	     HttpsURLConnection win = (HttpsURLConnection)uri.openConnection();
	     HttpsURLConnection set = (HttpsURLConnection)urr.openConnection();

	     //dumpl all cert info
	     //print_https_cert(con);

	     //dump all the content
	     //print_content(con);

	     //dump all the content
	     //print_content(win);

	     print_content(set);

      } catch (MalformedURLException e) {
	     e.printStackTrace();
      } catch (IOException e) {
	     e.printStackTrace();
      }

   }

   private void print_https_cert(HttpsURLConnection con){

    if(con!=null){

      try {

	System.out.println("Response Code : " + con.getResponseCode());
	System.out.println("Cipher Suite : " + con.getCipherSuite());
	System.out.println("\n");

	Certificate[] certs = con.getServerCertificates();
	for(Certificate cert : certs){
	   System.out.println("Cert Type : " + cert.getType());
	   System.out.println("Cert Hash Code : " + cert.hashCode());
	   System.out.println("Cert Public Key Algorithm : "
                                    + cert.getPublicKey().getAlgorithm());
	   System.out.println("Cert Public Key Format : "
                                    + cert.getPublicKey().getFormat());
	   System.out.println("\n");
	}

	} catch (SSLPeerUnverifiedException e) {
		e.printStackTrace();
	} catch (IOException e){
		e.printStackTrace();
	}

     }

   }

   private void print_content(HttpsURLConnection con){
	if(con!=null){

	try {

	   System.out.println("****** Content of the URL ********");
	   BufferedReader br =
		new BufferedReader(
			new InputStreamReader(con.getInputStream()));

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

}
