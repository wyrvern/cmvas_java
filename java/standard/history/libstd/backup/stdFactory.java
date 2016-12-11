/**
  * desc : stdlib. standard system routines.
  * mods : 02/01/2002-21:14:00:GMT+2
  * auth : null@null.co.za
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

import lib.libstr.*;

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

  public  String sysDir      = null;

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

  public  Properties       sysProp = System.getProperties();
  private Date                  dt = new Date();
  private lib.libstr.strFactory ns = new lib.libstr.strFactory();
  public  int          checkResult = -1;

//
// package includes
//

  public  String packageName       = null;
  public  String productSupport    = null;

  public stdFactory() {
     try {

     }catch(Exception e){
        errHandler(LOAD_EXCEPTION, "stdFactory()", e.toString());
        return;  
     }
   }

  public String errHandler(int errNumber,
                           String errLocate,
                           String exType) {
  String strResult       = null;
  int    msgReturn       = 0;
    try {
        strResult =             "An error has occured with the following information :\n\n";
        strResult = strResult + "Error Code : "+errNumber+"\n";
        strResult = strResult + "System Dir : "+sysDir+"\n";
        strResult = strResult + "Platform   : "+checkResult+"\n";
        strResult = strResult + "Location   : "+errLocate+"\n";
        strResult = strResult + "TimeStamp  : "+dt.toLocaleString()+"\n";
        strResult = strResult + "Exception  : "+exType;
        strResult = strResult + "\n\nDo you wish to send this information ";
        strResult = strResult + "to our support group?\n";

        msgReturn = MessageBox.show(strResult, "Installation error", MessageBox.YESNO + MessageBox.ICONERROR);
        openMailer(msgReturn, "jInstaller:[ERROR]:package:["+packageName+"]",ns.Mid(strResult, strResult.indexOf("Error Code"), strResult.indexOf("Do")-strResult.indexOf("Error Code")-2), productSupport);
        if (errNumber == FATAL_EXCEPTION ||
            errNumber == LOAD_EXCEPTION  ||
            errNumber == SYSTEM_EXCEPTION) {
           System.exit(-1);
           return null;
        }
    }catch(Exception e){     
        errHandler(FATAL_EXCEPTION, "errHandler()", e.toString());
    }
        return null;
  }


  public int openMailer(int    msgReturn,
                        String msgSubject,
                        String msgBody,
                        String msgEmail) {
    try {
       msgSubject = ns.Replace(msgSubject, " ", "%20", 0);
       msgBody    = ns.Replace(ns.asciiReplace(msgBody, 10, "%0A", 0), " ", "%20", 0);
       String mailto = "mailto:"  +msgEmail+
                       "?subject="+msgSubject+
                       "&body="   +msgBody;
       if (msgReturn == DialogResult.YES) {
          Runtime gh = Runtime.getRuntime();
          gh.exec(mailto);
       }
    }catch(Exception e){     
        errHandler(MAIL_EXCEPTION, "openMailer()", e.toString());
    }
        return 0;
  }

  public int checkVersion() {
    try {
       sysDir = sysProp.getProperty("com.ms.sysdir");
    }catch(Exception e){
        errHandler(SYSTEM_EXCEPTION, "checkVersion()", e.toString());
    }
        return 0;
  }

  public static void main(String args[]) {
     try {
      if (args.length > 0) {
         if (args[0].equalsIgnoreCase("/u")) {

         }
      }else
        new stdFactory();
      }catch(Exception e){
        return;
      }
  }
};
