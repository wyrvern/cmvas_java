//
// Auto-generated using JActiveX.EXE 5.00.3601
//   (jactivex /javatlb /X:m- -d . shelllnk.tlb)
//
// WARNING: Do not remove the comments that include "@com" directives.
// This source file must be compiled by a @com-aware compiler.
// If you are using the Microsoft Visual J++ compiler, you must use
// version 1.02.3920 or later. Previous versions will not issue an error
// but will not generate COM-enabled class files.
//

package shelllnk;

import com.ms.com.*;
import com.ms.com.IUnknown;
import com.ms.com.Variant;

// VTable-only interface IPersistFile
/** @com.interface(iid=0000010B-0000-0000-C000-000000000046, thread=NO) */
public interface IPersistFile extends com.ms.com.IUnknown
{
  /** @com.method(vtoffset=0)
      @com.parameters([in,out,size=1,type=ARRAY] pClassID) */
  public void GetClassID(int[] pClassID);

  /** @com.method(vtoffset=1)
      @com.parameters() */
  public void IsDirty();

  /** @com.method(vtoffset=2)
      @com.parameters([in,customMarshal="com.ms.com.AnsiStringMarshaller",type=CUSTOM] pszFileName, [in,type=I4] dwMode) */
  public void Load(java.lang.String pszFileName, int dwMode);

  /** @com.method(vtoffset=3)
      @com.parameters([in,customMarshal="com.ms.com.AnsiStringMarshaller",type=CUSTOM] pszFileName, [in,type=I4] fRemember) */
  public void Save(java.lang.String pszFileName, int fRemember);

  /** @com.method(vtoffset=4)
      @com.parameters([in,customMarshal="com.ms.com.AnsiStringMarshaller",type=CUSTOM] pszFileName) */
  public void SaveCompleted(java.lang.String pszFileName);

  /** @com.method(vtoffset=5)
      @com.parameters([in,out,customMarshal="com.ms.com.AnsiStringMarshaller",type=CUSTOMBYREF] ppszFileName) */
  public void GetCurFile(java.lang.String[] ppszFileName);


  public static final com.ms.com._Guid iid = new com.ms.com._Guid((int)0x10b, (short)0x0, (short)0x0, (byte)0xc0, (byte)0x0, (byte)0x0, (byte)0x0, (byte)0x0, (byte)0x0, (byte)0x0, (byte)0x46);
}
