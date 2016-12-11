import com.za.jShell.*;
import com.ms.com.*;
import com.ms.lang.*;
import com.ms.dll.DllLib;
import com.ms.dll.Win32Exception;
import com.ms.win32.WIN32_FIND_DATA;

public class jDirect extends Thread implements com.ms.com.IUnknown, com.za.jShell.IShellLinkA {

/** @dll.import("ole32", ole) */
  private static native com.ms.com.IUnknown CoInitialize (int pvReserved);

  public static final com.ms.com._Guid IID = 
  new com.ms.com._Guid("{0B65E02C-6A13-11D2-A46B-002078121407}");
  public static final com.ms.com._Guid ShellLink_IID = 
  new com.ms.com._Guid("{000214EE-0000-0000-C000-000000000046}");

  // IShellLinkA interface methods
  public void GetPath(String pszFile, int cchMaxPath, WIN32_FIND_DATA pfd, int fFlags) { }
  public int GetIDList() { return -1; }
  public void SetIDList(int pidl) { }
  public void GetDescription(String pszName, int cchMaxName) { }
  public void SetDescription(String pszName) { }
  public void GetWorkingDirectory(String pszDir, int cchMaxPath) { }
  public void SetWorkingDirectory(String pszDir) { }
  public void GetArguments(String pszArgs, int cchMaxPath) { }
  public void SetArguments(String pszArgs) { }
  public short GetHotkey() { return -1; }
  public void SetHotkey(short wHotkey) { }
  public int GetShowCmd() { return - 1; }
  public void SetShowCmd(int iShowCmd) { }
  public int GetIconLocation(String pszIconPath, int cchIconPath) { return -1; }
  public void SetIconLocation(String pszIconPath, int iIcon) { }
  public void SetRelativePath(String pszPathRel, int dwReserved) { }
  public void Resolve(int hwnd, int fflags) { }
  public void SetPath(String pszFile) { }

  private static native _Guid CLSIDFromProgID(String str);
  private static _Guid IID_IUnknown = new _Guid("{00000000-0000-0000-C000-000000000046}");


  private static Object createObject(String str) {
    CoInitialize(0);
    try {
      return com.ms.win32.Ole32.CoCreateInstance(
        com.ms.win32.Ole32.CLSIDFromProgID(str), 
        null, ComContext.INPROC_SERVER | 
        com.ms.win32.win.CLSCTX_LOCAL_SERVER, 
        IID_IUnknown);
     }catch(com.ms.com.ComFailException e){
 	System.out.println("Object Exception : "+e);
     }
      return com.ms.win32.Ole32.CoCreateInstance(
        com.ms.win32.Ole32.CLSIDFromProgID(str), 
        null, ComContext.INPROC_SERVER | 
        com.ms.win32.win.CLSCTX_LOCAL_SERVER, 
        IID_IUnknown);
   }


  public static void main(String[] args) throws Exception {
    jDirect jd        = new jDirect();
    IPersistFile ppf  = null; 
    IShellLinkA psl  = null; 

    String lpszPathObj      = "C:\\temp\\files\\link\\TimeSaver.exe";
    String lpszDesc         = "Description";
    String lpszPathLink     = "C:\\temp\\files\\link\\test.lnk";
    Object hres = createObject("jShell.shelllnk");
    System.out.println(Dispatch.get(hres, "name"));
    com.ms.com.ComLib.release(hres);
/**

     try {
          psl.SetPath       (lpszPathObj); 
          psl.SetDescription(lpszDesc); 
          ppf.Save(lpszPathLink, 0); 
          errcode = DllLib.getLastWin32Error();
          System.out.println(errcode);
     }finally { 
    System.exit(0);
     }
    //System.getProperties().list( System.out );
**/
    }
  }
