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

// Dual interface IFileSearchBand
/** @com.interface(iid=2D91EEA1-9932-11D2-BE86-00A0C9A83DA1, thread=NO, type=DUAL) */
public interface IFileSearchBand extends com.ms.com.IUnknown
{
  /** @com.method(vtoffset=4, dispid=1, type=METHOD, name="SetFocus", addFlagsVtable=4)
      @com.parameters() */
  public void SetFocus();

  /** @com.method(vtoffset=5, dispid=2, type=METHOD, name="SetSearchParameters", addFlagsVtable=4)
      @com.parameters([in,size=1,elementType=STRING,type=ARRAY] pbstrSearchID, [in,type=BOOLEAN] bNavToResults, [in,elementType=VARIANT,type=PTR] pvarScope, [in,elementType=VARIANT,type=PTR] pvarQueryFile) */
  public void SetSearchParameters(java.lang.String[] pbstrSearchID, boolean bNavToResults, com.ms.com.Variant pvarScope, com.ms.com.Variant pvarQueryFile);

  /** @com.method(vtoffset=6, dispid=3, type=PROPGET, name="SearchID", addFlagsVtable=4)
      @com.parameters([type=STRING] return) */
  public java.lang.String getSearchID();

  /** @com.method(vtoffset=7, dispid=4, type=PROPGET, name="Scope", addFlagsVtable=4)
      @com.parameters([type=VARIANT] return) */
  public com.ms.com.Variant getScope();

  /** @com.method(vtoffset=8, dispid=5, type=PROPGET, name="QueryFile", addFlagsVtable=4)
      @com.parameters([type=VARIANT] return) */
  public com.ms.com.Variant getQueryFile();


  public static final com.ms.com._Guid iid = new com.ms.com._Guid((int)0x2d91eea1, (short)0x9932, (short)0x11d2, (byte)0xbe, (byte)0x86, (byte)0x0, (byte)0xa0, (byte)0xc9, (byte)0xa8, (byte)0x3d, (byte)0xa1);
}
