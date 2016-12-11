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

/** @com.class(classid=2FE352EA-FD1F-11D2-B1F4-00C04F8EEB3E,DynamicCasts) */
public class ShellFolderItem implements com.ms.com.IUnknown,com.ms.com.NoAutoScripting,shell32.FolderItem2
{
  /** @com.method()
      @hidden */
  public native java.lang.Object getApplication();

  /** @com.method()
      @hidden */
  public native java.lang.Object getParent();

  /** @com.method()
      @hidden */
  public native java.lang.String getName();

  /** @com.method()
      @hidden */
  public native void setName(java.lang.String pbs);

  /** @com.method()
      @hidden */
  public native java.lang.String getPath();

  /** @com.method()
      @hidden */
  public native java.lang.Object getGetLink();

  /** @com.method()
      @hidden */
  public native java.lang.Object getGetFolder();

  /** @com.method()
      @hidden */
  public native boolean getIsLink();

  /** @com.method()
      @hidden */
  public native boolean getIsFolder();

  /** @com.method()
      @hidden */
  public native boolean getIsFileSystem();

  /** @com.method()
      @hidden */
  public native boolean getIsBrowsable();

  /** @com.method()
      @hidden */
  public native double getModifyDate();

  /** @com.method()
      @hidden */
  public native void setModifyDate(double pdt);

  /** @com.method()
      @hidden */
  public native int getSize();

  /** @com.method()
      @hidden */
  public native java.lang.String getType();

  /** @com.method()
      @hidden */
  public native shell32.FolderItemVerbs Verbs();

  /** @com.method()
      @hidden */
  public native void InvokeVerb(com.ms.com.Variant vVerb);

  /** @com.method()
      @hidden */
  public native void InvokeVerbEx(com.ms.com.Variant vVerb, com.ms.com.Variant vArgs);

  /** @com.method()
      @hidden */
  public native com.ms.com.Variant ExtendedProperty(java.lang.String bstrPropName);


  public static final com.ms.com._Guid clsid = new com.ms.com._Guid((int)0x2fe352ea, (short)0xfd1f, (short)0x11d2, (byte)0xb1, (byte)0xf4, (byte)0x0, (byte)0xc0, (byte)0x4f, (byte)0x8e, (byte)0xeb, (byte)0x3e);
}
