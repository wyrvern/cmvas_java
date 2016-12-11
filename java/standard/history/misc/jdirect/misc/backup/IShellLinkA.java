package java.za.jShell;

import com.ms.com.*;
import com.ms.com.IUnknown;
import com.ms.com.Variant;

// VTable-only interface IShellLinkA
/** @com.interface(iid=000214EE-0000-0000-C000-000000000046, thread=NO) */
public interface IShellLinkA extends com.ms.com.IUnknown
{
  /** @com.method(vtoffset=0)
      @com.parameters([in,customMarshal="com.ms.com.AnsiStringMarshaller",type=CUSTOM] pszFile, [in,type=I4] cchMaxPath, [in,out,type=PTR] pfd, [in,type=I4] fflags) */
  public void GetPath(java.lang.String pszFile, int cchMaxPath, java.za.jShell.WIN32_FIND_DATA pfd, int fflags);

  /** @com.method(vtoffset=1)
      @com.parameters([in,out,size=1,type=ARRAY] ppidl) */
  public void GetIDList(int[] ppidl);

  /** @com.method(vtoffset=2)
      @com.parameters([in,type=I4] pidl) */
  public void SetIDList(int pidl);

  /** @com.method(vtoffset=3)
      @com.parameters([in,customMarshal="com.ms.com.AnsiStringMarshaller",type=CUSTOM] pszName, [in,type=I4] cchMaxName) */
  public void GetDescription(java.lang.String pszName, int cchMaxName);

  /** @com.method(vtoffset=4)
      @com.parameters([in,customMarshal="com.ms.com.AnsiStringMarshaller",type=CUSTOM] pszName) */
  public void SetDescription(java.lang.String pszName);

  /** @com.method(vtoffset=5)
      @com.parameters([in,customMarshal="com.ms.com.AnsiStringMarshaller",type=CUSTOM] pszDir, [in,type=I4] cchMaxPath) */
  public void GetWorkingDirectory(java.lang.String pszDir, int cchMaxPath);

  /** @com.method(vtoffset=6)
      @com.parameters([in,customMarshal="com.ms.com.AnsiStringMarshaller",type=CUSTOM] pszDir) */
  public void SetWorkingDirectory(java.lang.String pszDir);

  /** @com.method(vtoffset=7)
      @com.parameters([in,customMarshal="com.ms.com.AnsiStringMarshaller",type=CUSTOM] pszArgs, [in,type=I4] cchMaxPath) */
  public void GetArguments(java.lang.String pszArgs, int cchMaxPath);

  /** @com.method(vtoffset=8)
      @com.parameters([in,customMarshal="com.ms.com.AnsiStringMarshaller",type=CUSTOM] pszArgs) */
  public void SetArguments(java.lang.String pszArgs);

  /** @com.method(vtoffset=9)
      @com.parameters([in,out,size=1,type=ARRAY] pwHotkey) */
  public void GetHotkey(int[] pwHotkey);

  /** @com.method(vtoffset=10)
      @com.parameters([in,type=I4] wHotkey) */
  public void SetHotkey(int wHotkey);

  /** @com.method(vtoffset=11)
      @com.parameters([in,out,size=1,type=ARRAY] piShowCmd) */
  public void GetShowCmd(int[] piShowCmd);

  /** @com.method(vtoffset=12)
      @com.parameters([in,type=I4] iShowCmd) */
  public void SetShowCmd(int iShowCmd);

  /** @com.method(vtoffset=13)
      @com.parameters([in,customMarshal="com.ms.com.AnsiStringMarshaller",type=CUSTOM] pszIconPath, [in,type=I4] cchIconPath, [in,out,size=1,type=ARRAY] piIcon) */
  public void GetIconLocation(java.lang.String pszIconPath, int cchIconPath, int[] piIcon);

  /** @com.method(vtoffset=14)
      @com.parameters([in,customMarshal="com.ms.com.AnsiStringMarshaller",type=CUSTOM] pszIconPath, [in,type=I4] iIcon) */
  public void SetIconLocation(java.lang.String pszIconPath, int iIcon);

  /** @com.method(vtoffset=15)
      @com.parameters([in,customMarshal="com.ms.com.AnsiStringMarshaller",type=CUSTOM] pszPathRel, [in,type=I4] dwReserved) */
  public void SetRelativePath(java.lang.String pszPathRel, int dwReserved);

  /** @com.method(vtoffset=16)
      @com.parameters([in,type=I4] hwnd, [in,type=I4] fflags) */
  public void Resolve(int hwnd, int fflags);

  /** @com.method(vtoffset=17)
      @com.parameters([in,customMarshal="com.ms.com.AnsiStringMarshaller",type=CUSTOM] pszFile) */
  public void SetPath(java.lang.String pszFile);


  public static final com.ms.com._Guid iid = new com.ms.com._Guid((int)0x214ee, (short)0x0, (short)0x0, (byte)0xc0, (byte)0x0, (byte)0x0, (byte)0x0, (byte)0x0, (byte)0x0, (byte)0x0, (byte)0x46);
}
