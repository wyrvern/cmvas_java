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

/** @com.class(classid=C4EE31F3-4768-11D2-BE5C-00A0C9A83DA1,DynamicCasts) */
public class FileSearchBand implements com.ms.com.IUnknown,com.ms.com.NoAutoScripting,shell32.IFileSearchBand
{
  /** @com.method()
      @hidden */
  public native void SetFocus();

  /** @com.method()
      @hidden */
  public native void SetSearchParameters(java.lang.String[] pbstrSearchID, boolean bNavToResults, com.ms.com.Variant pvarScope, com.ms.com.Variant pvarQueryFile);

  /** @com.method()
      @hidden */
  public native java.lang.String getSearchID();

  /** @com.method()
      @hidden */
  public native com.ms.com.Variant getScope();

  /** @com.method()
      @hidden */
  public native com.ms.com.Variant getQueryFile();


  public static final com.ms.com._Guid clsid = new com.ms.com._Guid((int)0xc4ee31f3, (short)0x4768, (short)0x11d2, (byte)0xbe, (byte)0x5c, (byte)0x0, (byte)0xa0, (byte)0xc9, (byte)0xa8, (byte)0x3d, (byte)0xa1);
}
