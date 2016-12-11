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

// Dual interface FolderItemVerb
/** @com.interface(iid=08EC3E00-50B0-11CF-960C-0080C7F4EE85, thread=NO, type=DUAL) */
public interface FolderItemVerb extends com.ms.com.IUnknown
{
  /** @com.method(vtoffset=4, dispid=1610743808, type=PROPGET, name="Application", addFlagsVtable=4)
      @com.parameters([iid=00020400-0000-0000-C000-000000000046,thread=NO,type=DISPATCH] return) */
  public java.lang.Object getApplication();

  /** @com.method(vtoffset=5, dispid=1610743809, type=PROPGET, name="Parent", addFlagsVtable=4)
      @com.parameters([iid=00020400-0000-0000-C000-000000000046,thread=NO,type=DISPATCH] return) */
  public java.lang.Object getParent();

  /** @com.method(vtoffset=6, dispid=0, type=PROPGET, name="Name", addFlagsVtable=4)
      @com.parameters([type=STRING] return) */
  public java.lang.String getName();

  /** @com.method(vtoffset=7, dispid=1610743811, type=METHOD, name="DoIt", addFlagsVtable=4)
      @com.parameters() */
  public void DoIt();


  public static final com.ms.com._Guid iid = new com.ms.com._Guid((int)0x8ec3e00, (short)0x50b0, (short)0x11cf, (byte)0x96, (byte)0xc, (byte)0x0, (byte)0x80, (byte)0xc7, (byte)0xf4, (byte)0xee, (byte)0x85);
}
