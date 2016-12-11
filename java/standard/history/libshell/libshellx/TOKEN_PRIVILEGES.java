package lib.libshellx;

import com.ms.dll.*;
import com.ms.com.*;
import com.ms.win32.*;

/** @dll.struct() */
public class TOKEN_PRIVILEGES
{
  public int                              PrivilegeCount;
//  public lib.libshellx.LUID_AND_ATTRIBUTES   Privileges[]  = { new lib.libshellx.LUID_AND_ATTRIBUTES() };
  public lib.libshellx.LUID_AND_ATTRIBUTES   Privileges  = new lib.libshellx.LUID_AND_ATTRIBUTES();
}
