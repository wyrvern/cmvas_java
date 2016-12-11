package com.calc;

import javax.swing.*;
import javax.swing.event.*;
import java.awt.event.KeyEvent;



/**
 * The "driver" program for our simple Swing-based calculator.
 * 
 * @author sstorkel@devious.com
 */
public class Calculator
{

    public static void main(String[] args)
    {
        try {
            UIManager.setLookAndFeel(
                UIManager.getCrossPlatformLookAndFeelClassName());
        } catch (Exception e) {}
        
        JFrame calcFrame = new JFrame("Calculator");
        
        CalcModel model = new CalcModel();        
        CalcPanel calcPanel = new CalcPanel(model);
        calcPanel.init();
                 
        calcFrame.setContentPane(calcPanel);
        calcFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        calcFrame.pack();
        calcFrame.setVisible(true);
    }
}
