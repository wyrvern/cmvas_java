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

// Dual interface IShellFolderViewDual
/** @com.interface(iid=E7A1AF80-4D96-11CF-960C-0080C7F4EE85, thread=NO, type=DUAL) */
public interface IShellFolderViewDual extends com.ms.com.IUnknown
{
  /** @com.method(vtoffset=4, dispid=1610743808, type=PROPGET, name="Application", addFlagsVtable=4)
      @com.parameters([iid=00020400-0000-0000-C000-000000000046,thread=NO,type=DISPATCH] return) */
  public java.lang.Object getApplication();

  /** @com.method(vtoffset=5, dispid=1610743809, type=PROPGET, name="Parent", addFlagsVtable=4)
      @com.parameters([iid=00020400-0000-0000-C000-000000000046,thread=NO,type=DISPATCH] return) */
  public java.lang.Object getParent();

  /** @com.method(vtoffset=6, dispid=1610743810, type=PROPGET, name="Folder", addFlagsVtable=4)
      @com.parameters([iid=BBCBDE60-C3FF-11CE-8350-444553540000,thread=NO,type=DISPATCH] return) */
  public shell32.Folder getFolder();

  /** @com.method(vtoffset=7, dispid=1610743811, type=METHOD, name="SelectedItems", addFlagsVtable=4)
      @com.parameters([iid=744129E0-CBE5-11CE-8350-444553540000,thread=NO,type=DISPATCH] return) */
  public shell32.FolderItems SelectedItems();

  /** @com.method(vtoffset=8, dispid=1610743812, type=PROPGET, name="FocusedItem", addFlagsVtable=4)
      @com.parameters([iid=FAC32C80-CBE4-11CE-8350-444553540000,thread=NO,type=DISPATCH] return) */
  public shell32.FolderItem getFocusedItem();

  /** @com.method(vtoffset=9, dispid=1610743813, type=METHOD, name="SelectItem", addFlagsVtable=4)
      @com.parameters([in,elementType=VARIANT,type=PTR] pvfi, [in,type=I4] dwFlags) */
  public void SelectItem(com.ms.com.Variant pvfi, int dwFlags);

  /** @com.method(vtoffset=10, dispid=1610743814, type=METHOD, name="PopupItemMenu", addFlagsVtable=4)
      @com.parameters([in,iid=FAC32C80-CBE4-11CE-8350-444553540000,thread=NO,type=DISPATCH] pfi, [in,type=VARIANT] vx, [in,type=VARIANT] vy, [type=STRING] return) */
  public java.lang.String PopupItemMenu(shell32.FolderItem pfi, com.ms.com.Variant vx, com.ms.com.Variant vy);

  /** @com.method(vtoffset=11, dispid=1610743815, type=PROPGET, name="Script", addFlagsVtable=4)
      @com.parameters([iid=00020400-0000-0000-C000-000000000046,thread=NO,type=DISPATCH] return) */
  public java.lang.Object getScript();

  /** @com.method(vtoffset=12, dispid=1610743816, type=PROPGET, name="ViewOptions", addFlagsVtable=4)
      @com.parameters([type=I4] return) */
  public int getViewOptions();


  public static final com.ms.com._Guid iid = new com.ms.com._Guid((int)0xe7a1af80, (short)0x4d96, (short)0x11cf, (byte)0x96, (byte)0xc, (byte)0x0, (byte)0x80, (byte)0xc7, (byte)0xf4, (byte)0xee, (byte)0x85);
}
