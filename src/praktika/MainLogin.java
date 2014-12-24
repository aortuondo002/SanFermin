package praktika;

import java.awt.EventQueue;

import javax.swing.JFrame;

import java.sql.*;
import java.awt.GridLayout;
import java.awt.BorderLayout;
import java.awt.Window;

import praktika.JOptionPaneERROR_MESSAGE;

import javax.swing.JOptionPane;
import javax.swing.JTextPane;
import javax.swing.JTextField;
import javax.swing.JButton;

import praktika.DBKudeatzailea;

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

import javax.swing.JPasswordField;

import com.mysql.jdbc.ResultSet;

public class MainLogin {

	private JFrame frame;
	private JTextField textField;
	private JPasswordField passwordField;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					MainLogin window = new MainLogin();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public MainLogin() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 450, 300);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		JTextPane txtpnErabiltzailea = new JTextPane();
		txtpnErabiltzailea.setText("Erabiltzailea");
		txtpnErabiltzailea.setBounds(25, 54, 63, 20);
		frame.getContentPane().add(txtpnErabiltzailea);
		
		JTextPane txtpnPasahitza = new JTextPane();
		txtpnPasahitza.setText("Pasahitza");
		txtpnPasahitza.setBounds(25, 101, 63, 20);
		frame.getContentPane().add(txtpnPasahitza);
		
		textField = new JTextField();
		textField.setBounds(124, 54, 86, 20);
		frame.getContentPane().add(textField);
		textField.setColumns(10);
		
		JButton btnKautotu = new JButton("Kautotu");
		btnKautotu.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				DBKudeatzailea dbk = DBKudeatzailea.getInstantzia();
				String erabiltzailea=textField.getText();
				ResultSet pass = (ResultSet) dbk.execSQL("Select pasahitza from erabiltzailea WHERE Erabiltzailea='"+erabiltzailea+"'");
				
				
				JOptionPaneERROR_MESSAGE b=new JOptionPaneERROR_MESSAGE(); 
				JOptionPaneSartu a= new JOptionPaneSartu();
				if (passwordField.getPassword().length == 0
					|| textField.getText().length() == 0) {
				b.main(null);
			}else if (!passwordField.equals(pass)){
					b.main(null);
				}else{
					a.main(null);
				}
					
			}
		});
		btnKautotu.setBounds(283, 51, 89, 23);
		frame.getContentPane().add(btnKautotu);
		
		JButton btnPahaitzaAldatu = new JButton("Pasahitza Aldatu");
		btnPahaitzaAldatu.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
			}
		});
		btnPahaitzaAldatu.setBounds(259, 98, 113, 23);
		frame.getContentPane().add(btnPahaitzaAldatu);
		
		JButton btnAtzera = new JButton("Atzera");
		btnAtzera.setBounds(164, 171, 89, 23);
		frame.getContentPane().add(btnAtzera);
		
		passwordField = new JPasswordField();
		passwordField.setBounds(124, 101, 86, 20);
		frame.getContentPane().add(passwordField);
	}
}
