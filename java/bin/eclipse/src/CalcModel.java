package com.calc;

import java.util.Observable;



/**
 * The CalcModel class serves as the "mechanics" behind our
 * calculator. It handles "presses" of the calculators "buttons",
 * performs calculators, and keeps the "display" up-to-date.
 * The CalcModel extends Observable and will notify subscribers
 * whenever the calculators display should change.
 * 
 * @author sstorkel@devious.com
 */
public class CalcModel extends Observable
{
	/**
	 * No operation in progress
	 */
    public static final int OP_NONE = 0;
    
    /**
     * Addition operation
     */
    public static final int OP_ADD  = 1;
    
    /**
     * Subtration operation
     */
    public static final int OP_SUB  = 2;
    
    /**
     * Multiplication operation
     */
    public static final int OP_MUL  = 3;
    
    /**
     * Dividion operation
     */
    public static final int OP_DIV  = 4;
    
    
    //-------------------------------------------------------------

	/**
	 * The pendingOp represents the operation that the user
	 * is currently entering. Should be one of the OP_* constants
	 */    
    private int pendingOp = 0;
    
    /**
     * The value previously entered by the user. Effectively, this
     * is the number the user entered before pressing one of the
     * operation (+,-,*,/) keys
     */
    private int previousValue = 0;
    
    /**
     * The number the user is currently in the process of entering
     */
    private int currentValue = 0;
    
   //-------------------------------------------------------------
   
   	/**
   	 * Returns a string representing the number the calculator
   	 * should currently display.
   	 * 
   	 * @return the String the calculator should display
   	 */
    public String getValue()
    {
        return Integer.toString(currentValue);
    }
    
    /**
     * Use this method to indicate when one of the calculator's numeric
     * "keys" has been pressed.
     * 
     * @param s     a String representing the key wich was
     *               pressed (e.g. "0");
     */
    public void addDigit(String s)
    {
        char c = s.charAt(0);
        String val = getValue() + c;
        setDisplay(Integer.parseInt(val));
    }
    
    /**
     * Use this method to indicate when one of the calculator's numeric
     * "keys" has been pressed.
     * 
     * @param c     a char representing the key wich was
     *               pressed (e.g. '0');
     */
    public void addDigit(char c)
    {
    	String val = getValue() + c;
    	setDisplay(Integer.parseInt(val));
    }
    
    /**
     * Use this method to indicate when one of the calculator's
     * operational keys have been pressed. If there is a pending
     * operation, the calculation will be performed and the
     * calculator's display will be updated.
     * 
     * @param op     one of the OP_* constants indicating which
     *                operation key was pressed
     */
    public void setOperation(int op)
    {
        // handle case where user enters multiple operations
        // without intervening '=' (e.g 1 + 1 + 1)
        if (pendingOp != OP_NONE)
            calculate();
            
        previousValue = currentValue;
        this.pendingOp = op;
        currentValue = 0;
    }
    
    /**
     * Changes the calculator's display and notifies any observers
     * of the change.
     * 
     * @param value    the new value to be displayed by the calculator
     */
    public void setDisplay(int value)
    {
        currentValue = value;
        
        setChanged();
        notifyObservers();
    }
    
    /**
     * This method can be used to "clear" the calculator. Any pending
     * operations and numeric entries are discarded. The calculator's
     * display is updated appropriately.
     */
    public void clear()
    {
        this.pendingOp = OP_NONE;
        previousValue = 0;
        setDisplay(0);   
    }
    
    /** 
     * This method is used to process a pending calculation (e.g.
     * because the equals key was pressed.
     */
    public void calculate()
    {
        switch (pendingOp)
        {
        case OP_ADD:
            setDisplay(previousValue + currentValue);
            break;
        case OP_SUB:
            setDisplay(previousValue - currentValue);
            break;
        case OP_MUL:
            setDisplay(previousValue * currentValue);
            break;
        case OP_DIV:
            setDisplay(previousValue / currentValue);
            break;
        }  
        pendingOp = OP_NONE;
        previousValue = 0;
    }
}
