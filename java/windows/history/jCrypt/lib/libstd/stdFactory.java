/**
  * desc : stdlib. standard system routines.
  * mods : 25/01/2002-11:17:00:GMT+2
  * auth : null@null.co.za
  * todo : write constructor(+value)
  **/

package lib.libstd;

import com.ms.wfc.app.*;
import com.ms.wfc.core.*;
import com.ms.wfc.ui.*;
import com.ms.win32.win.*;
import com.ms.dll.*;
import com.ms.com.*;

import java.util.Date;
import java.util.Properties;
import java.io.*;

public class stdFactory {

//
// initilizers -- private
//
 
  private String  Version    = null;
  private int     appStatus  = -1;
  private int     debugState = -1;

//
// initilizers -- private
//

  public  String sd      = null;

//
// error codes -- public
// 

  public static final  int  FATAL_EXCEPTION      = 0;
  public static final  int  SYSTEM_EXCEPTION     = 1;
  public static final  int  LINK_EXCEPTION       = 2;
  public static final  int  IO_EXCEPTION         = 3;
  public static final  int  LIB_EXCEPTION        = 4;
  public static final  int  LOAD_EXCEPTION       = 5;
  public static final  int  MAIL_EXCEPTION       = 6;
  public static final  int  INFO_EXCEPTION       = 7;
  public static final  int  REGISTRY_EXCEPTION   = 8;
  public static final  int  INSTALL_EXCEPTION    = 9;
  public static final  int  UNINSTALL_EXCEPTION  = 10;

//
// instantces
//

  private Properties       sysProp = System.getProperties();
  private lib.libstr.strFactory ns = new lib.libstr.strFactory();
  private int          checkResult = -1;
  private int                   sp = checkResult;
  private String                st = new Date().toLocaleString();

//
// package includes
//

  public  String packageName       = null;
  public  String productSupport    = null;

  public stdFactory() {
     try {
        checkVersion();
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()              +"\n";
        errHandler(LOAD_EXCEPTION, "stdFactory()", eet);
     }
   }

   public String errHandler(int    ec,
                            String ep,
                            String ext) {
   String std             = null;
   int    msgReturn       = 0;
   try {
      if(ec  != -1   &&
         ep  != null &&
         ext != null) {
         std =       "An error has occured with the following information :";
         std = std + "\n\n";

         std = std + ext;

         std = std + "<ec> : "+ ec +"\n";
         std = std + "<ep> : "+ ep +"\n";
         std = std + "<sd> : "+ sd +"\n";
         std = std + "<sp> : "+ sp +"\n";
         std = std + "<st> : "+ st +"\n";
         std = std + "\n";
         std = std + "Do you wish to send this information to our support group?\n";

         msgReturn = MessageBox.show(std, "Installation error", MessageBox.YESNO + MessageBox.ICONERROR);
         openMailer(msgReturn, "jInstaller:[ERROR]:package:["+packageName+"]", ns.Mid(std, std.indexOf("<es>"), std.indexOf("Do")-std.indexOf("<es>")-2), productSupport);

         if (ec == FATAL_EXCEPTION ||
             ec == LOAD_EXCEPTION  ||
             ec == SYSTEM_EXCEPTION) {
            System.exit(-1);
            return null;
         }
      }
   }catch(Exception e){     
      String eet        = null;
      eet =             "";
      eet = eet + "<es> : "+ e.toString() +"\n";	
      eet = eet + "<dp> : ";
      eet = eet + "<dl> : ";
      eet = eet + "<fe> : ";
      eet = eet + "<fg> : ";
      eet = eet + "<ia> : ";
      eet = eet + "<im> : ";
      errHandler(FATAL_EXCEPTION, "errHandler()", eet);
     }
      return null;
   }

   public int openMailer(int    msgReturn,
                         String msgSubject,
                         String msgBody,
                         String msgEmail) {
     try {
        if(msgReturn  != -1   &&
           msgSubject != null &&
           msgBody    != null &&
           msgEmail   != null) {
           msgSubject = ns.Replace(msgSubject, " ", "%20", 0);
           msgBody    = ns.Replace(ns.asciiReplace(msgBody, 10, "%0A", 0), " ", "%20", 0);
           String mailto = "mailto:"  +msgEmail+
                           "?subject="+msgSubject+
                           "&body="   +msgBody;
           if (msgReturn == DialogResult.YES) {
              Runtime gh = Runtime.getRuntime();
              gh.exec(mailto);
           }
        }
     }catch(Exception e){     
         String eet        = null;
         eet =             "";
         eet = eet + "<es> : "+ e.toString()                     +"\n";
         eet = eet + "<ia> : "+ new Integer(msgReturn).toString()+"\n";
         eet = eet + "<ia> : "+ msgSubject                       +"\n";
         eet = eet + "<ia> : "+ msgBody                          +"\n";
         eet = eet + "<ia> : "+ msgEmail                         +"\n";
         errHandler(FATAL_EXCEPTION, "openMailer()", eet);
     }
         return 0;
   }

  public int checkVersion() {
    try {
       sd = sysProp.getProperty("com.ms.sysdir");
    }catch(Exception e){
       String eet        = null;
       eet =             "";
       eet = eet + "<es> : "+ e.toString()              +"\n";
       errHandler(SYSTEM_EXCEPTION, "checkVersion()", eet);
    }
       return 0;
  }

  public String[] y2k(int dateRequest) {
    Date   dt        = new Date();
    String dateYear  = Integer.toString(dt.getYear() +1900);
    String dateMonth = Integer.toString(dt.getMonth()+1);
    String dateDay   = Integer.toString(dt.getDate());
    String log_date  = dt.toLocaleString();
    try {
      for (int i=0;i<=9;i++) {
        if (dateDay   == Integer.toString(i)) { dateDay   = "0"+i; }
        if (dateMonth == Integer.toString(i)) { dateMonth = "0"+i; }
      }
    }catch(Exception e){
       String eet        = null;
       eet =             "";
       eet = eet + "<es> : "+ e.toString()              +"\n";
       errHandler(SYSTEM_EXCEPTION, "checkVersion()", eet);
    }
       if (dateRequest == 0) {
          return new String[] { log_date };
       }else
       if (dateRequest == 1) {
          return new String[] { dateMonth + "/" + dateDay + "/" + dateYear };
       }else
       if (dateRequest == 2) {
          return new String[] { dateDay, dateMonth, dateYear };
       }else
       if (dateRequest == 3) {
          return new String[] { dateDay + dateMonth + dateYear };
       }else
          return null;
  }

  public static void main(String args[]) {
     try {         
        new stdFactory();
     }catch(Exception e){
        String eet        = null;
        eet =             "";
        eet = eet + "<es> : "+ e.toString()              +"\n";
        new stdFactory().errHandler(SYSTEM_EXCEPTION, "main()", eet);
     }
  }
};
