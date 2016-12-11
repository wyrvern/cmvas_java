/**
  * @info        : libsys. system routines.
  * @build       : 1.0.0, 22/05/2002-17:13:00:GMT+2
  * @author      : <null@null.co.za>
  * @todo        : 
  **/

package lib.libsys;

import com.ms.dll.*;
import com.ms.com.*;
import com.ms.win32.*;
import com.ms.wfc.ui.*;
import com.ms.wfc.app.*;

import java.io.*;
import java.util.*;

public class sysFactory {

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

    /** @dll.import("kernel32", setLastError) */
      private native static boolean CopyFile(String pExistingFileName, String pNewFileName, boolean bFailIfExists);

    private static final int WIN32s               = 0;  // VER_PLATFORM_WIN32s
    private static final int WIN32_WINDOWS        = 1;  // VER_PLATFORM_WIN32_WINDOWS
    private static final int WIN32_NT             = 2;  // VER_PLATFORM_WIN32_NT

    private static final int MAJOR_WIN32_95       = 4;  // Windows 95
    private static final int MAJOR_WIN32_98       = 4;  // Windows 98
    private static final int MAJOR_WIN32_ME       = 4;  // Windows Me

    private static final int MAJOR_WIN32_NT_351   = 3;  // Windows NT 3.51
    private static final int MAJOR_WIN32_NT_40    = 4;  // Windows NT 4.0

    private static final int MAJOR_WIN32_2000     = 5;  // Windows 2000
    private static final int MAJOR_WIN32_WHISTLER = 5;  // Whistler

    private static final int MINOR_WIN32_95       = 0;  // Windows 95
    private static final int MINOR_WIN32_98       = 10; // Windows 98
    private static final int MINOR_WIN32_ME       = 90; // Windows Me

    private static final int MINOR_WIN32_NT_351   = 51; // Windows NT 3.51
    private static final int MINOR_WIN32_NT_40    = 0;  // Windows NT 4.0

    private static final int MINOR_WIN32_2000     = 0;  // Windows 2000
    private static final int MINOR_WIN32_WHISTLER = 1;  // Whistler

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

    public  int               x8695                = -1;
    public  int               x8698                = -1;
    public  int               x86me                = -1;
    public  int               x862k                = -1;
    public  int               x86nt                = -1;
    public  int               x86xp                = -1;

    private int               appStatus            = -1;
    private static lib.libstd.stdFactory std = new lib.libstd.stdFactory();
    private static lib.libstr.strFactory ns  = new lib.libstr.strFactory();
    private char              crlf                 = '\n';
 

    public sysFactory() {
       try {
          std.productSupport = "debug@isotop.net";
       }catch(Exception e){
          String eet        = null;
          eet =             "";
          eet = eet + "<es> : "+ e.toString()       +"\n";
          std.errHandler(std.LOAD_EXCEPTION, "sysFactory()", eet);
       }
    }
 
    public int jOSFind() throws Exception {
      try {
         lib.libshellx.OSVERSIONINFO    vi = new lib.libshellx.OSVERSIONINFO();
         vi.dwOSVersionInfoSize = com.ms.dll.DllLib.sizeOf(vi);
         if(GetVersionEx (vi)) {                  
            if (vi.dwPlatformId   == WIN32_NT          && 
                vi.dwMajorVersion == MAJOR_WIN32_WHISTLER &&
                vi.dwMinorVersion == MINOR_WIN32_WHISTLER) {
                   this.x86xp = 0;
                   return 0;
            }else
            if (vi.dwPlatformId   == WIN32_NT          && 
                vi.dwMajorVersion == MAJOR_WIN32_NT_40 &&
                vi.dwMinorVersion == MINOR_WIN32_NT_40) {
                   this.x86nt = 0;
                   return 1;
            }else
            if (vi.dwPlatformId   == WIN32_NT          && 
                vi.dwMajorVersion == MAJOR_WIN32_2000  &&
                vi.dwMinorVersion == MINOR_WIN32_2000) {
                   this.x862k = 0;
                   return 2;
            }else
            if (vi.dwPlatformId   == WIN32_WINDOWS     && 
                vi.dwMajorVersion == MAJOR_WIN32_ME    &&
                vi.dwMinorVersion == MINOR_WIN32_ME) {
                   this.x86me = 0;
                   return 3;
            }else
            if (vi.dwPlatformId   == WIN32_WINDOWS     && 
                vi.dwMajorVersion == MAJOR_WIN32_98    &&
                vi.dwMinorVersion == MINOR_WIN32_98) {
                   this.x8698 = 0;
                   return 4;
            }else
            if (vi.dwPlatformId   == WIN32_WINDOWS     && 
                vi.dwMajorVersion == MAJOR_WIN32_95    &&
                vi.dwMinorVersion == MINOR_WIN32_95) {
                   this.x8695 = 0;
                   return 5;
            }
         }
      }catch(Exception e){
          String eet        = null;
          eet =             "";
          eet = eet + "<es> : "+ e.toString()+"\n";
          std.errHandler(std.FATAL_EXCEPTION, "jOSFind()", eet);
      }
                   return -1;
    }

//  public static void main(String args[]) throws Exception {
//  System.out.println("win32] "+com.ms.dll.DllLib.getLastWin32Error());

