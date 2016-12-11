package lib.shellx.util;

import com.ms.dll.*;
import com.ms.com.*;
import com.ms.win32.*;

public class sysFactory {

    /** @dll.import("user32", setLastError) */
      private native static boolean ExitWindowsEx(int uFlags, int dwReserved);

    /** @dll.import("advapi32", setLastError) */
      private native static boolean OpenProcessToken(int ProcessHandle, int DesiredAccess, int TokenHandle[]);

    /** @dll.import("kernel32", setLastError) */
      private native static int GetCurrentProcess();

    /** @dll.import("advapi32", setLastError) */
      private native static boolean AdjustTokenPrivileges(int TokenHandle, boolean DisableAllPrivileges, lib.shellx.TOKEN_PRIVILEGES NewState, int BufferLength, lib.shellx.TOKEN_PRIVILEGES PreviousState, int ReturnLength);

    /** @dll.import("advapi32", setLastError) */
      private native static boolean LookupPrivilegeValue(String lpSystemName, String lpName, lib.shellx.LUID lpLuid);

    /** @dll.import("kernel32", setLastError) */
      private native static boolean GetVersionEx(lib.shellx.OSVERSIONINFO lpVersionInfo);

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

    public int               x8695                = -1;
    public int               x8698                = -1;
    public int               x86me                = -1;
    public int               x862k                = -1;
    public int               x86nt                = -1;
    public int               x86xp                = -1;
 
    public int jOSFind() throws Exception {
      try {
         lib.shellx.OSVERSIONINFO    vi = new lib.shellx.OSVERSIONINFO();
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
         System.out.println("Object Exception : "+e);
      }
                   return -1;
    }

//  public static void main(String args[]) throws Exception {
//  System.out.println("win32] "+com.ms.dll.DllLib.getLastWin32Error());

    public static void jReboot() throws Exception {
      try {
         int                         appStatus = -1;
         int                         hToken[]  = {0};
         lib.shellx.TOKEN_PRIVILEGES tp        = new lib.shellx.TOKEN_PRIVILEGES();
            if (new sysFactory().x86nt == 0) {
               if (LookupPrivilegeValue(null, winstrings.SE_SHUTDOWN_NAME, tp.Privileges.Luid)) {
                  tp.Privileges.Attributes = wins.SE_PRIVILEGE_ENABLED;
                  if (OpenProcessToken (GetCurrentProcess(), wint.TOKEN_ADJUST_PRIVILEGES | wint.TOKEN_QUERY, hToken)) {
                     tp.PrivilegeCount = 1;
                     if (AdjustTokenPrivileges (hToken[0], false, tp, 0, null, 0)) {
                        appStatus = 0;
                     }else{
                        appStatus = -1;
                     }
                  }else{
                     appStatus = -1;
                  }
               }else{
                  appStatus = -1;
               }
            }
            if (appStatus == 0) {
               ExitWindowsEx(lib.shellx.EShutDownTypes.EWX_REBOOT, 0);
            }
      }catch(Exception e){
         System.out.println("Object Exception : "+e);
      }
    }
};
