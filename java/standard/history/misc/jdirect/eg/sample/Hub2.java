//
// Auto-generated using JActiveX.EXE 5.00.3601
//   (jactivex /javatlb /X:m- -d . sample.tlb)
//
// WARNING: Do not remove the comments that include "@com" directives.
// This source file must be compiled by a @com-aware compiler.
// If you are using the Microsoft Visual J++ compiler, you must use
// version 1.02.3920 or later. Previous versions will not issue an error
// but will not generate COM-enabled class files.
//

package sample;

import com.ms.com.*;
import com.ms.com.IUnknown;
import com.ms.com.Variant;

/** @com.class(classid=04E5D4BA-0A64-11D2-9B9D-00C04F8C94D0,DynamicCasts) */
public class Hub2 implements com.ms.com.IUnknown,com.ms.com.NoAutoScripting,sample.IMessenger
{
  /** @com.method()
      @hidden */
  public native java.lang.String addListener(java.lang.Object listener);

  /** @com.method()
      @hidden */
  public native void removeListener(java.lang.String key);

  /** @com.method()
      @hidden */
  public native void sendMessage(java.lang.String message);

  /** @com.method()
      @hidden */
  public native void sendObjects(com.ms.com.SafeArray dataArray);


  public static final com.ms.com._Guid clsid = new com.ms.com._Guid((int)0x4e5d4ba, (short)0xa64, (short)0x11d2, (byte)0x9b, (byte)0x9d, (byte)0x0, (byte)0xc0, (byte)0x4f, (byte)0x8c, (byte)0x94, (byte)0xd0);
}
