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

// Dual interface ISearchCommandExt
/** @com.interface(iid=1D2EFD50-75CE-11D1-B75A-00A0C90564FE, thread=NO, type=DUAL) */
public interface ISearchCommandExt extends com.ms.com.IUnknown
{
  /** @com.method(vtoffset=4, dispid=1, type=METHOD, name="ClearResults", addFlagsVtable=4)
      @com.parameters() */
  public void ClearResults();

  /** @com.method(vtoffset=5, dispid=2, type=METHOD, name="NavigateToSearchResults", addFlagsVtable=4)
      @com.parameters() */
  public void NavigateToSearchResults();

  /** @com.method(vtoffset=6, dispid=3, type=PROPGET, name="ProgressText", addFlagsVtable=4)
      @com.parameters([type=STRING] return) */
  public java.lang.String getProgressText();

  /** @com.method(vtoffset=7, dispid=4, type=METHOD, name="SaveSearch", addFlagsVtable=4)
      @com.parameters() */
  public void SaveSearch();

  /** @com.method(vtoffset=8, dispid=5, type=METHOD, name="GetErrorInfo", addFlagsVtable=4)
      @com.parameters([out,size=1,elementType=STRING,type=ARRAY] pbs, [type=I4] return) */
  public int GetErrorInfo(java.lang.String[] pbs);

  /** @com.method(vtoffset=9, dispid=6, type=METHOD, name="SearchFor", addFlagsVtable=4)
      @com.parameters([in,type=I4] iFor) */
  public void SearchFor(int iFor);

  /** @com.method(vtoffset=10, dispid=7, type=METHOD, name="GetScopeInfo", addFlagsVtable=4)
      @com.parameters([in,type=STRING] bsScope, [out,size=1,elementType=I4,type=ARRAY] pdwScopeInfo) */
  public void GetScopeInfo(java.lang.String bsScope, int[] pdwScopeInfo);

  /** @com.method(vtoffset=11, dispid=8, type=METHOD, name="RestoreSavedSearch", addFlagsVtable=4)
      @com.parameters([in,elementType=VARIANT,type=PTR] pvarFile) */
  public void RestoreSavedSearch(com.ms.com.Variant pvarFile);

  /** @com.method(vtoffset=12, dispid=100, type=METHOD, name="Execute", addFlagsVtable=4)
      @com.parameters([in,elementType=VARIANT,type=PTR] RecordsAffected, [in,elementType=VARIANT,type=PTR] Parameters, [in,type=I4] Options) */
  public void Execute(com.ms.com.Variant RecordsAffected, com.ms.com.Variant Parameters, int Options);

  /** @com.method(vtoffset=13, dispid=101, type=METHOD, name="AddConstraint", addFlagsVtable=4)
      @com.parameters([in,type=STRING] Name, [in,type=VARIANT] Value) */
  public void AddConstraint(java.lang.String Name, com.ms.com.Variant Value);

  /** @com.method(vtoffset=14, dispid=102, type=METHOD, name="GetNextConstraint", addFlagsVtable=4)
      @com.parameters([in,type=BOOLEAN] fReset, [iid=4A3DF050-23BD-11D2-939F-00A0C91EEDBA,thread=NO,type=DISPATCH] return) */
  public shell32.DFConstraint GetNextConstraint(boolean fReset);


  public static final com.ms.com._Guid iid = new com.ms.com._Guid((int)0x1d2efd50, (short)0x75ce, (short)0x11d1, (byte)0xb7, (byte)0x5a, (byte)0x0, (byte)0xa0, (byte)0xc9, (byte)0x5, (byte)0x64, (byte)0xfe);
}
