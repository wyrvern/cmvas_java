/* 
 * lib.shellx.util.CStructArray
 * 
 * (C) Copyright 1995 - 1999 Microsoft Corporation.  All rights reserved.
 *
 */
package lib.shellx.util;
/**
 * This is required, as we cannot custom marshal a parameter to a J/Direct call!
 * By using com.ms.dll.DllLib.ptrToStruct(CStructArray.class, int addr) it is 
 * possible to map this object to the starting memory address for a Java array 
 * that was created using the StructArray newStructArray method.  Creation of 
 * this object should only be done by calling the StructArray.toCStructArray()
 * method.
 * 
 * This custom marshaler should be used whenever an array of structs is 
 * embedded within another structure.  When used as a field in another struct, 
 * it must have a dll.structmap directive like this:
 * 
 * **
 * * dll.structmap([customMarshal="lib.shellx.util.CStructArray", type=CUSTOM]) 
 * *
 *  public COSERVERINFO[] foo;
 * 
 * @version 1.0
 * 
 * @dll.struct()
 */
public class cStructArray { 
    /**
     * This WeakReference will contain the actual Struct array that we are 
     * sending to a J/Direct call.  By having it stored in here, we are able
     * to propogate the structs in the custom marshaler for this field, and
     * set the field to take up NO ROOM in the actual data that the C world we
     * get.
     * 
     * @dll.structmap([customMarshal="lib.shellx.util.cStructArray", type=CUSTOM])
     */
    protected com.ms.vm.WeakReference array;
    /**
     * The Java VM will read this field to determine how many bytes the custom
     * marshaled object takes up in the native C.
     */
    public static int cbByValSize = 0;
/**
 * The Java VM will call this method to marshal the structure array from
 * C back to Java.
 * 
 * @param ppStruct - This is a pointer to a memory location where the C structure 
 *          array is.
 * @param Flags - any flags that have been specified by the Java Object representing
 *          the C structure array. [Normally this is unused].
 * 
 * @return Object[] - this is a Java representation of the C structure. This
 *          value will be placed where the custom marshaled field is.
 */    
    public static Object toJava(int ppStruct, int Flags){  
        Object[] o =  (Object[])lib.shellx.util.structArray.toStructArray(ppStruct);
        if (o!=null)
            for (int i=0;i<o.length;i++)
                com.ms.dll.DllLib.propagateStructFields(o[i],true);
        return new com.ms.vm.WeakReference(o);
    }
/**
 * The Java VM will call this method to marshal the field specified with this 
 * custom marshaler to native C.  This is accomplished by propogating any Java
 * objects to native C, and setting the ppStruct value to point to a pinned 
 * struct array.
 * 
 * @param Object[] o - the struct to be marshaled to native C.
 * @param int Flags - Any flags specified in the dll.structmap declaration for the
 *          field containing the struct[] object.
 * @param int ppStruct - this is the memory location of where to write the address
 *          of the marshaled  struct array.
 */    
    public static void toExternal(Object w, int Flags, int ppStruct ) { 
        Object[] o = (Object[])((com.ms.vm.WeakReference)w).getReferent();
        if (o!=null){
            for (int i=0;i<o.length;i++)
                com.ms.dll.DllLib.propagateStructFields(o[i],false);
        }
    }
}
