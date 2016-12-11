/**
  * @info        : console, Register.
  * @build       : 1.0.0, 30/04/2002-13:50:00:GMT+2
  * @author      : <null@null.co.za>
  * @todo        : 
  **/

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
import java.lang.reflect.*;

public class jReg {

// j/direct imported win32 native functions

/** @dll.import("ole32", ole) */
  private static native com.ms.com.IUnknown OleInitialize (int pvReserved);

/** @dll.import("ole32", ole) */
  private static native com.ms.com.IUnknown OleUninitialize ();

/** @dll.import("ole32", ole) */
  private static native com.ms.com.IUnknown CoInitialize (int pvReserved);

/** @dll.import("ole32", ole) */
  private static native com.ms.com.IUnknown CoUninitialize ();

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

// action indentifiers -- registry -- public

  public static final int  DLL_REGISTER   = 0;
  public static final int  DLL_UNREGISTER = 1;

  public   String strResult               = null;
  public   String sd                      = "C:\\winnt\\system32\\";
  public   String installDir              = "C:\\win32_code\\src\\java\\win32\\jReg\\";

  public  Properties sysProp              = System.getProperties();
  private Date   dt                       = new Date();
  public  lib.libstr.strFactory ns        = new lib.libstr.strFactory();
  private lib.libsys.sysFactory sf        = new lib.libsys.sysFactory();

  public static String localRegister[]    = null;
  public static String systemRegister[]   = { "msstdfmt.dll", "vsview6.ocx" };

  public int register(int    modAction,
                      String modLibrary) {
  try {
     int hmod = LoadLibrary(modLibrary);
     if (modAction == DLL_REGISTER) {
        int funcaddr   = GetProcAddress(hmod, "DllRegisterServer");
        boolean result = call(funcaddr, "DllRegisterServer");
     }else
     if (modAction == DLL_UNREGISTER) {
        int funcaddr   = GetProcAddress(hmod, "DllUnregisterServer");
        boolean result = call(funcaddr, "DllUnregisterServer");
     }
     FreeLibrary(hmod);
  }catch(Exception e){
     int errorcode = DllLib.getLastWin32Error();
     System.out.println(e.toString() + errorcode);
     return -1;
  }
     return 0;
  }

  public static void main (String[] args) {
     try {
        jReg reg = new jReg();
        int i = 0;
        for (; i < reg.systemRegister.length; i++) {
//           reg.register(reg.DLL_UNREGISTER, reg.sd + reg.systemRegister[i]);
           reg.register(reg.DLL_REGISTER,   reg.sd + reg.systemRegister[i]);
        }
     }catch(Exception e){
        int errorcode = DllLib.getLastWin32Error();
        System.out.println(e.toString() + errorcode);
     }
  }

}
