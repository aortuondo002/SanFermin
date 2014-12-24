package praktika;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class DBKudeatzailea {

	Connection conn = null;

	private void conOpen() {
		try {
			String userName = "root";
			String password = "1234";
			String url = "jdbc:mysql://localhost/SanFermin";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = (Connection) DriverManager.getConnection(url, userName,
					password);
			System.out.println("Database connection established");
		} catch (Exception e) {
			System.err.println("Cannot connect to database server");
		}
	}

	private ResultSet query(Statement s, String query) {

		ResultSet rs = null;

		try {
			s.executeQuery(query);
			rs = s.getResultSet();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return rs;
	}

	// singleton patroia
	private static DBKudeatzailea instantzia = new DBKudeatzailea();

	private DBKudeatzailea() {
		this.conOpen();
	}

	public static DBKudeatzailea getInstantzia() {
		return instantzia;
	}
	public ResultSet execSQL(String query) {
		int count = 0;  Statement s = null; ResultSet rs = null;
		try {
			s = (Statement) conn.createStatement();
			if (query.toLowerCase().indexOf("select") == 0) {
				// select agindu bat
				rs = this.query(s, query);				
			} else {
				// update, delete, create agindu bat
				count = s.executeUpdate(query);
				System.out.println(count + " rows affected");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs; 
                       } }