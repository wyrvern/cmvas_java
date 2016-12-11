package lib.shellx;

import com.ms.dll.*;
import com.ms.com.*;
import com.ms.win32.*;

/** @dll.struct() */
public class TOKEN_PRIVILEGES
{
  public int                              PrivilegeCount;
//  public lib.shellx.LUID_AND_ATTRIBUTES   Privileges[]  = { new lib.shellx.LUID_AND_ATTRIBUTES() };
  public lib.shellx.LUID_AND_ATTRIBUTES   Privileges  = new lib.shellx.LUID_AND_ATTRIBUTES();
}
