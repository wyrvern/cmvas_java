//------------------------------------------------------------------;
//
//------------------------------------------------------------------;

import javax.swing.*;
import javax.swing.event.*;
import java.awt.*;
import java.awt.event.*;
import java.lang.*;
import java.util.*;


//------------------------------------------------------------------;
//
//------------------------------------------------------------------;

public class Foo {

	public static void main(String[] args) {

        try {
            UIManager.setLookAndFeel(
                UIManager.getCrossPlatformLookAndFeelClassName());
        } catch (Exception e) {}

	    JFrame f = new JFrame("This is a test");
	    f.setSize(400, 150);
	    Container content = f.getContentPane();
	    content.setBackground(Color.white);
	    content.setLayout(new FlowLayout()); 
	    content.add(new JButton("Button 1"));
	    content.add(new JButton("Button 2"));
	    content.add(new JButton("Button 3"));
	    f.setVisible(true);
       
    }
}
