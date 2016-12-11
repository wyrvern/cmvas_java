/*
 *  sample.dcom.OutprocClient.java
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
 * and using a COM object from a Local Server. 
 */
public class OutprocClient extends java.applet.Applet implements sample.IListener { 
/**
 * Class ID for the object to create.  This is the Class ID for the
 * Hub2 object.
 */
	private final _Guid clsid = new _Guid("{B9B841A1-0B22-11d2-9B9D-00C04F8C94D0}");
/**
 * Main method for starting the sample from the command line.
 */
	public static void main(String args[]){
        com.ms.lang.SystemX.exitProcessAfterMainThreadReturns( true );

		new OutprocClient();

        // clean up.
        System.gc();
        System.runFinalization();
	}
/**
 * Creates an instance of the Hub2 COM object using a J/Direct call to
 * CoCreateInstance through com.ms.win32.ole32.CoCreateInstance.
 * The resulting COM object is cast to sample.IMessenger, and has its
 * addListener, sendMessage, sendObjects, and removeListener methods 
 * called.  The results from OutprocClient and the IMessenger COM object
 * will be printed to System.out. 
 */
	public OutprocClient(){
		sample.IMessenger mess = null;
		try{
			System.out.println("OutprocClient :about to call CoCreateInstance");
			mess = (sample.IMessenger)com.ms.win32.Ole32.CoCreateInstance(
                                                  clsid,
                                                  null,
                                                  com.ms.win32.win.CLSCTX_LOCAL_SERVER,
                                                  new _Guid("{00000000-0000-0000-C000-000000000046}"));
			System.out.println("Outproc : successful cast to IMessenger");
		}catch(Exception ii){
			System.out.println("OutprocClient: Exception "+ii);
		}finally{
			System.out.println("OutprocClient - Object: "+mess);
		}
		System.out.println("Outproc: about to add this as listener");
		//With the newly created instance, begin to call methods on the IMessenger Interface
		String key = mess.addListener(this);
		System.out.println("Outproc: about to send a message");
		mess.sendMessage("This is the first test message");
		System.out.println("Outproc: back from send message");
		Variant[] vars = new Variant[3];//Packaging array objects into a SafeArray
		vars[0]=new Variant(new Integer(99));
		Vector datum = new Vector();
		datum.addElement(new Date());
		datum.addElement(new Vector());
		vars[1]=new Variant(datum);
		vars[2]=new Variant(new StringBuffer("Howdy"));
		SafeArray safe = new SafeArray(Variant.VariantVariant,3);
		safe.setVariants(0,3,vars,0);
		Variant sender = new Variant(safe,true);
		mess.sendObjects(safe);
		mess.removeListener(key);
		System.out.println("OutprocClient - Done");
	}
/**
 * Implemented as part of the sample.IListener interface for receiving
 * messages from the server.
 * 
 * @param String message - Message sent by the server.
 */
	public synchronized void processMessage(String message){
		System.out.println("OutprocClient - message received "+message);
	}
/**
 * Implemented as part of the sample.IListener interface for receiving 
 * SafeArrays form the server.
 * 
 * @param SafeArray safe - Array of objects broadcast by the server.
 */
	public synchronized void processObjects(SafeArray safe){
		System.out.println("OutprocClient - data received : Data Length ");
	Variant[] data = safe.toVariantArray();
		for (int i=0;i<data.length;i++)
			System.out.println("OutprocClient: Element "+i+" is "+data[i].toObject().getClass().getName()+
							   " contents "+data[i].toObject());
	}
}