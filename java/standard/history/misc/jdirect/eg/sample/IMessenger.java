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

// VTable-only interface IMessenger
/** @com.interface(iid=0089E241-0AE1-11D2-9B9D-00C04F8C94D0, thread=NO) */
public interface IMessenger extends com.ms.com.IUnknown
{
  /** @com.method(vtoffset=0)
      @com.parameters([in,iid=00020400-0000-0000-C000-000000000046,thread=NO,type=DISPATCH] listener, [type=STRING] return) */
  public java.lang.String addListener(java.lang.Object listener);

  /** @com.method(vtoffset=1)
      @com.parameters([in,type=STRING] key) */
  public void removeListener(java.lang.String key);

  /** @com.method(vtoffset=2)
      @com.parameters([in,type=STRING] message) */
  public void sendMessage(java.lang.String message);

  /** @com.method(vtoffset=3)
      @com.parameters([in,vt=16396,type=SAFEARRAY] dataArray) */
  public void sendObjects(com.ms.com.SafeArray dataArray);


  public static final com.ms.com._Guid iid = new com.ms.com._Guid((int)0x89e241, (short)0xae1, (short)0x11d2, (byte)0x9b, (byte)0x9d, (byte)0x0, (byte)0xc0, (byte)0x4f, (byte)0x8c, (byte)0x94, (byte)0xd0);
}
