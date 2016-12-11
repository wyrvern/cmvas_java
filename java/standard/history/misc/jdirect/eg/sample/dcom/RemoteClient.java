/*
 *  sample.dcom.RemoteClient.java
 *
 *  (C) Copyright 1995 - 1999 Microsoft Corporation.  All rights reserved.
 *
 */
package sample.dcom;

import com.ms.com.*;
import java.util.Vector;
import java.util.Date;
/**
 * Sample for demonstrating how to use CoCreateInstance for creating
 * and using a DCOM object.  It is an interesting exercise to play
 * with the DCOMCNFG settings for the Hub2 Object on the server, and
 * with the DCOMParam settings to understand the effect of DCOM 
 * security on the application operation.
*/
public class RemoteClient implements sample.IListener{ 
/**
 * Class ID for the object to create.  This is the Class ID for the
 * Hub2 object.
 */
	private final _Guid clsid = 
             new _Guid("{B9B841A1-0B22-11d2-9B9D-00C04F8C94D0}");
/**
 * Server name where the COM object will be created.  This can be any
 * valid DCOM name.
 */
	private final String serverName = null;
/**
 * Password for the user that will be used to authenticate this 
 * application.
 */
	private final String password = null;
/**
 * Name of the user that will be used for authentication.
 */
	private final String userName = null;
/**
 * Domain where the authenticating user is registered.
 */
	private final String domainName = null;
/**
 * Main method for starting the sample from the command line.
 */
	public static void main(String args[]){	
        com.ms.lang.SystemX.exitProcessAfterMainThreadReturns( true );

		new RemoteClient();

        // clean up.
        System.gc();
        System.runFinalization();
	}
/**
 * Creates an instance of the Hub2 COM object using a J/Direct call to
 * CoCreateInstanceEx through sample.util.DCOMLib.CoCreateInstanceEx.
 * The resulting COM object is cast to sample.IMessenger, and has its
 * addListener, sendMessage, sendObjects, and removeListener methods 
 * called.  The results from RemoteClient and the IMessenger COM object
 * will be printed to System.out. 
 */
	public RemoteClient(){
		sample.IMessenger mess = null;
        COSERVERINFO coServerInfo = new COSERVERINFO();
        coServerInfo.pAuthInfo = new COAUTHINFO();
        coServerInfo.pwszName = serverName;
        coServerInfo.pAuthInfo.dwAuthnLevel=
                     com.ms.win32.win.RPC_C_AUTHN_LEVEL_CONNECT;
        coServerInfo.pAuthInfo.dwAuthnSvc=
                     com.ms.win32.win.RPC_C_AUTHN_WINNT;
        coServerInfo.pAuthInfo.dwAuthzSvc=
                     com.ms.win32.win.RPC_C_AUTHZ_NONE;
        coServerInfo.pAuthInfo.dwImpersonationLevel =
                     com.ms.win32.win.RPC_C_IMP_LEVEL_IDENTIFY;
        coServerInfo.pAuthInfo.pAuthIdentityData = 
                       new COAUTHIDENTITY();
        coServerInfo.pAuthInfo.pAuthIdentityData.domain = domainName;
        coServerInfo.pAuthInfo.pAuthIdentityData.password = password;
        coServerInfo.pAuthInfo.pAuthIdentityData.user = userName;

		MULTI_QI[] multiQI = new MULTI_QI[]{new MULTI_QI()};
		multiQI[0].pIID=ComLib.IID_IUnknown;
		try{
			System.out.println("RemoteClient - About to call CoCreateInstanceEx");
			com.ms.win32.Ole32.CoCreateInstanceEx(
                                            clsid,
                                            null,
                                            com.ms.win32.win.CLSCTX_REMOTE_SERVER,
                                            coServerInfo,
                                            multiQI);
			mess = (sample.IMessenger)multiQI[0].pItf;
			System.out.println("RemoteClient - successful cast to IMessenger");
		}catch(Exception ii){
			System.out.println("RemoteClient: Exception "+ii);
		}finally{
			System.out.println("RemoteClient - HResult: "+
                               Integer.toHexString(multiQI[0].hr));
			System.out.println("RemoteClient - Object: "+mess);
		}
		System.out.println("RemoteClient: about to add this as Listener");
		String key = mess.addListener(this);//First method call to the remote IMessenger obj
		System.out.println("RemoteClient: about to send a message");
		mess.sendMessage("This is the first test message");
		Variant[] vars = new Variant[3];
		vars[0]=new Variant(new Integer(99));
		Vector datum = new Vector();
		datum.addElement(new Date());
		datum.addElement(new Vector());
		vars[1]=new Variant(datum);
		vars[2]=new Variant(new StringBuffer("Howdy"));
		SafeArray safe = new SafeArray(Variant.VariantVariant,3);
		safe.setVariants(0,3,vars,0);
		Variant sender = new Variant(safe,true);
		mess.sendObjects( safe );
		mess.removeListener(key);
		System.out.println("RemoteClient - Done");
		}
/**
 * Implemented as part of the sample.IListener interface for receiving
 * messages from the server.
 * 
 * @param String message - Message sent by the server.
 */
	public synchronized void processMessage(String message){
		System.out.println("RemoteClient - message received "+message);
	}
/**
 * Implemented as part of the sample.IListener interface for receiving 
 * SafeArrays form the server.
 * 
 * @param SafeArray safe - Array of objects broadcast by the server.
 */
	public synchronized void processObjects(SafeArray safe){
		System.out.println("RemoteClient - data received : Data Length ");
	Variant[] data = safe.toVariantArray();
		for (int i=0;i<data.length;i++)
			System.out.println("RemoteClient: Element "+i+" is "+data[i].toObject().getClass().getName()+
							   " contents "+data[i].toObject());
	}
}