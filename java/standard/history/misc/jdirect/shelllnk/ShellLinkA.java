//
// Auto-generated using JActiveX.EXE 5.00.3601
//   (jactivex /javatlb /X:m- -d . shelllnk.tlb)
//
// WARNING: Do not remove the comments that include "@com" directives.
// This source file must be compiled by a @com-aware compiler.
// If you are using the Microsoft Visual J++ compiler, you must use
// version 1.02.3920 or later. Previous versions will not issue an error
// but will not generate COM-enabled class files.
//

package shelllnk;

import com.ms.com.*;
import com.ms.com.IUnknown;
import com.ms.com.Variant;

/** @com.class(classid=00021401-0000-0000-C000-000000000046,DynamicCasts) */
public class ShellLinkA implements com.ms.com.IUnknown,com.ms.com.NoAutoScripting,shelllnk.IShellLinkA
{
  /** @com.method()
      @hidden */
  public native void GetPath(java.lang.String pszFile, int cchMaxPath, shelllnk.WIN32_FIND_DATA pfd, int fflags);

  /** @com.method()
      @hidden */
  public native void GetIDList(int[] ppidl);

  /** @com.method()
      @hidden */
  public native void SetIDList(int pidl);

  /** @com.method()
      @hidden */
  public native void GetDescription(java.lang.String pszName, int cchMaxName);

  /** @com.method()
      @hidden */
  public native void SetDescription(java.lang.String pszName);

  /** @com.method()
      @hidden */
  public native void GetWorkingDirectory(java.lang.String pszDir, int cchMaxPath);

  /** @com.method()
      @hidden */
  public native void SetWorkingDirectory(java.lang.String pszDir);

  /** @com.method()
      @hidden */
  public native void GetArguments(java.lang.String pszArgs, int cchMaxPath);

  /** @com.method()
      @hidden */
  public native void SetArguments(java.lang.String pszArgs);

  /** @com.method()
      @hidden */
  public native void GetHotkey(int[] pwHotkey);

  /** @com.method()
      @hidden */
  public native void SetHotkey(int wHotkey);

  /** @com.method()
      @hidden */
  public native void GetShowCmd(int[] piShowCmd);

  /** @com.method()
      @hidden */
  public native void SetShowCmd(int iShowCmd);

  /** @com.method()
      @hidden */
  public native void GetIconLocation(java.lang.String pszIconPath, int cchIconPath, int[] piIcon);

  /** @com.method()
      @hidden */
  public native void SetIconLocation(java.lang.String pszIconPath, int iIcon);

  /** @com.method()
      @hidden */
  public native void SetRelativePath(java.lang.String pszPathRel, int dwReserved);

  /** @com.method()
      @hidden */
  public native void Resolve(int hwnd, int fflags);

  /** @com.method()
      @hidden */
  public native void SetPath(java.lang.String pszFile);


  public static final com.ms.com._Guid clsid = new com.ms.com._Guid((int)0x21401, (short)0x0, (short)0x0, (byte)0xc0, (byte)0x0, (byte)0x0, (byte)0x0, (byte)0x0, (byte)0x0, (byte)0x0, (byte)0x46);
}
