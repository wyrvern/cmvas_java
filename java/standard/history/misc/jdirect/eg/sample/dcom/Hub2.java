/*
 *  sample.dcom.Hub2.java
 *
 *  (C) Copyright 1995 - 1999 Microsoft Corporation.  All rights reserved.
 *
 */
package sample.dcom;

import java.util.Hashtable;
import java.util.Enumeration;
import com.ms.com.Variant;
import com.ms.com.SafeArray;
/**
 * Java implemented COM object which registers listeners for receiving
 * information sent to this hub through calls to sendMessage and 
 * sendObjects.  The listeners are required to implement the COM interface
 * IListener (defined in sample.idl) for receiving these notifications. 
 * The proxystub.dll must be registered on both the client and server 
 * machines for local server/remote server access to operate. 
 */
public class Hub2 implements sample.IMessenger{
	/**
 	 * This is where the listeners are stored.  All listeners will 
 	 * appear as com.ms.com.CUnknown objects to this COM Object.
	 */
	private Hashtable listeners = new Hashtable();
/**
 * Adds the object to the list of objects to be notified for messages 
 * and objects.
 * 
 * @param Object listener - Object implementing sample.IListener
 * 
 * @return String - unique ID for the listener.  This will be needed
 *					to remove the listener from the list.
 */
	public synchronized String addListener(Object listener){
		String key = getKey();
		listeners.put(key,listener);
		System.out.println("Hub2 - Listener added with key "+key);
		return key;
	}
/**
 * Removes the listener identified from the list of objects to 
 * receive messages and objects.
 * 
 * @param String key - key that was returned when the listener was
 *						added.
 */
	public synchronized void removeListener(String key){
		System.out.println("Hub2 - removing Listener with key "+key);
		listeners.remove(key);
	}
/**
 * Sends the message to all registered listeners. Unless this COM object
 * was created by a process as a singleton, it will only be possible
 * for a COM object to send messages to itself.
 * 
 * @param String message - message to send to all listeners.
 */
	public synchronized void sendMessage(String message){
		System.out.println("Hub2 broadcasting message: "+message);
		System.out.println("Hub2 - client size "+listeners.size());
		for (Enumeration e = listeners.elements();e.hasMoreElements();){
			Object o =e.nextElement();
			System.out.println("Hub2 - listener "+o);
			sample.IListener client = (sample.IListener)o;
			System.out.println("Hub2 - About to send Message");
			client.processMessage(message);
		}
		System.out.println("Hub2: leaving sendMessage");
	}
/**
 * Creates a unique key for that will identify a new listener.  
 * 
 * @return String - newly generated key.
 */		 
	private String getKey(){
		return (new Double(Math.random())).toString();
	}
/**
 * Sends an Array of objects to all registered listeners. Unless this COM object
 * was created by a process as a singleton, it will only be possible
 * for a COM object to send messages to itself.
 * 
 * @param SafeArray safe - contains objects to be broadcast to all listeners. 
 */
	public synchronized void sendObjects(SafeArray safe){
		System.out.println("Hub2 sending Objects "+safe);
		System.out.println("Hub2 safearray num locks "+safe.getNumLocks());
		System.out.println("Hub2 safearray Lbound "+safe.getLBound());
		System.out.println("Hub2 safearray Ubound "+safe.getUBound());
		for (Enumeration e = listeners.elements();e.hasMoreElements();)
			((sample.IListener)e.nextElement()).processObjects(safe);
	}
}