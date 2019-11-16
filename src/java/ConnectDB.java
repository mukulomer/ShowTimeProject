
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Nitesh Kr
 */
public class ConnectDB {



public static Connection getConnectDB() throws ClassNotFoundException, SQLException, InstantiationException, InstantiationException, InstantiationException, IllegalAccessException
{
 Driver driver=(Driver)Class.forName("com.mysql.jdbc.Driver").newInstance();
 DriverManager.registerDriver(driver);
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/showtime","root", "");
 return con;
}
public static void closeConnectionDB(Connection con)
{
    try {
        con.close();
    } catch (SQLException ex) {
        Logger.getLogger(ConnectDB.class.getName()).log(Level.SEVERE, null, ex);
    }
}
}
