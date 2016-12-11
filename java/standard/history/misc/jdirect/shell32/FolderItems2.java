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

// Dual interface FolderItems2
/** @com.interface(iid=C94F0AD0-F363-11D2-A327-00C04F8EEC7F, thread=NO, type=DUAL) */
public interface FolderItems2 extends shell32.FolderItems
{
  /** @com.method(vtoffset=4, dispid=1610743808, type=PROPGET, name="Count", addFlagsVtable=4)
      @com.parameters([type=I4] return) */
  public int getCount();

  /** @com.method(vtoffset=5, dispid=1610743809, type=PROPGET, name="Application", addFlagsVtable=4)
      @com.parameters([iid=00020400-0000-0000-C000-000000000046,thread=NO,type=DISPATCH] return) */
  public java.lang.Object getApplication();

  /** @com.method(vtoffset=6, dispid=1610743810, type=PROPGET, name="Parent", addFlagsVtable=4)
      @com.parameters([iid=00020400-0000-0000-C000-000000000046,thread=NO,type=DISPATCH] return) */
  public java.lang.Object getParent();

  /** @com.method(vtoffset=7, dispid=1610743811, type=METHOD, name="Item", addFlagsVtable=4)
      @com.parameters([in,type=VARIANT] index, [iid=FAC32C80-CBE4-11CE-8350-444553540000,thread=NO,type=DISPATCH] return) */
  public shell32.FolderItem Item(com.ms.com.Variant index);

  /** @com.method(vtoffset=8, dispid=4294967292, type=METHOD, name="_NewEnum", addFlagsVtable=4)
      @com.parameters([iid=00000000-0000-0000-C000-000000000046,thread=NO,type=OBJECT] return) */
  public com.ms.com.IUnknown _NewEnum();

  /** @com.method(vtoffset=9, dispid=1610809344, type=METHOD, name="InvokeVerbEx", addFlagsVtable=4)
      @com.parameters([in,type=VARIANT] vVerb, [in,type=VARIANT] vArgs) */
  public void InvokeVerbEx(com.ms.com.Variant vVerb, com.ms.com.Variant vArgs);


  public static final com.ms.com._Guid iid = new com.ms.com._Guid((int)0xc94f0ad0, (short)0xf363, (short)0x11d2, (byte)0xa3, (byte)0x27, (byte)0x0, (byte)0xc0, (byte)0x4f, (byte)0x8e, (byte)0xec, (byte)0x7f);
}
