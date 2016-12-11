/**
  * desc : mailer. JAVA Mime attachments.
  * mods : 01/02/2002-11:17:00:GMT+2
  * auth : null@null.co.za
  * todo : 
  **/

import java.io.*;

  public class attach { 

private  int        encodingType;
public   int        MIMEType;
private  byte bCRLF[]     = {13, 10};
private  String CRLF      = new String(bCRLF);
private  String     MIMEHeader;
private  File       inFile;

    // Sets the encoding type constants
private final static int ENC_7BIT = 1;
private final static int ENC_8BIT = 2;
private final static int ENC_BINARY = 3;
private final static int ENC_QUOTED = 4;
private final static int ENC_BASE64 = 5;

    //Stes the MIME type constants
private final static int MIME_TEXT_PLAIN = 1;
private final static int MIME_TEXT_HTML = 2;
private final static int MIME_TEXT_XML = 3;
private final static int MIME_TEXT_CSS = 4;
private final static int MIME_IMAGE_GIF = 5;
private final static int MIME_IMAGE_JPEG = 6;
private final static int MIME_AUDIO_MPEG = 7;
private final static int MIME_AUDIO_BASIC = 8;
private final static int MIME_AUDIO_WAV = 9;
private final static int MIME_VIDEO_MPEG = 10;
private final static int MIME_VIDEO_AVI = 11;
private final static int MIME_APPLICATION_PDF = 12;
private final static int MIME_APPLICATION_POSTSCRIPT = 13;
private final static int MIME_APPLICATION_OCTECT = 14;

 public attach(){ }

 public attach(String filepath) {
    inFile = new File(filepath);
    encodeData();
 }

 public attach(File filepath) {
    inFile   = filepath;
    encodeData();
 }

 public void setFile(String filepath) {
    inFile   = new File(filepath);
    encodeData();
 }

 public void setFile(File filepath) {
    inFile   = filepath;
    encodeData();
 }

 public String getEncodedFile() { 
    return encodeFile();
 }

 public File getFile() { 
    return inFile;
 }

 private void encodeData() {
    String fileName  = inFile.getName();
    int i            = fileName.lastIndexOf(".");
    String fileEx    = fileName.substring(i+1);

    if (fileEx.equalsIgnoreCase("text")        ||
        fileEx.equalsIgnoreCase("txt")) {
      MIMEType   = MIME_TEXT_PLAIN;
      MIMEHeader = "text/plain; charset=us-ascii";
    }else 
    if(fileEx.equalsIgnoreCase("shtml")    ||
       fileEx.equalsIgnoreCase("html")     ||
       fileEx.equalsIgnoreCase("htm")      ||
       fileEx.equalsIgnoreCase("sgml")) {
     MIMEType   = MIME_TEXT_HTML;
     MIMEHeader = "text/html; charset=us-ascii";
    }else
    if (fileEx.equalsIgnoreCase("xsl")     ||
        fileEx.equalsIgnoreCase("xml")) {
     MIMEType   = MIME_TEXT_XML;
     MIMEHeader = "text/xml; charset=us-ascii";
    }else
    if (fileEx.equalsIgnoreCase("css")) {
     MIMEType   = MIME_TEXT_CSS;
     MIMEHeader = "text/css; charset=us-ascii";
    }else
    if (fileEx.equalsIgnoreCase("gif")) {
     MIMEType   = MIME_IMAGE_GIF;
     MIMEHeader = "image/gif";
    }else
    if(fileEx.equalsIgnoreCase("jpeg")     ||
       fileEx.equalsIgnoreCase("jpg")      ||
       fileEx.equalsIgnoreCase("jpe")      ||
       fileEx.equalsIgnoreCase("jfif")     ||
       fileEx.equalsIgnoreCase("pjpeg")    ||
       fileEx.equalsIgnoreCase("pjp")) {
     MIMEType   = MIME_IMAGE_JPEG;
     MIMEHeader = "image/jpeg";
    }else
    if(fileEx.equalsIgnoreCase("mp3")      ||
       fileEx.equalsIgnoreCase("mp2")      ||
       fileEx.equalsIgnoreCase("mpa")      ||
       fileEx.equalsIgnoreCase("abs")      ||
       fileEx.equalsIgnoreCase("mpega")) {
     MIMEType   = MIME_AUDIO_MPEG;
     MIMEHeader = "audio/mpeg";
    }else
    if (fileEx.equalsIgnoreCase("au")      ||
        fileEx.equalsIgnoreCase("snd")) {
     MIMEType   = MIME_AUDIO_BASIC;
     MIMEHeader ="audio/basic";
    }else
    if (fileEx.equalsIgnoreCase("wav")) {
     MIMEType = MIME_AUDIO_WAV;
     MIMEHeader="audio/wav";
    }else
    if (fileEx.equalsIgnoreCase("mpeg")    ||
       fileEx.equalsIgnoreCase("mpg")      ||
       fileEx.equalsIgnoreCase("mpe")      ||
       fileEx.equalsIgnoreCase("mpv")      ||
       fileEx.equalsIgnoreCase("mlv")) {
     MIMEType   = MIME_VIDEO_MPEG;
     MIMEHeader = "video/mpeg";
    }else
    if (fileEx.equalsIgnoreCase("avi")) {
     MIMEType = MIME_VIDEO_AVI;
     MIMEHeader="video/avi";
    }else
    if (fileEx.equalsIgnoreCase("pdf")) {
     MIMEType = MIME_APPLICATION_PDF;
     MIMEHeader="application/pdf";
    }else
    if (fileEx.equalsIgnoreCase("ai")      ||
       fileEx.equalsIgnoreCase("eps")      ||
       fileEx.equalsIgnoreCase("ps")) {
     MIMEType = MIME_APPLICATION_POSTSCRIPT;
     MIMEHeader="application/postscript";
    }else
    if (MIMEHeader == null) {
     MIMEType = MIME_APPLICATION_OCTECT;
     MIMEHeader="application/octet-stream";
    }
   }

 private byte[] loadFile() {
    FileInputStream fs;
    byte[] file  = new byte[(int)inFile.length()];
    int inp      = 0;
    int i        = 0;
    encodingType = ENC_7BIT;
    try {
       fs = new FileInputStream(inFile);
       while(inp != -1) {    
       inp        = fs.read();
         if(inp   != -1) {
         if(!((inp > 31 && inp < 127) || inp == 13 || inp == 10 || inp == 9)) { 
            encodingType = ENC_BASE64;
         }
         file[i] = (byte)inp;
         i++;
         }
       }
      fs.close();
    }
    catch(IOException e){ System.out.println("Exception [attach] : " + e); }
    return file;
  }

 private String getMIMEHeader() {
  String enctype = null;
  String header  = null;
  switch (encodingType) {
   case ENC_7BIT:
     enctype = "7bit";
     break;
   case ENC_BASE64: 
     enctype = "base64";
     break;
   }
   header = header+"Content-Type: "+MIMEHeader+";";
   header = header+"name="+inFile.getName()+CRLF;
   header = header+"Content-Transfer-Encoding: "+enctype+CRLF;
   header = header+"Content-Disposition: attachment;";
   header = header+"filename="+inFile.getName();
   header = header+CRLF+CRLF;
   return header;
 }

 private String encodeFile(){
  byte[]  fileData     = loadFile();
  String  filestring = null;
  encoder encoderObj;

  switch (encodingType) {
   case ENC_7BIT:
      encoderObj  = new Encode7bit(fileData);    
      try {
        filestring = encoderObj.encode();
      }catch (EncodingException exp){ System.out.println(exp.toString()); }
      break;
   default:
      encoderObj  = new EncodeBase64(fileData);
      try {
        filestring = encoderObj.encode();
      }catch (EncodingException exp){ System.out.println(exp.toString()); }
       break;
     }
   filestring = getMIMEHeader() + filestring;

  return filestring;
 }

 };

