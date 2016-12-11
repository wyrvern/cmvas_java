package lib.shellx;

import com.ms.dll.*;
import com.ms.com.*;
import com.ms.win32.*;

public interface TOKEN_INFORMATION_CLASS
{
     int   TokenUser               = 1,
           TokenGroups             = 2,
           TokenPrivileges         = 3,
           TokenOwner              = 4,
           TokenPrimaryGroup       = 5,
           TokenDefaultDacl        = 6,
           TokenSource             = 7,
           TokenType               = 8,
           TokenImpersonationLevel = 9, 
           TokenStatistics         = 10,
           TokenRestrictedSids     = 11,
           TokenSessionId          = 12;
}
