package com.calc;

import javax.swing.*;
import javax.swing.event.*;
import java.awt.*;
import java.awt.event.*;
import java.lang.*;
import java.util.*;



/**
 * The primary user-interface for our simple calculator application.
 * The UI consists of a JLabel "display" and a panel of JButtons
 * which allow the user to enter numbers and perform basic arithmetic
 * operations.
 * 
 * @author sstorkel@devious.com
 */
public class CalcPanel
	extends JPanel
	implements ActionListener, Observer
{
	/**
	 * The CalcModel associated with this particular instance of
	 * the calculator GUI.
	 */
    private CalcModel model;
    
    /**
     * The JLabel which serves as the "display" for this calculator.
     */
    private JLabel display = new JLabel("0");

    /**
     * Constructor for CalcPanel.
     * 
     * @param model    the CalcModel to be used by this calculator
     */
    public CalcPanel(CalcModel model)
    {
        super();
        this.model = model;
        model.addObserver(this);
    }
    
    /**
     * Creates a button for the calculator's button panel
     * and intializes the appropriate event handlers
     * 
     * @param label     the text label for the new button.
     */
    protected JButton addButton(String label)
    {
        JButton b = new JButton(label);
        b.addActionListener(this);
        return b;
    }
    
    /**
     * Creates the panel which contains the calculator's buttons
     */
    protected JPanel createButtonPanel()
    {
        JPanel panel = new JPanel();
        panel.setLayout(new GridLayout(0, 4));   
        
        panel.add(addButton("1"));
        panel.add(addButton("2"));
        panel.add(addButton("3"));
        panel.add(addButton("+"));
        
        panel.add(addButton("4"));
        panel.add(addButton("5"));
        panel.add(addButton("6"));
        panel.add(addButton("-"));
        
        panel.add(addButton("7"));
        panel.add(addButton("8"));
        panel.add(addButton("9"));
        panel.add(addButton("*"));
        
        panel.add(addButton("C"));
        panel.add(addButton("0"));
        panel.add(addButton("="));
        panel.add(addButton("/"));
        
        return panel;
    }
    
    /**
     * Used to initialize the controls contained inside the CalcPanel
     */
    public void init()
    {
        this.setLayout(new BorderLayout());
       
        display.setVerticalTextPosition(JLabel.CENTER);
        display.setHorizontalTextPosition(JLabel.RIGHT);
        display.setVerticalAlignment(JLabel.TOP);
        display.setHorizontalAlignment(JLabel.TRAILING);
        display.setBorder(BorderFactory.createLineBorder(Color.black));
        
        this.add(display, BorderLayout.NORTH);
        this.add(createButtonPanel(), BorderLayout.CENTER);
    }
    
    /**
     * Event-handler used to repond to mouse clicks on the calculator's
     * buttons
     * 
     * @param evt       the event being processed
     */
    public void actionPerformed(ActionEvent evt)
    {
        System.out.println(evt.paramString());
        try {
            switch (evt.getActionCommand().charAt(0)) {
            case '+':
                model.setOperation(CalcModel.OP_ADD);
                break;
       
            case '-':
                model.setOperation(CalcModel.OP_SUB);
                break;
                
            case '*':
                model.setOperation(CalcModel.OP_MUL);
                break;
                
            case '/':
                model.setOperation(CalcModel.OP_DIV);
                break;
                
            case '=':
                model.calculate();
                break;
                
            case 'C':
                model.clear();
                break;
                
            default:
                model.addDigit(evt.getActionCommand());
                break;
            }
        } catch (NumberFormatException ex) {}
    }
    
    /**
     * Update the calculator's display JLabel when the model
     * indicates that the display has changed
     * 
     * @param o       the Observable object which has changed
     * @param arg     argument passed to the <code>notifyObservers</code>
     *                 method
     */
    public void update(Observable o, Object arg)
    {
        display.setText(model.getValue());
    }
    
}
