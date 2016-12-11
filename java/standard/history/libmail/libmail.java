/**
  * desc : mailer. JAVA Mailer Library.
  * mods : 25/01/2002-11:17:00:GMT+2
  * auth : null@null.co.za
  * todo : 
  **/

import java.io.*;
import java.util.*;
import java.lang.reflect.*;
import java.net.*;

  public class libmail {

private static final int SMTP_SERVICE_READY = 220;
private static final int SMTP_OK            = 250;
private static final int SMTP_FORWARD_OK    = 251;
private static final int SMTP_START_BODY    = 354;

private static final int CLIENT_CONNECT = 0;
private static final int CLIENT_SEND_FROM = 1;
private static final int CLIENT_SEND_TO = 2;
private static final int CLIENT_START_DATA = 3;
private static final int CLIENT_END_DATA = 4;
private static final int CLIENT_SEND_QUIT = 5;
private static final int CLIENT_CLOSE_CONNECTION = 6;

public  String   Host                     = null;
public  String   EmailFrom                = null;
public  String   EmailTo                  = null;
public  String   Subject                  = null;
public  String   Body                     = null;
public  String   Attachments              = null;
public  String   Mailer                   = null;
public  String   Message                  = null;
public  String   Response                 = null;
public String   encodingType              = null;
public  String[] Recipients               = null;

private byte bCRLF[] = {13, 10};
private String CRLF  = new String(bCRLF);

public headers               hs = new headers();
public lib.libstr.strFactory ns = new lib.libstr.strFactory();

private Socket conn;
private BufferedOutputStream outS;
private BufferedInputStream inS;
public  int    xRCPT             = 0;
public  String s_array[];

  public libmail() {
  }

  public String Send() {
    int    mailType     = 0;
    int    negate       = 0;
    String[] msgArray   = { "Host: "+Host, "From: "+EmailFrom, "Recipient: "+EmailTo, "Subject: "+Subject, "Body: "+Body, "Attachment(s): "+Attachments };
    if (Attachments == null) {
       if (encodingType == "text/plain") {
          mailType = 0;
          negate   = 1;
       }else
       if (encodingType == "text/html") {
          mailType = 1;
          negate   = 1;
       }else
       if (encodingType == null) {
          mailType = 0;
          negate   = 1;
       }
    }else{
       mailType = 2;
       negate   = 0;
    }
    try {
      for (int i=0;i<msgArray.length-negate;i++) {
       if (ns.Mid(msgArray[i],ns.InStr(0,msgArray[i],":")+2,0).length() == 0) {
          System.out.println(msgArray[i]+"Missing");
          return msgArray[i]+"Missing";
       }
      }
     }catch(Exception ex) { System.out.println("~~"); }
     hs.inHost      = Host;
     hs.inEmailFrom = EmailFrom;
     hs.inEmailTo   = EmailTo;
     hs.inSubject   = Subject;
     hs.inBody      = Body;
     hs.inAttach    = Attachments;
//   Message        = hs.getMessage(mailType);
     Recipients     = hs.getRecipients();
     for (int i=0;i<Recipients.length;i++) {
       System.out.println(Recipients[i]);
     }
//   Response       = Smtp(Host);
    return Response;
  }

  public String Smtp(String szHost) {
    String strRetPage        = null;

  //Try to create a socket connection to the mail server
    try {
      System.err.println("\nConnecting to " + szHost + "...");
      conn = new Socket(szHost, 25);
    }
    catch(UnknownHostException ex) {
      System.err.println("Unknown Mail Server" + szHost + ".");
      System.exit(0);
    }
    catch(IOException ex) {
      System.err.println("IOException Error connecting to SMTP Server.");
      System.err.println(ex.getMessage());
      System.exit(0);
    }

   //Create a input and ouput stream for the socket connection
     try {
       outS = new BufferedOutputStream(conn.getOutputStream());
       inS =  new BufferedInputStream (conn.getInputStream ());
     }
     catch(IOException ex) {
       System.err.println("IOException Error creating Input/Output Streams.");
       System.err.println(ex.getMessage());
       System.exit(0);
     }

   //Send the email
     try {
       strRetPage = sendMessage(EmailFrom);
     }
     catch(IOException ex) {
       System.err.println("IOException Error sending mail to SMTP Server.");
       System.err.println(ex.getMessage());
       System.exit(0);
     }

    //Close the socket connection
     try {
       conn.close();
     }
     catch(IOException ex) {
       System.err.println("IOException Error closing connection with SMTP Server.");
       System.err.println(ex.getMessage());
       System.exit(0);
     }
   return strRetPage;
  }

  private String sendMessage(String szEmailFrom) throws IOException {

    String  strRetPage  = null;
            szEmailFrom = "Mail From:<"+szEmailFrom+">";;
    String  Recipient   = null;
    String  inData;
    int     x = 0;
    int     k = 1;
    int     j;
    String  eval;

    do{
      inData = getData();
      j = Integer.parseInt(inData.substring(0,3));
      switch(x) {

      case CLIENT_CONNECT:
      if (j == SMTP_SERVICE_READY) {
         sendData("HELO " + conn.getLocalAddress().getHostName());
         x = CLIENT_SEND_FROM;
      }else{
         strRetPage = "Unable to connect to : " + Host;
         x = CLIENT_CLOSE_CONNECTION;
      }
      break;         

      case CLIENT_SEND_FROM:
      if (j == SMTP_OK) {
         sendData(szEmailFrom);
         x = CLIENT_SEND_TO;
      }else{
         strRetPage = "No such user : " + szEmailFrom;
         x = CLIENT_CLOSE_CONNECTION;
      }
      break;

      case CLIENT_SEND_TO:
      if (j == SMTP_OK || j == SMTP_FORWARD_OK) {
         Recipient  = "RCPT TO:<"+Recipients[k]+">";
         System.out.println(Recipient);
         sendData(Recipient);
        if(k == xRCPT) {
           x = CLIENT_START_DATA;
        }else{
           k++;
        }
      }else{
         strRetPage = "Invalid data." + Recipient;
         x = CLIENT_CLOSE_CONNECTION;
      }
      break;

      case CLIENT_START_DATA:
      if(j == SMTP_OK || j == SMTP_FORWARD_OK) {
         sendData("DATA");
         x = CLIENT_END_DATA;
      }else{
         strRetPage = "Invalid data : (DATA)";
         x = CLIENT_CLOSE_CONNECTION;
      }
      break;

      case CLIENT_END_DATA:
      if(j == SMTP_START_BODY) {
         sendData(Message);
         x = CLIENT_SEND_QUIT;
      }else{
         strRetPage = "Invalid data." + Message;
         x = CLIENT_CLOSE_CONNECTION;
      }
      break;

      case CLIENT_SEND_QUIT:
         sendData("QUIT");
         x = CLIENT_CLOSE_CONNECTION;
         return strRetPage;
      }
     }while(x<CLIENT_CLOSE_CONNECTION);
         return strRetPage;
    }

  private void sendData(String outData) throws IOException {
    //Iterate through the message in the 'outData' String.
    for(int j=0; j<outData.length(); j++) {
      outS.write(outData.charAt(j));
    }
    //Add a CRLF to the end of the string and flush it on its way.
    outS.write(13);
    outS.write(10);
    outS.flush();
   }

  private String getData() throws IOException {
  StringBuffer inData = new StringBuffer();
  int inChar;
   do {
     inChar = -1;
     inChar = inS.read();

     //If 'inChar' is -1 then this is the last character.
     // Send it to be processed.
     if(inChar == -1) {
       break;
     }

     inData.append((char) inChar);

     /*If 'inChar' is 10 then CRLF has been sent and this is the end of
     that message line. Now remove the CRLF and send it to be
     processed.*/
     if(inChar==10) {
       inData.setLength(inData.length()-2);
       break;
     }
    }while(true);

    //Turn the StringBuffer into a string.
    return inData.toString();
  }

  public static void main (String args[]) {
  libmail Mail    = new libmail();
   Mail.Host        = "null";
   Mail.EmailFrom   = "root@null.co.za";
   Mail.EmailTo     = "null@null;root@null";
   Mail.Subject     = "Success.";
   Mail.Body        = "Body, here. this. there.";
// Mail.Attachments = "c:\\win32_code\\src\\c_c#\\c#_src\\gen\\smtplib\\attach\\encoded.jpg;c:\\win32_code\\src\\c_c#\\c#_src\\gen\\smtplib\\attach\\there.txt";
   Mail.Send();
/*
   System.out.println(Mail.Response);
*/

   return;
  }
};
