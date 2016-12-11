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

// Dual interface DFConstraint
/** @com.interface(iid=4A3DF050-23BD-11D2-939F-00A0C91EEDBA, thread=NO, type=DUAL) */
public interface DFConstraint extends com.ms.com.IUnknown
{
  /** @com.method(vtoffset=4, dispid=1610743808, type=PROPGET, name="Name", addFlagsVtable=4)
      @com.parameters([type=STRING] return) */
  public java.lang.String getName();

  /** @com.method(vtoffset=5, dispid=1610743809, type=PROPGET, name="Value", addFlagsVtable=4)
      @com.parameters([type=VARIANT] return) */
  public com.ms.com.Variant getValue();


  public static final com.ms.com._Guid iid = new com.ms.com._Guid((int)0x4a3df050, (short)0x23bd, (short)0x11d2, (byte)0x93, (byte)0x9f, (byte)0x0, (byte)0xa0, (byte)0xc9, (byte)0x1e, (byte)0xed, (byte)0xba);
}
