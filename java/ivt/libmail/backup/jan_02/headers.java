/*
 *   mailer. JAVA Mailer Headers.
 *   Description  : Mime Headers.
 *   Dependencies : JAVA VM 1.2+
 *   Platform     : any()
 *   Version      : 1.0.2
 *   Credit       : this()
 *   Copyright (C) 2001
 *
 *  To contact the author email: null@null.co.za
 *  Todo :
*/

 public class headers {

  private strlib ns        = new strlib();
  private String boundary  = "gc0p4Jq0M2Yt08jU534c0p";
  private byte bCRLF[]     = {13, 10};
  private String CRLF      = new String(bCRLF);
  private String cData;
  private String fData;
  public  int    xRCPT             = 0;

  public  String inHost;
  public  String inEmailFrom;
  public  String inEmailTo;
  public  String inSubject;
  public  String inBody;
  public  String inAttach;

  public headers() {
  }

  private boolean isspace(byte b) {
     if ((int)b == 32) {
       return true;
     }else{
       return false;
     }
  }

  public String[] getRecipients() {
    String[] c_array    = new String[inEmailTo.length()];
    int    xIndex;
    String xReturn;
    for (int i=0;i<c_array.length;i++){
    try {
      xIndex            = inEmailTo.indexOf(";",i);
      xReturn           = inEmailTo.substring(i,xIndex);
      xRCPT             = xRCPT+1;
      c_array[xRCPT]    = xReturn;
      i = xIndex;
        }catch(StringIndexOutOfBoundsException e){
              xRCPT          = xRCPT+1;
              xReturn        = inEmailTo.substring(i);
              c_array[xRCPT] = xReturn;
              return c_array;
        }
    }
              return c_array;
  }

  public String getMessage(int mailType) {
     cData = cData + ("Reply-To: "     +inEmailFrom         +CRLF);
     cData = cData + ("From: "         +inEmailFrom         +CRLF);
     cData = cData + ("To: "           +inEmailTo           +CRLF);
     cData = cData + ("Subject: "      +inSubject           +CRLF);
     cData = cData + ("X-Mailer: nullSMTP v1.0."+ns.y2k()   +CRLF);
   if(mailType == 0) {
     cData = cData + ("Content-Type: text/plain; charset=us-ascii"+CRLF);
     cData = cData + ("Content-Transfer-Encoding: 7bit"+CRLF+CRLF);
     cData = cData + (inBody+CRLF);
   }else
   if(mailType == 1) {
     cData = cData + ("MIME-Version: 1.0"+CRLF);
     cData = cData + ("Content-Type: multipart/mixed; boundary="+boundary+CRLF);
     cData = cData + ("Content-Transfer-Encoding: 7bit"+CRLF+CRLF);
     cData = cData + ("--"+boundary+CRLF+CRLF);
     cData = cData + (inBody+CRLF+CRLF);
     cData = cData + (getFile());
    }
     cData = cData + (CRLF+"."+CRLF);
  return cData;
  }

  private String getFile() {
    attach fileAttach;
    String   fileTitle  = null;
    String[] attachFile = null;

    String[] s_array      = new String[inAttach.length()];
    int    xIndex;
    String xReturn;
    for (int i=0;i<s_array.length;i++){
      try {
        xIndex            = inAttach.indexOf(";",i);
        xReturn           = inAttach.substring(i,xIndex);        
        xRCPT             = xRCPT+1;
        s_array[xRCPT]    = xReturn;
        i = xIndex;
        }catch(StringIndexOutOfBoundsException e){
            xRCPT          = xRCPT+1;
            xReturn        = inAttach.substring(i);
            s_array[xRCPT] = xReturn;
            attachFile     = s_array;
      }
    }
    try {
      for (int i=0;i<attachFile.length;i++) {
//        System.out.println(attachFile[i]);
/**
        fileAttach = new attach(attachFile[i]);
        fileTitle  = attachFile[i]+";"+fileTitle;
        fData = fData + ("--"+boundary+CRLF);
        fData = fData + (fileAttach.getEncodedFile()+CRLF+CRLF);
**/
      }
    }catch(Exception ex){ System.out.println("Exception [attach] : " + ex); }    
      fData = fData + ("--"+boundary+"--");
   return fData;
  }

 };
