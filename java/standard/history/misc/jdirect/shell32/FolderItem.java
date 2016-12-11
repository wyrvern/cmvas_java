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

// Dual interface FolderItem
/** @com.interface(iid=FAC32C80-CBE4-11CE-8350-444553540000, thread=NO, type=DUAL) */
public interface FolderItem extends com.ms.com.IUnknown
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

  /** @com.method(vtoffset=7, dispid=0, type=PROPPUT, name="Name", addFlagsVtable=4)
      @com.parameters([in,type=STRING] pbs) */
  public void setName(java.lang.String pbs);

  /** @com.method(vtoffset=8, dispid=1610743812, type=PROPGET, name="Path", addFlagsVtable=4)
      @com.parameters([type=STRING] return) */
  public java.lang.String getPath();

  /** @com.method(vtoffset=9, dispid=1610743813, type=PROPGET, name="GetLink", addFlagsVtable=4)
      @com.parameters([iid=00020400-0000-0000-C000-000000000046,thread=NO,type=DISPATCH] return) */
  public java.lang.Object getGetLink();

  /** @com.method(vtoffset=10, dispid=1610743814, type=PROPGET, name="GetFolder", addFlagsVtable=4)
      @com.parameters([iid=00020400-0000-0000-C000-000000000046,thread=NO,type=DISPATCH] return) */
  public java.lang.Object getGetFolder();

  /** @com.method(vtoffset=11, dispid=1610743815, type=PROPGET, name="IsLink", addFlagsVtable=4)
      @com.parameters([type=BOOLEAN] return) */
  public boolean getIsLink();

  /** @com.method(vtoffset=12, dispid=1610743816, type=PROPGET, name="IsFolder", addFlagsVtable=4)
      @com.parameters([type=BOOLEAN] return) */
  public boolean getIsFolder();

  /** @com.method(vtoffset=13, dispid=1610743817, type=PROPGET, name="IsFileSystem", addFlagsVtable=4)
      @com.parameters([type=BOOLEAN] return) */
  public boolean getIsFileSystem();

  /** @com.method(vtoffset=14, dispid=1610743818, type=PROPGET, name="IsBrowsable", addFlagsVtable=4)
      @com.parameters([type=BOOLEAN] return) */
  public boolean getIsBrowsable();

  /** @com.method(vtoffset=15, dispid=1610743819, type=PROPGET, name="ModifyDate", addFlagsVtable=4)
      @com.parameters([type=DATE] return) */
  public double getModifyDate();

  /** @com.method(vtoffset=16, dispid=1610743819, type=PROPPUT, name="ModifyDate", addFlagsVtable=4)
      @com.parameters([in,type=DATE] pdt) */
  public void setModifyDate(double pdt);

  /** @com.method(vtoffset=17, dispid=1610743821, type=PROPGET, name="Size", addFlagsVtable=4)
      @com.parameters([type=I4] return) */
  public int getSize();

  /** @com.method(vtoffset=18, dispid=1610743822, type=PROPGET, name="Type", addFlagsVtable=4)
      @com.parameters([type=STRING] return) */
  public java.lang.String getType();

  /** @com.method(vtoffset=19, dispid=1610743823, type=METHOD, name="Verbs", addFlagsVtable=4)
      @com.parameters([iid=1F8352C0-50B0-11CF-960C-0080C7F4EE85,thread=NO,type=DISPATCH] return) */
  public shell32.FolderItemVerbs Verbs();

  /** @com.method(vtoffset=20, dispid=1610743824, type=METHOD, name="InvokeVerb", addFlagsVtable=4)
      @com.parameters([in,type=VARIANT] vVerb) */
  public void InvokeVerb(com.ms.com.Variant vVerb);


  public static final com.ms.com._Guid iid = new com.ms.com._Guid((int)0xfac32c80, (short)0xcbe4, (short)0x11ce, (byte)0x83, (byte)0x50, (byte)0x44, (byte)0x45, (byte)0x53, (byte)0x54, (byte)0x0, (byte)0x0);
}