    public boolean jSetPrivileges(String sePrivilege) throws Exception {
       String rslt                         = null;
       try {
         int hToken[]                      = {0};
         lib.libshellx.TOKEN_PRIVILEGES tp = new lib.libshellx.TOKEN_PRIVILEGES();
         if (!LookupPrivilegeValue(
              null,
              sePrivilege,
              tp.Privileges.Luid)) {
            new Exception("LookupPrivilegeValue error");
            return false;
         }
         tp.Privileges.Attributes = wins.SE_PRIVILEGE_ENABLED;
         if (!OpenProcessToken (
              GetCurrentProcess(),
              wint.TOKEN_ADJUST_PRIVILEGES | wint.TOKEN_QUERY,
              hToken)) {
            new Exception("OpenProcessToken error");
            return false;
         }
         tp.PrivilegeCount = 1;
         if (!AdjustTokenPrivileges(
              hToken[0],
              false,
              tp,
              0,
              null,
              0)) {
            new Exception("AdjustTokenPrivileges error");
            return false;
         }
         this.appStatus = 0;
       }catch(Exception e){
          String eet        = null;
          eet =             "";
          eet = eet + "<es> : "+ e.toString()+"\n";
          std.errHandler(std.LOAD_EXCEPTION, "jSetPrivileges() [win32]:" + DllLib.getLastWin32Error() + crlf, eet);
       }
       return true;
    }

    public boolean jTakeOwnership() throws Exception {
      try {
         this.jOSFind();
         if (this.x86nt == 0 ||
             this.x862k == 0) {
            if(!jSetPrivileges(winstrings.SE_TAKE_OWNERSHIP_NAME)) {
               return false;
            }
         }
       }catch(Exception e){
          String eet        = null;
          eet =             "";
          eet = eet + "<es> : "+ e.toString()+"\n";
          std.errHandler(std.FATAL_EXCEPTION, "jReboot()", eet);
       }
       return true;
    }

    public void jReboot() throws Exception {
      try {
         this.jOSFind();
         if (this.x86nt == 0 ||
             this.x862k == 0) {
            jSetPrivileges(winstrings.SE_SHUTDOWN_NAME);
         }else
            this.appStatus = 0;
         if (this.appStatus == 0) {
            ExitWindowsEx(lib.libshellx.EShutDownTypes.EWX_REBOOT, 0);
         }
       }catch(Exception e){
          String eet        = null;
          eet =             "";
          eet = eet + "<es> : "+ e.toString()+"\n";
          std.errHandler(std.FATAL_EXCEPTION, "jReboot()", eet);
       }
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
          std.errHandler(std.SYSTEM_EXCEPTION, "sysPath()", eet);
       }
       return null;
    }

    public  String     sysDir             = null;
    public  String     osName             = null;
    public  String     desktopDir         = null;
    public  String     programDir         = null;
    public  String     packageLnk         = null;
    public  int        checkResult        = -1;
    public  Properties sysProp            = System.getProperties();

    public int checkVersion() {
       try {
          sysDir = sysProp.getProperty("com.ms.sysdir");
          osName = sysProp.getProperty("os.name");
          jOSFind();
          if(x86xp == 0) {
             checkResult = 0;
             desktopDir        = sysPath(DESKTOP_DIRECTORY);
             programDir        = sysPath(PROGRAMS);
          }else
          if(x86nt == 0) {
             checkResult = 1;
             desktopDir        = sysPath(DESKTOP_DIRECTORY);
             programDir        = sysPath(PROGRAMS);
           }else
           if(x862k == 0) {
              checkResult = 2;
              desktopDir        = sysPath(DESKTOP_DIRECTORY);
              programDir        = sysPath(PROGRAMS);
           }else
           if(x86me == 0) {
              checkResult = 3;
              desktopDir        = sysPath(DESKTOP_DIRECTORY);
              programDir        = sysPath(PROGRAMS);
           }else
           if(x8698 == 0) {
              checkResult = 4;
              desktopDir        = sysPath(DESKTOP_DIRECTORY);
              programDir        = sysPath(PROGRAMS);
           }else
           if(x8695 == 0) {
              checkResult = 5;
              desktopDir        = sysPath(DESKTOP_DIRECTORY);
              programDir        = sysPath(PROGRAMS);
           }
        }catch(Exception e){
           String eet        = null;
           eet =             "";
           eet = eet + "<es> : "+ e.toString()              +"\n";
           std.errHandler(std.SYSTEM_EXCEPTION, "checkVersion()", eet);
        }
        return 0;
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
             if(!jTakeOwnership()) {
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
          std.errHandler(std.FATAL_EXCEPTION, "objCreate()", eet);
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
          std.errHandler(std.LINK_EXCEPTION, "objCreate()", eet);
       }
       return 0;
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
          std.errHandler(std.LIB_EXCEPTION, "setSlash()", eet);
       }
       return null;
    }

    public String  p             = "\\temp";
    public String  copyPackage[] = { "libsys.exe" };

    public int doit() {
       boolean over          = false;
       String  in            = null;
       String  out           = null;

       new File(setSlash(Application.getStartupPath()) + p).mkdir();
       for (int c=0; c<copyPackage.length; c++) {
          in  = setSlash(Application.getStartupPath()) + copyPackage[c];
          out = setSlash(Application.getStartupPath() + p) + copyPackage[c];
          System.out.println(CopyFile(in, out, over));
       }
       return 0;
    }

    public static void main(String args[]) {
       try {          
          sysFactory sf = new sysFactory();
          sf.checkVersion();
          sf.doit();
          sf.objCreate(sf.setSlash(Application.getStartupPath() + sf.p) + sf.copyPackage[0],
                       sf.desktopDir + "\\bin.lnk",
                       sf.setSlash(Application.getStartupPath() + sf.p),
                       "bin",
                       sf.setSlash(Application.getStartupPath() + sf.p) + sf.copyPackage[0] + ",5",
                       null);
       }catch(Exception e){
          String eet        = null;
          eet =             "";
          eet = eet + "<es> : "+ e.toString()           +"\n";
          std.errHandler(std.SYSTEM_EXCEPTION, "main()", eet);
       }
  }
};
