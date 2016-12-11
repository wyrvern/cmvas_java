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

// Dual interface IShellLinkDual2
/** @com.interface(iid=317EE249-F12E-11D2-B1E4-00C04F8EEB3E, thread=NO, type=DUAL) */
public interface IShellLinkDual2 extends shell32.IShellLinkDual
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

  /** @com.method(vtoffset=20, dispid=1610809344, type=PROPGET, name="Target", addFlagsVtable=4)
      @com.parameters([iid=FAC32C80-CBE4-11CE-8350-444553540000,thread=NO,type=DISPATCH] return) */
  public shell32.FolderItem getTarget();


  public static final com.ms.com._Guid iid = new com.ms.com._Guid((int)0x317ee249, (short)0xf12e, (short)0x11d2, (byte)0xb1, (byte)0xe4, (byte)0x0, (byte)0xc0, (byte)0x4f, (byte)0x8e, (byte)0xeb, (byte)0x3e);
}
