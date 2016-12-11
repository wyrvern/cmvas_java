/*
 *   mailer. JAVA Mailer Library.
 *   Description  : SMTP / Mime Encoding.
 *   Dependencies : JAVA VM 1.2+
 *   Platform     : OS Independant.
 *   Version      : 1.0.2
 *   Credit       : this()
 *   Copyright (C) 2001
 *
 *  To contact the author email: null@null.co.za
 *  Todo :
*/
import java.io.*;
import java.util.*;
import java.lang.reflect.*;
import java.net.*;

  public class smtplib extends nAlive{

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

private String szHost;
private String szEmailFrom;
private String szEmailTo;
private String szSubject;
private String szBody;
private String szMailer;
private String conn_from;
private String conn_to;
private String conn_data_ReplyTo;
private String conn_data_From;
private String conn_data_To;
private String conn_data_Subject;
private String conn_data_Mailer;
private String conn_data;
private String conn_quit;
private String eCRLF             = "\n.\n";
private String CRLF              = "\n";

private Socket conn;
private BufferedOutputStream outS;
private BufferedInputStream inS;
public  int    xRCPT             = 0;
public  String c_array[];

public void setData(String inHost,  
                    String inEmailFrom, 
                    String inEmailTo, 
                    String inSubject, 
                    String inBody) {

  szHost            = inHost;
  szEmailFrom       = inEmailFrom;
  szEmailTo         = inEmailTo;
  szSubject         = inSubject;
  szBody            = "\n" + inBody + "\n";
  szMailer          = "nullSMTP vjava_1.0.*";

  conn_from         = "Mail From:<"+szEmailFrom+">";
  conn_data_ReplyTo = "Reply-To: ";
  conn_data_From    = "From: ";
  conn_data_To      = "To: ";
  conn_data_Subject = "Subject: ";
  conn_data_Mailer  = "X-Mailer: ";

  conn_data         = conn_data_ReplyTo + 
                      szEmailFrom       +"\n"+
                      conn_data_From    +
                      szEmailFrom       +"\n"+
                      conn_data_To      +
                      szEmailTo         +"\n"+
                      conn_data_Subject +
                      szSubject         +"\n"+
                      conn_data_Mailer  +
                      szMailer          +"\n"+
                      szBody            +
                      eCRLF;

  c_array          = new String[szEmailTo.length()];
  int    xIndex;
  String xReturn;

  for (int i=0;i<c_array.length;i++){
  try {
    xIndex            = szEmailTo.indexOf(";",i);
    xReturn           = szEmailTo.substring(i,xIndex);
    c_array[xRCPT]    = xReturn;
    xRCPT             = xRCPT+1; // mod:to,init:point.[previous:97]

    i = xIndex;
      }catch(StringIndexOutOfBoundsException e){
            xRCPT          = xRCPT+1;
            xReturn        = szEmailTo.substring(i);
            c_array[xRCPT] = xReturn;
            return;
      }
  }
}

public int smtp() {

  String strRetPage        = "";

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
      inS = new BufferedInputStream(conn.getInputStream());
    }
    catch(IOException ex) {
      System.err.println("IOException Error creating Input/Output Streams.");
      System.err.println(ex.getMessage());
      System.exit(0);
    }

   //Send the email
    try {
      sendMessage();
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

 return -1;
}

private void sendMessage() throws IOException {
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
     System.err.println(inData);
     x = CLIENT_CLOSE_CONNECTION;
  }
  break;         

  case CLIENT_SEND_FROM:
  if (j == SMTP_OK) {
     sendData(conn_from);
     x = CLIENT_SEND_TO;
  }else{
     System.err.println(inData);
     x = CLIENT_CLOSE_CONNECTION;
  }
  break;

  case CLIENT_SEND_TO:
  if (j == SMTP_OK || j == SMTP_FORWARD_OK) {
     conn_to  = "RCPT TO:<"+c_array[k]+">";
     System.out.println(conn_to);
     sendData(conn_to);
    if(k == xRCPT) {
       x = CLIENT_START_DATA;
    }else{
       k++;
    }
  }else{
     System.err.println(inData);
     x = CLIENT_CLOSE_CONNECTION;
  }
  break;

  case CLIENT_START_DATA:
  if(j == SMTP_OK || j == SMTP_FORWARD_OK) {
     sendData("DATA");
     x = CLIENT_END_DATA;
  }else{
   System.err.println(inData);
   x = CLIENT_CLOSE_CONNECTION;
  }
  break;

  case CLIENT_END_DATA:
  if(j == SMTP_START_BODY) {
     sendData(conn_data);
     x = CLIENT_SEND_QUIT;
  }else{
     System.err.println(inData);
     x = CLIENT_CLOSE_CONNECTION;
  }
  break;

  case CLIENT_SEND_QUIT:
     sendData("QUIT");
     System.err.println(inData);
     x = CLIENT_CLOSE_CONNECTION;
     break;
  }
 }while(x<CLIENT_CLOSE_CONNECTION);
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
};

