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

// Dispatch-only interface DSearchCommandEvents
/** @com.interface(iid=60890160-69F0-11D1-B758-00A0C90564FE, thread=NO, type=DISPATCH) */
public interface DSearchCommandEvents extends com.ms.com.IUnknown
{
  /** @com.method(dispid=1, type=METHOD, name="SearchStart")
      @com.parameters() */
  public void SearchStart();

  /** @com.method(dispid=2, type=METHOD, name="SearchComplete")
      @com.parameters() */
  public void SearchComplete();

  /** @com.method(dispid=3, type=METHOD, name="SearchAbort")
      @com.parameters() */
  public void SearchAbort();

  /** @com.method(dispid=4, type=METHOD, name="RecordsetUpdate")
      @com.parameters() */
  public void RecordsetUpdate();

  /** @com.method(dispid=5, type=METHOD, name="ProgressTextChanged")
      @com.parameters() */
  public void ProgressTextChanged();

  /** @com.method(dispid=6, type=METHOD, name="SearchError")
      @com.parameters() */
  public void SearchError();

  /** @com.method(dispid=7, type=METHOD, name="SearchRestored")
      @com.parameters() */
  public void SearchRestored();


  public static final com.ms.com._Guid iid = new com.ms.com._Guid((int)0x60890160, (short)0x69f0, (short)0x11d1, (byte)0xb7, (byte)0x58, (byte)0x0, (byte)0xa0, (byte)0xc9, (byte)0x5, (byte)0x64, (byte)0xfe);
}
