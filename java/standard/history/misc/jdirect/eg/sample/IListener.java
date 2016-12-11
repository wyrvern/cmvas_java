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

// VTable-only interface IListener
/** @com.interface(iid=6266E5A0-0BA1-11D2-ADB3-00C04F8C9491, thread=NO) */
public interface IListener extends com.ms.com.IUnknown
{
  /** @com.method(vtoffset=0)
      @com.parameters([in,type=STRING] message) */
  public void processMessage(java.lang.String message);

  /** @com.method(vtoffset=1)
      @com.parameters([in,vt=16396,type=SAFEARRAY] dataArray) */
  public void processObjects(com.ms.com.SafeArray dataArray);


  public static final com.ms.com._Guid iid = new com.ms.com._Guid((int)0x6266e5a0, (short)0xba1, (short)0x11d2, (byte)0xad, (byte)0xb3, (byte)0x0, (byte)0xc0, (byte)0x4f, (byte)0x8c, (byte)0x94, (byte)0x91);
}
