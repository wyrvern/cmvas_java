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

// Dual interface IShellLinkDual
/** @com.interface(iid=88A05C00-F000-11CE-8350-444553540000, thread=NO, type=DUAL) */
public interface IShellLinkDual extends com.ms.com.IUnknown
{
  /** @com.method(vtoffset=4, dispid=1610743808, type=PROPGET, name="Path", addFlagsVtable=4)
      @com.parameters([type=STRING] return) */
  public java.lang.String getPath();

  /** @com.method(vtoffset=5, dispid=1610743808, type=PROPPUT, name="Path", addFlagsVtable=4)
      @com.parameters([in,type=STRING] pbs) */
  public void setPath(java.lang.String pbs);

  /** @com.method(vtoffset=6, dispid=1610743810, type=PROPGET, name="Description", addFlagsVtable=4)
      @com.parameters([type=STRING] return) */
  public java.lang.String getDescription();

  /** @com.method(vtoffset=7, dispid=1610743810, type=PROPPUT, name="Description", addFlagsVtable=4)
      @com.parameters([in,type=STRING] pbs) */
  public void setDescription(java.lang.String pbs);

  /** @com.method(vtoffset=8, dispid=1610743812, type=PROPGET, name="WorkingDirectory", addFlagsVtable=4)
      @com.parameters([type=STRING] return) */
  public java.lang.String getWorkingDirectory();

  /** @com.method(vtoffset=9, dispid=1610743812, type=PROPPUT, name="WorkingDirectory", addFlagsVtable=4)
      @com.parameters([in,type=STRING] pbs) */
  public void setWorkingDirectory(java.lang.String pbs);

  /** @com.method(vtoffset=10, dispid=1610743814, type=PROPGET, name="Arguments", addFlagsVtable=4)
      @com.parameters([type=STRING] return) */
  public java.lang.String getArguments();

  /** @com.method(vtoffset=11, dispid=1610743814, type=PROPPUT, name="Arguments", addFlagsVtable=4)
      @com.parameters([in,type=STRING] pbs) */
  public void setArguments(java.lang.String pbs);

  /** @com.method(vtoffset=12, dispid=1610743816, type=PROPGET, name="Hotkey", addFlagsVtable=4)
      @com.parameters([type=I4] return) */
  public int getHotkey();

  /** @com.method(vtoffset=13, dispid=1610743816, type=PROPPUT, name="Hotkey", addFlagsVtable=4)
      @com.parameters([in,type=I4] piHK) */
  public void setHotkey(int piHK);

  /** @com.method(vtoffset=14, dispid=1610743818, type=PROPGET, name="ShowCommand", addFlagsVtable=4)
      @com.parameters([type=I4] return) */
  public int getShowCommand();

  /** @com.method(vtoffset=15, dispid=1610743818, type=PROPPUT, name="ShowCommand", addFlagsVtable=4)
      @com.parameters([in,type=I4] piShowCommand) */
  public void setShowCommand(int piShowCommand);

  /** @com.method(vtoffset=16, dispid=1610743820, type=METHOD, name="Resolve", addFlagsVtable=4)
      @com.parameters([in,type=I4] fFlags) */
  public void Resolve(int fFlags);

  /** @com.method(vtoffset=17, dispid=1610743821, type=METHOD, name="GetIconLocation", addFlagsVtable=4)
      @com.parameters([out,size=1,elementType=STRING,type=ARRAY] pbs, [type=I4] return) */
  public int GetIconLocation(java.lang.String[] pbs);

  /** @com.method(vtoffset=18, dispid=1610743822, type=METHOD, name="SetIconLocation", addFlagsVtable=4)
      @com.parameters([in,type=STRING] bs, [in,type=I4] iIcon) */
  public void SetIconLocation(java.lang.String bs, int iIcon);

  /** @com.method(vtoffset=19, dispid=1610743823, type=METHOD, name="Save", addFlagsVtable=4)
      @com.parameters([in,type=VARIANT] vWhere) */
  public void Save(com.ms.com.Variant vWhere);


  public static final com.ms.com._Guid iid = new com.ms.com._Guid((int)0x88a05c00, (short)0xf000, (short)0x11ce, (byte)0x83, (byte)0x50, (byte)0x44, (byte)0x45, (byte)0x53, (byte)0x54, (byte)0x0, (byte)0x0);
}
