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

  String strResult                      = null;

  public  Properties sysProp            = System.getProperties();
  private Date   dt                     = new Date();
  public  lib.libstr.strFactory ns      = new lib.libstr.strFactory();
  private lib.libsys.sysFactory sf      = new lib.libsys.sysFactory();

  public static String localRegister[]  = null;
  public static String systemRegister[] = { "msstdfmt.dll;vsview6.ocx" };

  public int crypt(int modAction) {
  int     hmod;
  int     funcaddr;
  boolean result    = false;
  try {
     if(modAction      != -1) {
        if (localRegister != null) {
           OleInitialize(0);
           for (int i = 0; i < localRegister.length; i++) {
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
           OleUninitialize();
        }
        if (systemRegister != null) {
           OleInitialize(0);
           for (int i = 0; i < systemRegister.length; i++) {
              if(systemRegister[i] != "") {
              infoBox(0, "-", systemRegister[i]);
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
           OleUninitialize();
        }
     }

     }catch(Exception e){
        System.out.println(e.toString());
        return -1;
     }
     return 0;
  }

  public static void main (String[] args) {
    jReg reg = new jReg();
    reg.register();
  }
}
