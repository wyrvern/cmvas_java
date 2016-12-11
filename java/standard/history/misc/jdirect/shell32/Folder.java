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

// Dual interface Folder
/** @com.interface(iid=BBCBDE60-C3FF-11CE-8350-444553540000, thread=NO, type=DUAL) */
public interface Folder extends com.ms.com.IUnknown
{
  /** @com.method(vtoffset=4, dispid=0, type=PROPGET, name="Title", addFlagsVtable=4)
      @com.parameters([type=STRING] return) */
  public java.lang.String getTitle();

  /** @com.method(vtoffset=5, dispid=1610743809, type=PROPGET, name="Application", addFlagsVtable=4)
      @com.parameters([iid=00020400-0000-0000-C000-000000000046,thread=NO,type=DISPATCH] return) */
  public java.lang.Object getApplication();

  /** @com.method(vtoffset=6, dispid=1610743810, type=PROPGET, name="Parent", addFlagsVtable=4)
      @com.parameters([iid=00020400-0000-0000-C000-000000000046,thread=NO,type=DISPATCH] return) */
  public java.lang.Object getParent();

  /** @com.method(vtoffset=7, dispid=1610743811, type=PROPGET, name="ParentFolder", addFlagsVtable=4)
      @com.parameters([iid=BBCBDE60-C3FF-11CE-8350-444553540000,thread=NO,type=DISPATCH] return) */
  public shell32.Folder getParentFolder();

  /** @com.method(vtoffset=8, dispid=1610743812, type=METHOD, name="Items", addFlagsVtable=4)
      @com.parameters([iid=744129E0-CBE5-11CE-8350-444553540000,thread=NO,type=DISPATCH] return) */
  public shell32.FolderItems Items();

  /** @com.method(vtoffset=9, dispid=1610743813, type=METHOD, name="ParseName", addFlagsVtable=4)
      @com.parameters([in,type=STRING] bName, [iid=FAC32C80-CBE4-11CE-8350-444553540000,thread=NO,type=DISPATCH] return) */
  public shell32.FolderItem ParseName(java.lang.String bName);

  /** @com.method(vtoffset=10, dispid=1610743814, type=METHOD, name="NewFolder", addFlagsVtable=4)
      @com.parameters([in,type=STRING] bName, [in,type=VARIANT] vOptions) */
  public void NewFolder(java.lang.String bName, com.ms.com.Variant vOptions);

  /** @com.method(vtoffset=11, dispid=1610743815, type=METHOD, name="MoveHere", addFlagsVtable=4)
      @com.parameters([in,type=VARIANT] vItem, [in,type=VARIANT] vOptions) */
  public void MoveHere(com.ms.com.Variant vItem, com.ms.com.Variant vOptions);

  /** @com.method(vtoffset=12, dispid=1610743816, type=METHOD, name="CopyHere", addFlagsVtable=4)
      @com.parameters([in,type=VARIANT] vItem, [in,type=VARIANT] vOptions) */
  public void CopyHere(com.ms.com.Variant vItem, com.ms.com.Variant vOptions);

  /** @com.method(vtoffset=13, dispid=1610743817, type=METHOD, name="GetDetailsOf", addFlagsVtable=4)
      @com.parameters([in,type=VARIANT] vItem, [in,type=I4] iColumn, [type=STRING] return) */
  public java.lang.String GetDetailsOf(com.ms.com.Variant vItem, int iColumn);


  public static final com.ms.com._Guid iid = new com.ms.com._Guid((int)0xbbcbde60, (short)0xc3ff, (short)0x11ce, (byte)0x83, (byte)0x50, (byte)0x44, (byte)0x45, (byte)0x53, (byte)0x54, (byte)0x0, (byte)0x0);
}
