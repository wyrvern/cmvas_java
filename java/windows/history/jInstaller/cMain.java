/*
 * @desc	: cMain. main() class for jInstaller.
 * @version	: 0.1-0  28/05/2002
 * @author	: null@null.co.za
 * @revisions   : n/a
 * @since	: v1.0.e
 */

import com.ms.wfc.app.*;
import com.ms.wfc.core.*;
import com.ms.wfc.ui.*;
import com.ms.dll.*;
import com.ms.com.*;
import com.ms.win32.*;
import com.ms.util.*;

import java.util.Date;
import java.util.Properties;
import java.io.*;

public class cMain extends Form {

//
// package information
//

private String verInstaller             = "1.0.e";
private String verPackage               = null;

//
// publicly accessible values
//

 public  String sd                      = null;
 public  String osName                  = null;
 public  String appDir                  = null;
 public  String desktopDir              = null;
 public  String programDir              = null;
 public  String installDir              = null;
 public  String OSVersion               = null;
 public  String objPath                 = null;
 
//
// package includes
//

 public  String productCompany          = null;
 public  String productContact          = null;
 public  String productURL              = null;
 public  String packageName             = null;
 public  String packageDir              = null;
 public  String productSupport          = null;
 public  String packageExe              = null;
 public  String packageIco              = null;
 public  String packageLnk              = null;
 public  String installFolder           = null;

 public  String packageSet              = "jInstaller.exe";
 public  String packageSetArg           = "/u";
 public  String packageSetLnk           = "Uninstall.lnk";
 public  String uninstallIco            = "un.ico";
 public  String startupLnk              = "Startup\\jInstaller.lnk";

 public  String packageLocation         = "package\\";
 public  String jvmLocation             = "jvm\\";

 public static String localFiles[]      = null;
 public static String systemFiles[]     = null;
 public static String localRegister[]   = null;
 public static String systemRegister[]  = null;
 public static String copyPackage[]     = null;

//
// win32 api
//

/** @dll.import("shell32") */
  private static native int DllRegisterServer();

/** @dll.import("shell32") */
  private static native int DllUnregisterServer();

/** @dll.import("kernel32",auto) */
  private native static int LoadLibrary(String lpLibFileName);

/** @dll.import("kernel32",auto) */
  private native static int LoadLibraryEx(String lpLibFileName, int hFile, int dwFlags);

/** @dll.import("kernel32",auto) */
  private native static boolean FreeLibrary(int hLibModule);

/** @dll.import("kernel32",ansi) */
  private native static int GetProcAddress(int hModule, String lpProcName);

/** @dll.import("msjava") */
  private native static boolean call(int funcptr, String argument);

/** @dll.import("shell32") */
  private static native int SHBrowseForFolder(lib.libshellx.BROWSEINFO bi);

/** @dll.import("shell32") */
  private static native boolean SHGetPathFromIDList(int pidl, StringBuffer path);

/** @dll.import("kernel32") */
  private native static boolean CopyFile(String pExistingFileName, String pNewFileName, boolean bFailIfExists);

/* recent */

/** @dll.import("user32", setLastError) */
  private native static boolean ExitWindowsEx(int uFlags, int dwReserved);

/** @dll.import("advapi32", setLastError) */
  private native static boolean OpenProcessToken(int ProcessHandle, int DesiredAccess, int TokenHandle[]);

/** @dll.import("kernel32", setLastError) */
  private native static int GetCurrentProcess();

/** @dll.import("advapi32", setLastError) */
  private native static boolean AdjustTokenPrivileges(int TokenHandle, boolean DisableAllPrivileges, lib.libshellx.TOKEN_PRIVILEGES NewState, int BufferLength, lib.libshellx.TOKEN_PRIVILEGES PreviousState, int ReturnLength);

/** @dll.import("advapi32", setLastError) */
  private native static boolean LookupPrivilegeValue(String lpSystemName, String lpName, lib.libshellx.LUID lpLuid);

/** @dll.import("kernel32", setLastError) */
  private native static boolean GetVersionEx(lib.libshellx.OSVERSIONINFO lpVersionInfo);

// global instantces

 public  Properties sysProp            = System.getProperties();
 private Date   dt                     = new Date();
 public  lib.libstr.strFactory ns      = new lib.libstr.strFactory();
 private lib.libsys.sysFactory sf      = new lib.libsys.sysFactory();

 public  int    checkResult            = -1;

// constants - shellx

