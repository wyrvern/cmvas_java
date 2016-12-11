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

// Dispatch-only interface DShellFolderViewEvents
/** @com.interface(iid=62112AA2-EBE4-11CF-A5FB-0020AFE7292D, thread=NO, type=DISPATCH) */
public interface DShellFolderViewEvents extends com.ms.com.IUnknown
{
  /** @com.method(dispid=200, type=METHOD, name="SelectionChanged", returntype=VOID)
      @com.parameters() */
  public void SelectionChanged();

  /** @com.method(dispid=201, type=METHOD, name="EnumDone", returntype=VOID)
      @com.parameters() */
  public void EnumDone();


  public static final com.ms.com._Guid iid = new com.ms.com._Guid((int)0x62112aa2, (short)0xebe4, (short)0x11cf, (byte)0xa5, (byte)0xfb, (byte)0x0, (byte)0x20, (byte)0xaf, (byte)0xe7, (byte)0x29, (byte)0x2d);
}
