/*
 * lib.shellx.util.StructArray.java
 *
 * (C) Copyright 1995 - 1999 Microsoft Corporation.  All rights reserved.
 *
 */
package lib.shellx.util;
/**
 * This Utility Class is used to facilitate the passage of arrys of structs between 
 * J/Direct and Java.  These methods are used to create contiguous arrays of structs
 * and for obtaining a cookie that represents the array that can be used in a 
 * J/Direct method.  These utilities are required, as the VM currently treats 
 * arrays of structs as arrays of pointers, rather than arrays of values (which is
 * what the C code will expect).
 * 
 * If any element from the array is required, a clone of that element should be
 * created, otherwise if the array is GCd, the element currently in use will be
 * invalid.  Note that the default clone method that java.lang.Object has will
 * create a new Array element which points to exactly the same data, so the clone
 * will become invalid.  Each struct that will be part of a struct array should
 * implement Cloneable and override the clone method to create a new object with
 * the same values.
 * 
 * @version 1.0
 */
public class structArray implements Runnable{
        /**
         * Instance of the StructArray thread that will perform the garbage 
         * collection of arrays.
         */
        protected static Thread thread = null;
        /**
         * Length of time in milliseconds between our checks for freeing any
         * allocated memory for arrays.
         */
        protected static int SLEEP_TIME=5000;
        /**
         * This is a storage of a weak reference to all arrays that have been
         * allocated, and the memory address that they were mapped to.  If the
         * weak reference referent is found to be NULL, the memory is freed.
         */
        protected static java.util.Hashtable arrays = new java.util.Hashtable();
        /**
         * Object used to synchronize the allocation with the cleanup
         */
        private static Object sync = new Object();
        /**
         * This contains a list of allocated arrays to CStructArray mappings
         */
        protected static java.util.Hashtable cStructs = new java.util.Hashtable();
/**
 * Sets the time between checks for GCd struct arrays, which results in freeing
 * the memory that they occupied.  This can only be set ONCE per process, and
 * must be set BEFORE any struct arrays are created.
 * 
 * @param int time - timeout in milliseconds for dead array check
 */
    public static synchronized void setTimeout(int time){
        SLEEP_TIME=time;
    }
/**
 * We only want US to be able to construct an instance of this class.
 */
        private structArray(){}
/**
 * Ensures that a StructArray garbage collection thread is running.
 */
    private static void isStarted()throws Exception{
        if (thread==null){
            thread = new Thread(new structArray());
            thread.start();
        }
    }
/**
 * Creates an array of structs of the given type, and size that is contiguous in
 * memory, so that they can be passed to a J/Direct call that expects an array
 * of structs.
 * 
 * @param Class type - class of the Object declared as an dll.Struct that will be 
 *          the type used for the array.
 * 
 * @param int num - number of elements in the array.
 * 
 * @param int handle - the memory location where the struct array will occupy.
 * 
 * @exception RuntimeException - this will be thrown if the Class specified is NOT
 *          some sort of dll.struct , or if there was a problem creating the array.
 */	
	public static synchronized Object newStructArray(Class type,int num,int handle)throws Exception{
        synchronized (sync){
            isStarted();
            if (!com.ms.dll.DllLib.isStruct(type))
                throw new RuntimeException("Class is not an @dll.struct !!");
            else if (num<1)
                return null;
            else{
		        Object[] foo = (Object[])java.lang.reflect.Array.newInstance(type,num);
                for (int i=0;i<num;i++)
			        foo[i]=com.ms.dll.DllLib.ptrToStruct(
					    			type,handle+(i*com.ms.dll.DllLib.sizeOf(type)));
            
                arrays.put(new Integer(handle),
                           new com.ms.vm.WeakReference(foo));
                //This needs to store weak refs to the array.
                //arrays should have memory as key!
                cStructs.put(new Integer(handle),newCStructArray(foo));
                return foo;
            }
        }
 	}
/**
 * The memory that is allocated for the array of structs MUST be set to zero
 * before the mapping takes place, otherwise any pointers to structs in the 
 * mapping will be resolved, and may be invalid.
 * 
 * @param Class type - class of the Object declared as an dll.Struct that will be 
 *          the type used for the array.
 * 
 * @param int num - number of elements in the array.
 * 
 * @exception RuntimeException - this will be thrown if the Class specified is NOT
 *          some sort of dll.struct , or if there was a problem creating the array.
 */
    public static synchronized Object newStructArray(
                                              Class type, 
                                              int num)throws Exception{
        return newStructArray(type,num,alloc(com.ms.dll.DllLib.sizeOf(type)*num));
    }
/**
 * Returns an object that can be used as the start of the Struct array for the 
 * J/Direct call.  This is required, as a Java array of dll.struct() objects is 
 * actually an array of pointers, where the C world will expect this to be a 
 * contiguous list of memory with values.
 * 
 * @param Object[] data - an array of Structs that was created with the 
 *          getStructArray method that is about to be passed to a J/Direct method.
 * 
 * @return Object - cookie that represents the Array of Structs as the J/Direct 
 *          method would like to see them.
 */
	protected static cStructArray newCStructArray(Object[] array){
 		if (array==null) return null;
        int handle = com.ms.dll.Root.alloc(array[0]);
    	cStructArray foo = (cStructArray)com.ms.dll.DllLib.ptrToStruct(
                lib.shellx.util.cStructArray.class,
                com.ms.dll.DllLib.addrOf(handle));
        com.ms.dll.Root.free(handle);
        foo.array=new com.ms.vm.WeakReference(array);
        return foo;
	}
/**
 * Returns an object that can be used as the start of the Struct array for the 
 * J/Direct call.  This is required, as a Java array of dll.struct() objects is 
 * actually an array of pointers, where the C world will expect this to be a 
 * contiguous list of memory with values.
 * 
 * @param Object[] data - an array of Structs that was created with the 
 *          getStructArray method that is about to be passed to a J/Direct method.
 * 
 * @return CStructArray - cookie that represents the Array of Structs as the J/Direct 
 *          method would like to see them.
 */
    public static synchronized cStructArray toCStructArray(Object[] array){
        if ((array==null)||(array.length<1))
            return null;
        if (com.ms.dll.DllLib.isStruct(array[0].getClass())){
            int handle = com.ms.dll.Root.alloc(array[0]);
            cStructArray cStruct = (cStructArray)cStructs.get(
                                new Integer(com.ms.dll.DllLib.addrOf(handle)));  
            com.ms.dll.Root.free(handle);
            return cStruct;
        }else 
            return null;
    }
/**
 * This will return the java array represented by the CStructArray.  This will
 * only work if the original array was constructed using StructArray!!!
 * 
 * @param CStructArray - represents the array that we want.
 * 
 * @return Object - this is the java array of structs.
 */
    public static synchronized Object toStructArray(cStructArray array){
        int handle = com.ms.dll.Root.alloc(array);
        Object ret =  toStructArray(com.ms.dll.DllLib.addrOf(handle));
        com.ms.dll.Root.free(handle);
        return ret;
    }
/**
 * This will return the java array represented by the CStructArray.  This will
 * only work if the original array was constructed using StructArray!!!
 * 
 * @param int - represents the memory address of the array that we want.
 * 
 * @return Object - this is the java array of structs.
 */
    public static synchronized Object toStructArray(int memAddr){
        com.ms.vm.WeakReference w = 
                     (com.ms.vm.WeakReference)arrays.get(new Integer(memAddr));
        if (w!=null)
            return w.getReferent();
        else return null;
    }
/**
 * DllLIb.allocCoTaskMem method does not clear the memory that it allocates, 
 * this method allocates memory and zeros all values.
 * 
 * @parm int size - The amount of memory required in bytes.
 * 
 * @return int - memory address for the started of the allocated space.
 */
public synchronized static int alloc(int size) {
    int ptr = com.ms.dll.DllLib.allocCoTaskMem(size);
    FillMemory(ptr,size,(byte)0);
    return ptr;
}
/**
 * Used by alloc to clear a block of native memory.
 * 
 * @param int ptr - pointer to native memory that will be filled with data.
 * @param int size - amount of bytes allocated at this ptr.
 * @param byte - This byte will be used to fill the allocated memory. 
 * 
 * @dll.import("Kernel32")
 */
public static native void FillMemory(int ptr, int size, byte data);
/**
 * Checks the weakreferences to the arrays that have been allocated, if they 
 * have been garbage collected, we free up the memory that we allocated for them.
 * If there are no outstanding arrays, the garbage collector thread that we have
 * started for performing this cleanup will be shutdown.
 * 
 * @return boolean - true if there are no more outstanding arrays, and we should
 *          shutdown.
 */
    protected boolean doCleanup(){
		System.out.println("StructArray : in doCleanup "+arrays);
        synchronized (sync){
            for (java.util.Enumeration e = arrays.keys();e.hasMoreElements();){
                Integer key = (Integer)e.nextElement();
                com.ms.vm.WeakReference elm = (com.ms.vm.WeakReference)arrays.get(key);
                if (elm.getReferent()==null){
                        com.ms.dll.DllLib.freeCoTaskMem(key.intValue());
                        arrays.remove(key);
                        cStructs.remove(key);
                    }
            }
            if (arrays.size()==0){
                thread=null;
				System.out.println("StructArray : all memory release, closing...");
                return false;
            }
            return true;
        }
    }
/**
 * This is the main thread method, that simply calls the doCleanup method in
 * intervals specified by the SLEEP_TIME field in this class.  If the doCleanup
 * method returns false, this method will end causing the thread to die.
 */
    public void run(){
        while(doCleanup())    
            try{thread.sleep(SLEEP_TIME);}catch(Exception ii){}
    }
}
