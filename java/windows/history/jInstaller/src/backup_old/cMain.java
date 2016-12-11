/**
 *
 * todo :
   // -------------------------- //
       Runtime gh = Runtime.getRuntime();
       String mailto = "mailto:support@isotop.net?subject=error&body=this";
       gh.exec(mailto);
   // -------------------------- //
       Application.die() on error.
 *
 **/

import java.za.strlib.*;
import java.za.jShell.*;
import java.za.jShell.IPersistFile;

import com.ms.wfc.app.*;
import com.ms.wfc.core.*;
import com.ms.wfc.ui.*;
import com.ms.wfc.html.*;
import com.ms.win32.win.*;
import com.ms.dll.*;
import com.ms.com.*;
import java.util.Date;
import java.util.Properties;
import java.io.*;

public class cMain extends Form {

// installer version

private String verInstaller      = "1.0.a";

// private libraries

/** @dll.import("C:\\win32_code\\src\\java\\ide\\installer\\strlib") */
private static native void Strlib();

// win32 api

/** @dll.import("shell32") */
private static native int DllRegisterServer();
/** @dll.import("shell32") */
private static native int DllUnregisterServer();
/** @dll.import("KERNEL32",auto) */
private native static int LoadLibrary(String lpLibFileName);
/** @dll.import("KERNEL32",auto) */
private native static int LoadLibraryEx(String lpLibFileName, int hFile, int dwFlags);
/** @dll.import("KERNEL32",auto) */
private native static boolean FreeLibrary(int hLibModule);
/** @dll.import("KERNEL32",ansi) */
private native static int GetProcAddress(int hModule, String lpProcName);
/** @dll.import("msjava") */
private native static boolean call(int funcptr,String argument);

// global instantces

private Date   dt                = new Date();
private strlib ns                = new strlib();
private int    checkResult       = -1;

// system path constants

private int  APPLICATION_DATA    = 1;
private int  MY_DOCUMENTS        = 2;
private int  COOKIES             = 3;
private int  DESKTOP_DIRECTORY   = 4;
private int  FAVORITES           = 5;
private int  HISTORY             = 6;
private int  INTERNET_CACHE      = 7;
private int  PROGRAMS            = 8;
private int  RECENT              = 9;
private int  SENDTO              = 10;
private int  START_MENU          = 11;
private int  STARTUP             = 12;
private int  TEMPLATES           = 13;
private int  USER_DATA           = 0;

// error codes

private int  FATAL_EXCEPTION     = 0;
private int  SYSTEM_DIR_MISSING  = 1;
private int  LINK_EXCEPTION      = 2;
private int  DIR_EXCEPTION       = 3;
private int  DEL_EXCEPTION       = 4;
private int  COPY_EXCEPTION      = 5;

// error-related String Identifiers.

private int  IDS_COMINITFAILED   = 2000;
private int  IDS_OUTOFMEMORY     = 2001;
private int  IDS_DLLUNREG_FAIL   = 2002;
private int  IDS_DLLREG_FAIL     = 2003;
private int  IDS_LOADLIB_FAIL    = 2004;
private int  IDS_EXERUN_FAIL     = 2005;

private int  IDS_ASSERT_FAIL     = 2200;

// notice-related Identifiers.

private int  IDS_NOTIMPLEMENTED  = 2301;
private int  IDD_SUCCESS_MSG     = 2350;

private int  IDS_ERROR_TITLE     = 2400;

// action Indentifiers.

private int  DLL_REGISTER        = 0;
private int  DLL_UNREGISTER      = 1;

// publicaly accessible values

public  String sysDir            = null;
public  String osName            = null;
public  String appDir            = null;
public  String sPath             = null;
public  String desktopDir        = null;
public  String programDir        = null;
public  String installDir        = null;
public  String OSVersion         = null;

// package values

public  Properties sysProp       = System.getProperties();
private int    debugState        = 0;

private String packageSet        = "jInstaller.exe";
private String packageSetLnk     = "Uninstall.lnk";
private String uninstallIco      = "un.ico";

private String packageExe        = "isotopDemo.exe";
private String packageIco        = "isotop.ico";
private String packageLnk        = "isotop Demo.lnk";
private String packageFldr       = "isotop Demo";
private String packageName       = "isotop TimeSaver Demo";
private String packageFiles[] = { "TimeSaver.exe","isotop.cnt","dealerdata.dat","isotop.gid","isotop.hlp","demodata.txt","actbar.ocx","comdlg32.ocx","library.ocx","richtx32.ocx","ssa3d30.ocx","synrich.ocx","vsview6.ocx","msstdfmt.dll","msvcrt.dll","oledlg.dll","riched20.dll","riched32.dll","isotop.ico","ssscrl30.ocx","synFormLock.ocx","syngradient.ocx","DemoData.ini","synRichEd.ocx","msvbvm60.dll" };

public void debugThis() {
  try {
    if(debugState == 0) {

/**
    objRegister("C:\\win32_code\\src\\java\\ide\\installer\\lib\\smtpsvg.dll",
                 DLL_UNREGISTER);
**/
    }
  }catch(Exception e){
      errHandler(DEL_EXCEPTION, "debugThis()", e.toString());
  }
}

public String errHandler(int errNumber,
                         String errLocate,
                         String exType) {
String strResult       = null;
  try {
      strResult =             "ERROR : \n";
      strResult = strResult + "A non-recoverable error has occured.";
      strResult = strResult + "Please contact support@isotop.net\n";
      strResult = strResult + "and send the following information : \n\n";
      strResult = strResult + "Error Code : "+errNumber+"\n";
      strResult = strResult + "System Dir : "+sysDir+"\n";
      strResult = strResult + "Location   : "+errLocate+"\n";
      strResult = strResult + "Exception  : "+exType+"\n";
      strResult = strResult + "Error encountered : Application exit.";
      MessageBox.show(strResult, "Error", MessageBox.ICONERROR);
      return null;
  }catch(Exception e){
      errHandler(FATAL_EXCEPTION, "errHandler()", e.toString());
      return null;
  }
}

public int regModifier(Registry fieldSpecifier,
                       String subKey,
                       String[] values) {
  try {     
     RegistryKey regKey = Registry.LOCAL_MACHINE.createSubKey("SOFTWARE\\SteveG\\QSMT");
     for (int j = 0; j < values.length; j++) {
        regKey.setValue("UserCode", "QSMT076B1F");
     }



  }catch(Exception e){
      int errorcode = DllLib.getLastWin32Error();
      errHandler(LINK_EXCEPTION, "objCreate()", e.toString() + "[win32.dll]:" + errorcode);
      return -1;
  }
      return 0;
}

public int objRegister(String modLibrary, int modAction) {
  try {     
     int hmod = LoadLibrary(modLibrary);
     if (modAction == DLL_REGISTER) {
        int funcaddr = GetProcAddress(hmod, "DllRegisterServer");
        boolean result = call(funcaddr, "DllRegisterServer");
     }else
     if (modAction == DLL_UNREGISTER) {
        int funcaddr = GetProcAddress(hmod, "DllUnregisterServer");
        boolean result = call(funcaddr, "DllUnregisterServer");
     }
     FreeLibrary(hmod);
  }catch(Exception e){
      int errorcode = DllLib.getLastWin32Error();
      errHandler(LINK_EXCEPTION, "objCreate()", e.toString() + "[win32.dll]:" + errorcode);
      return -1;
  }
      return 0;
}

public int copyFiles(File lpszDest) throws IOException {
  try {
    File inputFile  = null;
    File outputFile = null;
    FileReader in   = null;
    FileWriter out  = null;

    for (int x=0; x< packageFiles.length; x++) {
       inputFile  = new File(packageFiles[x]);
       outputFile = new File(lpszDest + packageFiles[x]);

       in         = new FileReader(inputFile);
       out        = new FileWriter(outputFile);
       int c;

       while ((c = in.read()) != -1) {
          out.write(c);
       }
       in.close();
       out.close();
       if (packageFiles[x] != "msvbvm60.dll") {
          // inputFile.delete();
       }
    }
  }catch(Exception e){
      errHandler(COPY_EXCEPTION, "copyFiles()", e.toString());
      return -1;
  }
      return 0;
}

public int createLink(String exePath,
                      String lnkDesc,
                      String lnkPath) {
//  desktop / start_menu 
  try {
    objCreate(installDir + packageExe, desktopDir + packageLnk, installDir, packageName, installDir + packageIco);
    objCreate(installDir + packageExe, programDir + packageFldr + packageLnk, installDir, packageName, installDir + packageIco);
//  uninstall
    objCreate(appDir + packageSet, programDir + packageFldr + packageSetLnk, appDir, packageName, appDir + uninstallIco);
  }catch(Exception e){
      errHandler(LINK_EXCEPTION, "createLink()", e.toString());
      return -1;
  }
      return 0;
}

public int objCreate(String exePath,
                     String lnkPath,
                     String workDir,
                     String lnkDesc,
                     String icoFile) {
  try {
    String lpszPathObj     = exePath; // "C:\\temp\\files\\link\\TimeSaver.exe";
    String lpszPathLink    = lnkPath; // "C:\\temp\\files\\link\\test.lnk";
    String lpszWorkDir     = workDir; // "C:\\temp\\files\\link\\";
    String lpszDesc        = lnkDesc; // "Description";
    String lpszIcon        = icoFile; // "C:\\temp\\files\\link\\isotop.ico";

    IShellLinkA  psl = (IShellLinkA)new jShell();
    IPersistFile ppf = (IPersistFile)psl;

    psl.SetPath(lpszPathObj);
    psl.SetWorkingDirectory(lpszWorkDir);
    psl.SetDescription(lpszDesc);
    psl.SetIconLocation(lpszIcon, 0);
    psl.Resolve(0, 6);  
    ppf.Save(lpszPathLink, 0);
  }catch(Exception e){
      errHandler(LINK_EXCEPTION, "objCreate()", e.toString());
      return -1;
  }
      return 0;
}

public int delPath(File lpszPath) {
  try {
    File fileThis = null;
    String args[] = lpszPath.list();
    for (int x=0; x< args.length; x++) {
       fileThis = new File(lpszPath + args[x]);
       fileThis.delete();
    }
  }catch(Exception e){
      errHandler(DEL_EXCEPTION, "delPath()", e.toString());
      return -1;
  }
      return 0;
}

public int createDirs() {
  File fileThis = null;
  try {
     fileThis = new File(installDir);
     delPath(fileThis);
    if(fileThis.isDirectory() == true) {
       fileThis.delete();
       fileThis.mkdir();
    }
     fileThis = new File(programDir + packageFldr);
     delPath(fileThis);
    if(fileThis.isDirectory() == true) {
       fileThis.delete();
       fileThis.mkdir();
    }
  }catch(Exception e){
      errHandler(DIR_EXCEPTION, "createDir()", e.toString());
      return -1;
  }
      return 0;
}

public String sysPath(int id) {
  try {
    return SystemInformation.getSpecialFolderPath(id);
  }catch(Exception e){
      errHandler(FATAL_EXCEPTION, "sysPath()", e.toString());
      return null;
  }
}

public int setDefaults(String in) {
  try {
    installDir = in;    
    appDir     = Application.getStartupPath();
    if (ns.Right(appDir, 1)      != "\\") { appDir      = appDir      + "\\"; }
    if (ns.Right(desktopDir, 1)  != "\\") { desktopDir  = desktopDir  + "\\"; }
    if (ns.Right(programDir, 1)  != "\\") { programDir  = programDir  + "\\"; }
    if (ns.Right(installDir, 1)  != "\\") { installDir  = installDir  + "\\"; }
    if (ns.Right(sysDir, 1)      != "\\") { sysDir      = sysDir      + "\\"; }
    if (ns.Right(packageFldr, 1) != "\\") { packageFldr = packageFldr + "\\"; }
    return 0;
  }catch(Exception e){
      errHandler(FATAL_EXCEPTION, "setDefaults()", e.toString());
      return -1;
  }
}

public int checkVersion() {
  try {
      sPath  = sysPath(TEMPLATES);
      sysDir = sysProp.getProperty("com.ms.sysdir");
      osName = sysProp.getProperty("os.name");
    if("C:\\WINNT\\Profiles".equalsIgnoreCase(ns.Left(sPath.toLowerCase(), 17))) {
      checkResult = 1;
      desktopDir        = sysPath(DESKTOP_DIRECTORY);
      programDir        = sysPath(PROGRAMS);
    }else
    if("C:\\Windows\\Desktop".equalsIgnoreCase(ns.Left(sPath.toLowerCase(), 18))) {
      checkResult = 2;
      desktopDir        = sysPath(DESKTOP_DIRECTORY);
      programDir        = sysPath(PROGRAMS);
    }else
    if("C:\\Documents and Settings".equalsIgnoreCase(ns.Left(sPath.toLowerCase(), 25))) {
      checkResult = 3;
      desktopDir        = sysPath(DESKTOP_DIRECTORY);
      programDir        = sysPath(PROGRAMS);
    }
      return 0;
  }catch(Exception e){
      errHandler(FATAL_EXCEPTION, "checkVersion()", e.toString());
      return -1;
  }
}

public String setHeader() {
try {
  switch(checkResult) {
    case -1:
      errHandler(SYSTEM_DIR_MISSING, "sysPath()", "System dir missing");
      return null;
    case 1:
      OSVersion = "Windows NT";
      return "jInstaller ver "+verInstaller+"_java : " + OSVersion;
    case 2:
      OSVersion = "Windows 98 / 95";
      return "jInstaller ver "+verInstaller+"_java : " + OSVersion;
    case 3:
      OSVersion = "Windows 2000 / ME";
      return "jInstaller ver "+verInstaller+"_java : " + OSVersion;
   }
 }catch(Exception e){
      errHandler(FATAL_EXCEPTION, "setHeader()", e.toString());
      return null;
  }
    return null;
}

private String y2k() {
  String log_date  = null;
  String dateYear  = Integer.toString(dt.getYear() + 1900);
  String dateMonth = Integer.toString(dt.getMonth()+ 1);
  String dateDay   = Integer.toString(dt.getDate());	
  try {
    for (int i=0;i<=9;i++) {
      if (dateDay   == Integer.toString(i)) { 
          dateDay    = "0"+i;
      }
      if (dateMonth == Integer.toString(i)) { 
          dateMonth  = "0"+i;
      }
    }
    log_date     = dateDay+"/"+dateMonth+"/"+dateYear;
    return log_date;
  }catch(Exception e) {
      errHandler(FATAL_EXCEPTION, "y2k()", e.toString());
      return null;
  }  
}

}

