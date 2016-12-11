//------------------------------------------------------------------;
//
//------------------------------------------------------------------;

package org.digip;

import java.io.*;
import java.net.*;
import java.util.*;
import javax.swing.*;  

//------------------------------------------------------------------;
//
//------------------------------------------------------------------;

public class c_main {

    public static void main(String[] args) {

        JFrame frame = new JFrame("c_main");

        final JLabel label = new JLabel("Hello World");
        frame.getContentPane().add(label);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.pack();
        frame.setVisible(true);
    }
}