 private static final int  BIF_VALIDATE         = 0x0020;
 private static final int  BIF_RETURNONLYFSDIRS = 0x0001;
 private static final int  BUFSIZ               = 1024;
 private static final int  MAX_PATH             = 1024;

// system path constants -- public

 public static final  int  USER_DESKTOP         = 0;
 public static final  int  APPLICATION_DATA     = 1;
 public static final  int  MY_DOCUMENTS         = 2;
 public static final  int  COOKIES              = 3;
 public static final  int  DESKTOP_DIRECTORY    = 4;
 public static final  int  FAVORITES            = 5;
 public static final  int  HISTORY              = 6;
 public static final  int  INTERNET_CACHE       = 7;
 public static final  int  PROGRAMS             = 8;
 public static final  int  RECENT               = 9;
 public static final  int  SENDTO               = 10;
 public static final  int  START_MENU           = 11;
 public static final  int  STARTUP              = 12;
 public static final  int  TEMPLATES            = 13;
 
// error codes -- public

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

// action indentifiers -- registry -- public

 public static final int  DLL_REGISTER          = 0;
 public static final int  DLL_UNREGISTER        = 1;

// action indentifiers -- io       -- public

 public static final int  IO_WRITE_LOCATION     = 0;
 public static final int  IO_READ_LOCATION      = 1;

// action indentifiers -- io -- copy source

 public static final int  IO_COPY_PACKAGE       = 0;
 public static final int  IO_COPY_SYSTEM        = 1;

// file attributes     -- io

