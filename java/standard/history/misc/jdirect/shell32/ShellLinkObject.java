//
// Auto-generated using JActiveX.EXE 5.00.3601
//   (jactivex /X:m- -d . shell32.dll)
//
// WARNING: Do not remove the comments that include "@com" directives.
// This source file must be compiled by a @com-aware compiler.
// If you are using the Microsoft Visual J++ compiler, you must use
// version 1.02.3920 or later. Previous versions will not issue an error
// but will not generate COM-enabled class files.
//

package shell32;

import com.ms.com.*;
import com.ms.com.IUnknown;
import com.ms.com.Variant;

/** @com.class(classid=11219420-1768-11D1-95BE-00609797EA4F,DynamicCasts) */
public class ShellLinkObject implements com.ms.com.IUnknown,com.ms.com.NoAutoScripting,shell32.IShellLinkDual
{
  /** @com.method()
      @hidden */
  public native java.lang.String getPath();

  /** @com.method()
      @hidden */
  public native void setPath(java.lang.String pbs);

  /** @com.method()
      @hidden */
  public native java.lang.String getDescription();

  /** @com.method()
      @hidden */
  public native void setDescription(java.lang.String pbs);

  /** @com.method()
      @hidden */
  public native java.lang.String getWorkingDirectory();

  /** @com.method()
      @hidden */
  public native void setWorkingDirectory(java.lang.String pbs);

  /** @com.method()
      @hidden */
  public native java.lang.String getArguments();

  /** @com.method()
      @hidden */
  public native void setArguments(java.lang.String pbs);

  /** @com.method()
      @hidden */
  public native int getHotkey();

  /** @com.method()
      @hidden */
  public native void setHotkey(int piHK);

  /** @com.method()
      @hidden */
  public native int getShowCommand();

  /** @com.method()
      @hidden */
  public native void setShowCommand(int piShowCommand);

  /** @com.method()
      @hidden */
  public native void Resolve(int fFlags);

  /** @com.method()
      @hidden */
  public native int GetIconLocation(java.lang.String[] pbs);

  /** @com.method()
      @hidden */
  public native void SetIconLocation(java.lang.String bs, int iIcon);

  /** @com.method()
      @hidden */
  public native void Save(com.ms.com.Variant vWhere);


  public static final com.ms.com._Guid clsid = new com.ms.com._Guid((int)0x11219420, (short)0x1768, (short)0x11d1, (byte)0x95, (byte)0xbe, (byte)0x0, (byte)0x60, (byte)0x97, (byte)0x97, (byte)0xea, (byte)0x4f);
}
