/****************************************************************/
/*                      c	                            */
/*                                                              */
/****************************************************************/
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
/**
 * Summary description for c
 *
 */
public class c extends JFrame
{
	// Variables declaration
	private JButton jButton1;
	private JButton jButton2;
	private JButton jButton3;
	private JButton jButton4;
	private JButton jButton5;
	private JButton jButton6;
	private JButton jButton7;
	private JButton jButton8;
	private JButton jButton9;
	private JButton jButton10;
	private JPanel contentPane;
	// End of variables declaration


	public c()
	{
		super();
		initializeComponent();
		//
		// TODO: Add any constructor code after initializeComponent call
		//

		this.setVisible(true);
	}

	/**
	 * This method is called from within the constructor to initialize the form.
	 * WARNING: Do NOT modify this code. The content of this method is always regenerated
	 * by the Windows Form Designer. Otherwise, retrieving disign might not work properly.
	 */
	private void initializeComponent()
	{
		jButton1 = new JButton();
		jButton2 = new JButton();
		jButton3 = new JButton();
		jButton4 = new JButton();
		jButton5 = new JButton();
		jButton6 = new JButton();
		jButton7 = new JButton();
		jButton8 = new JButton();
		jButton9 = new JButton();
		jButton10 = new JButton();
		contentPane = (JPanel)this.getContentPane();

		//
		// jButton1
		//
		jButton1.setText("jButton1");
		jButton1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e)
			{
				jButton1_actionPerformed(e);
			}

		});
		//
		// jButton2
		//
		jButton2.setText("jButton2");
		jButton2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e)
			{
				jButton2_actionPerformed(e);
			}

		});
		//
		// jButton3
		//
		jButton3.setText("jButton3");
		jButton3.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e)
			{
				jButton3_actionPerformed(e);
			}

		});
		//
		// jButton4
		//
		jButton4.setText("jButton4");
		jButton4.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e)
			{
				jButton4_actionPerformed(e);
			}

		});
		//
		// jButton5
		//
		jButton5.setText("jButton5");
		jButton5.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e)
			{
				jButton5_actionPerformed(e);
			}

		});
		//
		// jButton6
		//
		jButton6.setText("jButton6");
		jButton6.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e)
			{
				jButton6_actionPerformed(e);
			}

		});
		//
		// jButton7
		//
		jButton7.setText("jButton7");
		jButton7.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e)
			{
				jButton7_actionPerformed(e);
			}

		});
		//
		// jButton8
		//
		jButton8.setText("jButton8");
		jButton8.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e)
			{
				jButton8_actionPerformed(e);
			}

		});
		//
		// jButton9
		//
		jButton9.setText("jButton9");
		jButton9.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e)
			{
				jButton9_actionPerformed(e);
			}

		});
		//
		// jButton10
		//
		jButton10.setText("jButton10");
		jButton10.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e)
			{
				jButton10_actionPerformed(e);
			}

		});
		//
		// contentPane
		//
		contentPane.setLayout(null);
		addComponent(contentPane, jButton1, 11,14,83,28);
		addComponent(contentPane, jButton2, 16,48,83,28);
		addComponent(contentPane, jButton3, 55,99,83,28);
		addComponent(contentPane, jButton4, 214,17,83,28);
		addComponent(contentPane, jButton5, 223,54,83,28);
		addComponent(contentPane, jButton6, 207,99,83,28);
		addComponent(contentPane, jButton7, 161,45,83,28);
		addComponent(contentPane, jButton8, 158,195,83,28);
		addComponent(contentPane, jButton9, 55,162,83,28);
		addComponent(contentPane, jButton10, 263,157,83,28);
		//
		// c
		//
		this.setTitle("c - extends JFrame");
		this.setLocation(new Point(0, 0));
		this.setSize(new Dimension(385, 276));
	}

	/** Add Component Without a Layout Manager (Absolute Positioning) */
	private void addComponent(Container container,Component c,int x,int y,int width,int height)
	{
		c.setBounds(x,y,width,height);
		container.add(c);
	}

	//
	// TODO: Add any appropriate code in the following Event Handling Methods
	//
	private void jButton1_actionPerformed(ActionEvent e)
	{
		System.out.println("jButton1_actionPerformed(ActionEvent e) called.");
		// TODO: Add any handling code here

	}

	private void jButton2_actionPerformed(ActionEvent e)
	{
		System.out.println("jButton2_actionPerformed(ActionEvent e) called.");
		// TODO: Add any handling code here

	}

	private void jButton3_actionPerformed(ActionEvent e)
	{
		System.out.println("jButton3_actionPerformed(ActionEvent e) called.");
		// TODO: Add any handling code here

	}

	private void jButton4_actionPerformed(ActionEvent e)
	{
		System.out.println("jButton4_actionPerformed(ActionEvent e) called.");
		// TODO: Add any handling code here

	}

	private void jButton5_actionPerformed(ActionEvent e)
	{
		System.out.println("jButton5_actionPerformed(ActionEvent e) called.");
		// TODO: Add any handling code here

	}

	private void jButton6_actionPerformed(ActionEvent e)
	{
		System.out.println("jButton6_actionPerformed(ActionEvent e) called.");
		// TODO: Add any handling code here

	}

	private void jButton7_actionPerformed(ActionEvent e)
	{
		System.out.println("jButton7_actionPerformed(ActionEvent e) called.");
		// TODO: Add any handling code here

	}

	private void jButton8_actionPerformed(ActionEvent e)
	{
		System.out.println("jButton8_actionPerformed(ActionEvent e) called.");
		// TODO: Add any handling code here

	}

	private void jButton9_actionPerformed(ActionEvent e)
	{
		System.out.println("jButton9_actionPerformed(ActionEvent e) called.");
		// TODO: Add any handling code here

	}

	private void jButton10_actionPerformed(ActionEvent e)
	{
		System.out.println("jButton10_actionPerformed(ActionEvent e) called.");
		// TODO: Add any handling code here

	}

	//
	// TODO: Add any method code to meet your needs in the following area
	//






























 

//============================= Testing ================================//
//=                                                                    =//
//= The following main method is just for testing this class you built.=//
//= After testing,you may simply delete it.                            =//
//======================================================================//
	public static void main(String[] args)
	{
		JFrame.setDefaultLookAndFeelDecorated(true);
		JDialog.setDefaultLookAndFeelDecorated(true);
		try
		{
			UIManager.setLookAndFeel("com.sun.java.swing.plaf.windows.WindowsLookAndFeel");
		}
		catch (Exception ex)
		{
			System.out.println("Failed loading L&F: ");
			System.out.println(ex);
		}
		new c();
	}
//= End of Testing =


}