 public static final String FileDescription        = "FileDescription=";
 public static final String Description            = "Description=";
 public static final String Language               = "Language=";
 public static final String FileType               = "FileType=";
 public static final String OperatingSystem        = "OperatingSystem=";
 public static final String MajorVersion           = "MajorVersion=";
 public static final String MinorVersion           = "MinorVersion=";
 public static final String InternalName           = "InternalName=";
 public static final String BuildNumber            = "BuildNumber=";
 public static final String FileVersion            = "FileVersion=";
 public static final String BuildIncrement         = "BuildIncrement=";
 public static final String ProductVersion         = "ProductVersion=";
 public static final String ComapnyName            = "ComapnyName=";
 public static final String LegalCopyright         = "LegalCopyright=";
 public static final String ProductName            = "ProductName=";
 public static final String OriginalFilename       = "OriginalFilename=";
 public static final String ProductVersionNumber   = "ProductVersionNumber=";

public String errHandler(int    ec,
                         String ep,
                         String ext) {
String std             = null;
int    msgReturn       = 0;
int    sp              = checkResult;
String st              = dt.toLocaleString();
  try {

     if(ec  != -1   &&
        ep  != null &&
        ext != null) {
        std =       "An error has occured with the following information :";
        std = std + "\n\n";
// eet:compliance
        std = std + ext;
// std
        std = std + "<ec> : "+ ec +"\n";
        std = std + "<ep> : "+ ep +"\n";
        std = std + "<sd> : "+ sd +"\n";
        std = std + "<sp> : "+ sp +"\n";
        std = std + "<st> : "+ st +"\n";
        std = std + "\n";
        std = std + "Do you wish to send this information to our support group?\n";

        msgReturn = MessageBox.show(std, "Installation error", MessageBox.YESNO + MessageBox.ICONERROR);
        openMailer(msgReturn,
                   "jInstaller:[ERROR]:package:["+packageName+"]",
                   ns.Mid(std, std.indexOf("<es>"), std.indexOf("Do y")- std.indexOf("<es>") - 2),
                   productSupport);
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

public int infoBox(int    msgType,
                   String msgTitle,
                   String msgText) {
  int    msgReturn       = -1;
  try {

     if(msgType  != -1   &&
        msgText  != null &&
        msgTitle != null) {
        if (msgType == 0) { msgReturn = MessageBox.show(msgText, msgTitle, MessageBox.ICONINFORMATION);
        }else
        if (msgType == 1) { msgReturn = MessageBox.show(msgText, msgTitle, MessageBox.YESNO + MessageBox.ICONEXCLAMATION);
        }else
        if (msgType == 2) { msgReturn = MessageBox.show(msgText, msgTitle, MessageBox.ICONERROR);
        }
     }
  }catch(Exception e){     
      String eet        = null;
      eet =             "";
      eet = eet + "<es> : "+ e.toString()                   +"\n";
      eet = eet + "<ia> : "+ msgTitle                       +"\n";
      eet = eet + "<ia> : "+ msgText                        +"\n";
      eet = eet + "<ia> : "+ new Integer(msgType).toString()+"\n";
      errHandler(FATAL_EXCEPTION, "errHandler()", eet);
  }
      return msgReturn;
}

public int updateConfig() {
  String cryptData = null;
  try {     
     String enc = "<a_cn_xyz>" + productCompany + ",";
     enc       += "<a_cc_xyz>" + productContact + ",";
     enc       += "<a_cu_xyz>" + productURL     + ",";
     enc       += "<a_pn_xyz>" + packageName    + ",";
     enc       += "<a_pd_xyz>" + packageDir     + ",";
     enc       += "<a_ps_xyz>" + productSupport + ",";
     enc       += "<a_se_xyz>" + packageExe     + ",";
     enc       += "<a_si_xyz>" + packageIco     + ",";
     enc       += "<a_sl_xyz>" + packageLnk     + ",";
     enc       += "<a_sd_xyz>" + installFolder  + ",";

     if(localFiles != null) {
        enc       += "<a_sl_fyz>";
           for (int j = 0; j < localFiles.length; ++j)
        enc       += localFiles[j]+ ";";
        enc       += ",";
     }else
        enc       += "<a_sl_fyz>,";

     if(systemFiles != null) {
        enc       += "<a_ss_fyz>";
           for (int j = 0; j < systemFiles.length; ++j)
        enc       += systemFiles[j]+ ";";
        enc       += ",";
     }else
        enc       += "<a_ss_fyz>,";

     if(localRegister != null) {
        enc       += "<a_sl_ryz>";
           for (int j = 0; j < localRegister.length; ++j)
        enc       += localRegister[j]+ ";";
        enc       += ",";
     }else
        enc       += "<a_sl_ryz>,";

     if(systemRegister != null) {
        enc       += "<a_ss_ryz>";
           for (int j = 0; j < systemRegister.length; ++j)
        enc       += systemRegister[j]+ ";";
        enc       += ",";
     }else
        enc       += "<a_ss_ryz>,";

     enc       += "<a_vp_xyz>" + verPackage     + ",";

     lib.libcrypt.cryptFactory c = new lib.libcrypt.cryptFactory();
     cryptData = c.crypt(enc);
     lib.libio.ioFactory      iw = new lib.libio.ioFactory(new File("jInstaller.ant"), cryptData, "write");
                   iw.write();
                   iw.close();
  }catch(Exception e){
     String eet        = null;
     eet =             "";
     eet = eet + "<es> : "+ e.toString()+"\n";
     errHandler(FATAL_EXCEPTION, "updateConfig()", eet);
  }
     return 0;
}

public String loadDefaults() {
  String strResult = null;
  String cryptData = null;
  try {
     lib.libcrypt.cryptFactory c = new lib.libcrypt.cryptFactory();
/**
     String enc = "<a_cn_xyz>isotop Global Partnership,";
     enc       += "<a_cc_xyz>info@isotop.net,";
     enc       += "<a_cu_xyz>http://www.isotop.net/,";
     enc       += "<a_ps_xyz>debug@isotop.net,";
     enc       += "<a_pn_xyz>isotop Demo,";
     enc       += "<a_pd_xyz>isotopDemo,";
     enc       += "<a_se_xyz>TimeSaver.exe,";
     enc       += "<a_si_xyz>isotop.ico,";
     enc       += "<a_sl_xyz>isotop Demo.lnk,";
     enc       += "<a_sd_xyz>C:\\Program Files\\isotopDemo\\,";
     enc       += "<a_sl_fyz>TimeSaver.exe;isotop.cnt;DemoData.ini;dealerdata.dat;isotop.gid;isotop.hlp;demodata.txt;un.ico;isotop.ico,";
     enc       += "<a_ss_fyz>msstdfmt.dll;msvbvm60.dll;msvcrt.dll;oledlg.dll;riched20.dll;riched32.dll;actbar.ocx;library.ocx;synFormLock.ocx;syngradient.ocx;synrich.ocx;synRichEd.ocx;vsview6.ocx;ssa3d30.ocx;ssscrl30.ocx;comdlg32.ocx;richtx32.ocx,";
     enc       += "<a_sl_ryz>,";
     enc       += "<a_ss_ryz>msstdfmt.dll,";
     enc       += "<a_vp_xyz>1.0.d";

     cryptData = c.crypt(enc);
     lib.libio.ioFactory      iw = new lib.libio.ioFactory(new File(Application.getStartupPath() + "\\jInstaller.ant"), cryptData, "write");
                   iw.write();
                   iw.close();
**/
     lib.libio.ioFactory      ir = new lib.libio.ioFactory(new File(Application.getStartupPath() + "\\jInstaller.ant"), null, "read");
     String rslt = ir.read();
                   ir.close();

     String[] slip          = ns.Split(c.decrypt(rslt), ",");
     for(int i=0;i<slip.length;i++) {
        if(ns.InStr(0, slip[i], "<a_cn_xyz>") != -1)
           productCompany    = ns.Mid(slip[i], "<a_cn_xyz>".length(), slip[i].length());
        if(ns.InStr(0, slip[i], "<a_cc_xyz>") != -1)
           productContact    = ns.Mid(slip[i], "<a_cc_xyz>".length(), slip[i].length());
        if(ns.InStr(0, slip[i], "<a_cu_xyz>") != -1)
           productURL        = ns.Mid(slip[i], "<a_cu_xyz>".length(), slip[i].length());
        if(ns.InStr(0, slip[i], "<a_ps_xyz>") != -1)
           productSupport    = ns.Mid(slip[i], "<a_ps_xyz>".length(), slip[i].length());
        if(ns.InStr(0, slip[i], "<a_pn_xyz>") != -1)
           packageName       = ns.Mid(slip[i], "<a_pn_xyz>".length(), slip[i].length());
        if(ns.InStr(0, slip[i], "<a_pd_xyz>") != -1)
           packageDir        = ns.Mid(slip[i], "<a_pd_xyz>".length(), slip[i].length());
        if(ns.InStr(0, slip[i], "<a_se_xyz>") != -1)
           packageExe        = ns.Mid(slip[i], "<a_se_xyz>".length(), slip[i].length());
        if(ns.InStr(0, slip[i], "<a_si_xyz>") != -1)
           packageIco        = ns.Mid(slip[i], "<a_si_xyz>".length(), slip[i].length());
        if(ns.InStr(0, slip[i], "<a_sl_xyz>") != -1)
           packageLnk        = ns.Mid(slip[i], "<a_sl_xyz>".length(), slip[i].length());
        if(ns.InStr(0, slip[i], "<a_sd_xyz>") != -1)
           installFolder     = ns.Mid(slip[i], "<a_sd_xyz>".length(), slip[i].length());

        if(ns.InStr(0, slip[i], "<a_sl_fyz>") != -1 &&
           ns.InStr(0, slip[i], ";")          != -1) {
          localFiles      = ns.Split(ns.Mid(slip[i], "<a_sl_fyz>".length(), slip[i].length()), ";");
        }else
        if(ns.InStr(0, slip[i], "<a_sl_fyz>") != -1 &&
           ns.InStr(0, slip[i], ";")          == -1) {
           localFiles = null;
        }

        if(ns.InStr(0, slip[i], "<a_ss_fyz>") != -1 &&
           ns.InStr(0, slip[i], ";")          != -1) {
           systemFiles    = ns.Split(ns.Mid(slip[i], "<a_ss_fyz>".length(), slip[i].length()), ";");
        }else
        if(ns.InStr(0, slip[i], "<a_ss_fyz>") != -1 &&
           ns.InStr(0, slip[i], ";")          == -1) {
           systemFiles = null;
        }

        if(ns.InStr(0, slip[i], "<a_sl_ryz>") != -1 &&
           ns.InStr(0, slip[i], ";")          != -1) {
           localRegister  = ns.Split(ns.Mid(slip[i], "<a_sl_ryz>".length(), slip[i].length()), ";");
        }else
        if(ns.InStr(0, slip[i], "<a_sl_ryz>") != -1 &&
           ns.InStr(0, slip[i], ";")          == -1) {
           localRegister = null;
        }

        if(ns.InStr(0, slip[i], "<a_ss_ryz>") != -1 &&
           ns.InStr(0, slip[i], ";")          != -1) {
           systemRegister = ns.Split(ns.Mid(slip[i], "<a_ss_ryz>".length(), slip[i].length()), ";");
        }else
        if(ns.InStr(0, slip[i], "<a_ss_ryz>") != -1 &&
           ns.InStr(0, slip[i], ";")          == -1) {
           systemRegister = null;
        }
        if(ns.InStr(0, slip[i], "<a_vp_xyz>") != -1)
           verPackage        = slip[i];
     }
  }catch(Exception e){
     String eet        = null;
     eet =             "";
     eet = eet + "<es> : "+ e.toString()+"\n";
     errHandler(FATAL_EXCEPTION, "getInfo()", eet);
  }
     return strResult;
}

public String evalFile(String file,
                       String request) {
  String strResult = null;
  try {
     if(file    != null &&
        request != null) {
        if(new File(file).isFile() == true) {
           FileVersionInformation fileVersion = new FileVersionInformation(file);
           String[] fileInfo = ns.Split(fileVersion.toString(), ",");
           for (int f=0; f < fileInfo.length; f++) {
              if(ns.InStr(0, fileInfo[f], request) != -1) {
                 String[] repParm ={ ",", ".", "}", "{" };
                 strResult = ns.Mid(fileInfo[f], request.length()+1, fileInfo[f].length());
                 for (int s=0; s<repParm.length; s++) {
                    strResult = ns.Replace(strResult, repParm[s], "", 0);
                 }
              }
           }
        }
     }else
        throw new Exception("Error: file version information invalid : [val:" + file + "]");
  }catch(Exception e){
      String eet        = null;
      eet =             "";
      eet = eet + "<es> : "+ e.toString()+"\n";
      eet = eet + "<ia> : "+ file        +"\n";
      eet = eet + "<ia> : "+ request     +"\n";
      errHandler(FATAL_EXCEPTION, "evalFile()", eet);
  }
     return strResult;
}

public int regModifier(String regAction,
                       String subKey,
                       String[] values) {
  try {

     if(regAction != null &&
        subKey    != null) {
        if (regAction.equalsIgnoreCase("create") &&
            values != null) {
           RegistryKey regKey = Registry.CURRENT_USER.createSubKey(subKey);
           for (int j = 0; j < values.length; j++) {
              regKey.setValue(ns.Split(values[j], ";")[j-j],ns.Split(values[j], ";")[j-j+1]);
           }
        }else
           if (regAction.equalsIgnoreCase("delete")) {
              Registry.CURRENT_USER.deleteSubKeyTree(subKey);
           }
     }else
        throw new Exception("Error: Registry information invalid : [val:" + values.length + "]");
  }catch(Exception e){
      String eet        = null;
      eet =             "";
      eet = eet + "<es> : "+ e.toString() +"\n";
      eet = eet + "<ia> : "+ regAction    +"\n";
      eet = eet + "<ia> : "+ subKey       +"\n";
      eet = eet + "<ia> : "+ values.length+"\n";
      errHandler(REGISTRY_EXCEPTION, "regModifier()", eet);
  }
      return 0;
}

public int objRegister(int modAction) {
  int     i         = 0;
  int     hmod;
  int     funcaddr;
  boolean result;
  try {
     if (modAction      != -1) {
        if (localRegister  != null) {
           for (; i < localRegister.length; i++) {
              if(localRegister[i] != "") {
                 hmod     = LoadLibrary(installDir + localRegister[i]);
                 if (modAction == DLL_REGISTER) {
                    funcaddr = GetProcAddress(hmod, "DllRegisterServer");
                    result   = call(funcaddr, "DllRegisterServer");
                 }else
                 if (modAction == DLL_UNREGISTER) {
                    funcaddr = GetProcAddress(hmod, "DllUnregisterServer");
                    result   = call(funcaddr, "DllUnregisterServer");
                 }
                 FreeLibrary(hmod);
              }
           }
        }
        if (systemRegister != null) {
           for (; i < systemRegister.length; i++) {
              if(systemRegister[i] != "") {
                 hmod     = LoadLibrary(sd + systemRegister[i]);
                 if (modAction == DLL_REGISTER) {
                    funcaddr = GetProcAddress(hmod, "DllRegisterServer");
                    result   = call(funcaddr, "DllRegisterServer");
                 }else
                 if (modAction == DLL_UNREGISTER) {
                    funcaddr = GetProcAddress(hmod, "DllUnregisterServer");
                    result   = call(funcaddr, "DllUnregisterServer");
                 }
                 FreeLibrary(hmod);
              }
           }
        }
     }
  }catch(Exception e){
      String eet        = null;
      eet =             "";
      eet = eet + "<es> : "+ e.toString() + "[win32]:" + DllLib.getLastWin32Error()+"\n";
      eet = eet + "<ia> : "+ new Integer(modAction).toString()                         +"\n";
      errHandler(LINK_EXCEPTION, "objRegister()", eet);
  }
      return 0;
}

public int createLink() {
/*  desktop / start_menu */
  try {
    objCreate(installDir + packageExe, desktopDir + packageLnk, installDir, packageName, installDir + packageIco, null);
    objCreate(installDir + packageExe, programDir + packageDir + packageLnk, installDir, packageName, installDir + packageIco, null);
/*  uninstall */
    objCreate(appDir + packageSet, programDir + packageDir + packageSetLnk, appDir, packageName, installDir + uninstallIco, packageSetArg);
  }catch(Exception e){
      String eet        = null;
      eet =             "";
      eet = eet + "<es> : "+ e.toString()+"\n";
      errHandler(LINK_EXCEPTION, "createLink()", eet);
  }
      return 0;
}

public String dialogOpen(String message) {
  try {

     if(message != null) {
        lib.libshellx.BROWSEINFO bi = new lib.libshellx.BROWSEINFO();
        if (message != null) {
           bi.lpszTitle = message;
        }
        bi.ulFlags = BIF_VALIDATE | BIF_RETURNONLYFSDIRS;
        int pidl   = SHBrowseForFolder(bi);
        if (pidl <= 0) {
           return null;
        }else{
           StringBuffer buf = new StringBuffer(BUFSIZ);
           if (SHGetPathFromIDList(pidl, buf)) {
              return buf.toString();
           }
        }
     }
  }catch(Exception e){
      String eet        = null;
      eet =             "";
      eet = eet + "<es> : "+ e.toString()+"\n";
      eet = eet + "<ia> : "+ message     +"\n";
      errHandler(FATAL_EXCEPTION, "dialogOpen()", eet);
  }
      return null;
}

public int objCreate(String exePath,
                     String lnkPath,
                     String workDir,
                     String lnkDesc,
                     String icoFile,
                     String lnkArgu) {
  try {
     if(exePath != null &&
        lnkPath != null &&
        workDir != null &&
        lnkDesc != null &&
        icoFile != null) {
        if(!sf.jTakeOwnership()) {
           throw new Exception("Operating Priviliges locked");
        }
        File    file        = new File(workDir);
        if(!file.isDirectory()) {
           throw new IOException("Installation Directory not found : " + workDir);
        }else{
           lib.libshell.IShellLinkA  psl = (lib.libshell.IShellLinkA)new lib.libshell.ShellLinkA();
           lib.libshell.IPersistFile ppf = (lib.libshell.IPersistFile)psl;
 
           psl.SetPath            (exePath);
           psl.SetWorkingDirectory(workDir);
           psl.SetDescription     (lnkDesc);
           psl.SetIconLocation    (icoFile, 0);
           if(lnkArgu != null)
              psl.SetArguments       (lnkArgu);
           psl.Resolve            (0, 6);
           ppf.Save               (lnkPath, 0);
       }
     }
  }catch(IOException e) {
      String eet        = null;
      eet =             "";
      eet = eet + "<es> : "+ e.toString()+"\n";
      eet = eet + "<dp> : "+ workDir     +"\n";
      eet = eet + "<dl> : "+ lnkPath     +"\n";
      eet = eet + "<fe> : "+ exePath     +"\n";
      eet = eet + "<fg> : "+ icoFile     +"\n";
      eet = eet + "<ia> : "+ lnkArgu     +"\n";
      eet = eet + "<im> : "+ lnkDesc     +"\n";
      errHandler(FATAL_EXCEPTION, "objCreate()", eet);
  }catch(Exception e) {
      String eet        = null;
      eet =             "";
      eet = eet + "<es> : "+ e.toString()+"\n";
      eet = eet + "<dp> : "+ workDir     +"\n";
      eet = eet + "<dl> : "+ lnkPath     +"\n";
      eet = eet + "<fe> : "+ exePath     +"\n";
      eet = eet + "<fg> : "+ icoFile     +"\n";
      eet = eet + "<ia> : "+ lnkArgu     +"\n";
      eet = eet + "<im> : "+ lnkDesc     +"\n";
      errHandler(LINK_EXCEPTION, "objCreate()", eet);
  }
      return 0;
}

public int delPath(File listDir) {
  try {
    String[] args = listDir.list();
    if (args != null) {
       for (int x=0; x< args.length; x++) {
          File listPath = new File(listDir + args[x]);
          listPath.delete();
       }
       if(listDir.isDirectory() == true) listDir.delete();
    }else
       if(listDir.isDirectory() == true) listDir.delete();
       if(listDir.isFile()      == true) listDir.delete();
  }catch(Exception e){
      String eet        = null;
      eet =             "";
      eet = eet + "<es> : "+ e.toString()      +"\n";
      eet = eet + "<ia> : "+ listDir.toString()+"\n";
      errHandler(IO_EXCEPTION, "delPath()", eet);
  }
      return 0;
}

public int createDirs() {
  try {
     delPath(new File(installDir));
     new File(installDir).mkdir();
     delPath(new File(programDir + packageDir));
     new File(programDir + packageDir).mkdir();
  }catch(Exception e){
      String eet        = null;
      eet =             "";
      eet = eet + "<es> : "+ e.toString()      +"\n";
      errHandler(IO_EXCEPTION, "createDir()", eet);
  }
      return 0;
}

public String ioLocation(int    ioAction,
                         String fileLocation,
                         String fileInput) {
     int c;
     int x = 0;
  try {

     if(ioAction     != -1   &&
        fileLocation != null) {
        if (ioAction == IO_WRITE_LOCATION) {
           FileWriter out = new FileWriter(new File(appDir + fileLocation));
           out.write(fileInput.toString());
           out.close();
           return "File : '" + fileLocation + "' written";        
        }else
        if (ioAction   == IO_READ_LOCATION &&
           new File(appDir + fileLocation).exists() == true) {
           FileReader in  = new FileReader(new File(appDir + fileLocation));
           String   s     = new String();
           while ((c = in.read()) != -1)
              s += new Character((char)c).toString();
           in.close();
           return s.toString(); 
        }else
           throw new Exception("Uninstall information missing.");
     }
  }catch(Exception e){
     String eet        = null;
     eet =             "";
     eet = eet + "<es> : "+ e.toString()                    +"\n";
     eet = eet + "<ia> : "+ new Integer(ioAction).toString()+"\n";
     eet = eet + "<ia> : "+ fileLocation                    +"\n";
     eet = eet + "<ia> : "+ fileInput                       +"\n";
     errHandler(FATAL_EXCEPTION, "ioLocation()", eet);
  }
     return null;
}

public int copyFiles(String copyDest,
                     int    copySrc) throws IOException {
  int     c         = 0;
  boolean over      = false;
  boolean ant       = false;
  boolean tan       = false;
  int     msgReturn = -1;

  String  local     = null;
  String  remote    = null;
  try {
     if(copyDest != null &&
        copySrc  != -1) {
        if (copySrc == IO_COPY_SYSTEM) {
           copyPackage = systemFiles;
        }else
        if (copySrc == IO_COPY_PACKAGE) {
           copyPackage = localFiles;
        }
        if (copyPackage != null) {
           for (int x=0; x < copyPackage.length; x++) {
              if(copySrc        == IO_COPY_SYSTEM &&
                 copyPackage[x] != "") {               
                 local  = evalFile(appDir + packageLocation + copyPackage[x], ProductVersion);
                 remote = evalFile(copyDest + copyPackage[x],                 ProductVersion);
                 if(local != null && remote != null) {
                    if(Integer.parseInt(local) > Integer.parseInt(remote) &&
                       tan == false) {
                       msgReturn = MessageBox.show("" +
                       "The new file [" + copyPackage[x] +"] "       +
                       "is a newer version than the existing file.\n"  +
                       "Do you wish to overwrite ?               \n\n" +
                       "Select 'Yes' to overwrite all,           \n"   +
                       "Select 'No' to skip overwrite of all,    \n"   +
                       "Select 'Cancel' to skip just this file.  \n\n",
                       "File Overwrite Confirmation", MessageBox.YESNOCANCEL + MessageBox.ICONWARNING);
                       if(msgReturn == DialogResult.YES) {
                          over = false;
                          tan  = true;
                       }else
                       if(msgReturn == DialogResult.NO) {
                          over = true;
                          tan  = true;
                       }else
                       if(msgReturn == DialogResult.CANCEL) {
                          over = true;
                          tan  = false;
                       }
                    }
                 }
              }
              String in  = appDir          + packageLocation + copyPackage[x];
              String out = copyDest        + copyPackage[x];
              CopyFile(in, out, over);
              c++;
              new File(packageLocation + copyPackage[x]).delete();
           }
           if (c == copyPackage.length) {
              new File(packageLocation).delete();
           } 
        }
     }
  }catch(Exception e){
     String eet        = null;
     eet =             "";
     eet = eet + "<es> : "+ e.toString()                   +"\n";
     eet = eet + "<ia> : "+ copyDest                       +"\n";
     eet = eet + "<ia> : "+ new Integer(copySrc).toString()+"\n";
     errHandler(FATAL_EXCEPTION, "copyFiles()", eet);
  }
     return 0;
}

public String sysPath(int id) {
  try {
     if(id != -1) {
        return SystemInformation.getSpecialFolderPath(id);
     }
  }catch(Exception e){
     String eet        = null;
     eet =             "";
     eet = eet + "<es> : "+ e.toString()              +"\n";
     eet = eet + "<ia> : "+ new Integer(id).toString()+"\n";
     errHandler(SYSTEM_EXCEPTION, "sysPath()", eet);
  }
     return null;
}

public String setSlash(String in) {
  try {

     if(in != null) {
        if (!ns.Right(in, 1).equalsIgnoreCase("\\")) {
           return in + "\\";
        }else
           return in;
     }
  }catch(Exception e){
     String eet        = null;
     eet =             "";
     eet = eet + "<es> : "+ e.toString()              +"\n";
     eet = eet + "<ia> : "+ in                        +"\n";
     errHandler(LIB_EXCEPTION, "setSlash()", eet);
  }
     return null;
}

public int checkVersion() {
  try {
      sd     = sysProp.getProperty("com.ms.sysdir");
      osName = sysProp.getProperty("os.name");
      sf.jOSFind();
    if(sf.x86xp == 0) {
      checkResult = 0;
      desktopDir        = sysPath(DESKTOP_DIRECTORY);
      programDir        = sysPath(PROGRAMS);
    }else
    if(sf.x86nt == 0) {
      checkResult = 1;
      desktopDir        = sysPath(DESKTOP_DIRECTORY);
      programDir        = sysPath(PROGRAMS);
    }else
    if(sf.x862k == 0) {
      checkResult = 2;
      desktopDir        = sysPath(DESKTOP_DIRECTORY);
      programDir        = sysPath(PROGRAMS);
    }else
    if(sf.x86me == 0) {
      checkResult = 3;
      desktopDir        = sysPath(DESKTOP_DIRECTORY);
      programDir        = sysPath(PROGRAMS);
    }else
    if(sf.x8698 == 0) {
      checkResult = 4;
      desktopDir        = sysPath(DESKTOP_DIRECTORY);
      programDir        = sysPath(PROGRAMS);
    }else
    if(sf.x8695 == 0) {
      checkResult = 5;
      desktopDir        = sysPath(DESKTOP_DIRECTORY);
      programDir        = sysPath(PROGRAMS);
    }

  }catch(Exception e){
     String eet        = null;
     eet =             "";
     eet = eet + "<es> : "+ e.toString()              +"\n";
     errHandler(SYSTEM_EXCEPTION, "checkVersion()", eet);
  }
     return 0;
}

public String setHeader() {
try {
  switch(checkResult) {
    case -1:
       String eet        = null;
       eet =             "";
       eet = eet + "<es> : "+ "System settings incorrect."+"\n";
       errHandler(SYSTEM_EXCEPTION, "setHeader()", eet);
       return null;
    case 0:
       OSVersion = "Microsoft Windows XP";
       return "jInstaller ver "+verInstaller+" : " + OSVersion;
    case 1:
       OSVersion = "Microsoft Windows NT";
       return "jInstaller ver "+verInstaller+" : " + OSVersion;
    case 2:
       OSVersion = "Microsoft Windows 2000";
       return "jInstaller ver "+verInstaller+" : " + OSVersion;
    case 3:
       OSVersion = "Microsoft Windows ME";
       return "jInstaller ver "+verInstaller+" : " + OSVersion;
    case 4:
       OSVersion = "Microsoft Windows 98";
       return "jInstaller ver "+verInstaller+" : " + OSVersion;
    case 5:
       OSVersion = "Microsoft Windows 95";
       return "jInstaller ver "+verInstaller+" : " + OSVersion;
   }
 }catch(Exception e){
     String eet        = null;
     eet =             "";
     eet = eet + "<es> : "+ e.toString()+"\n";
     errHandler(LOAD_EXCEPTION, "setHeader()", eet);
  }
     return null;
}

};
