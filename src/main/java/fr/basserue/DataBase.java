package fr.basserue;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class DataBase {

    static String url = "jdbc:mysql://127.0.0.1:3306/ap2_gsb ?useUnicode=true"
                + "&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&" 
                + "serverTimezone=UTC";
    static String utilisateur = "root";
    static String motDePasse = "Simon59300sql";
    static Connection connexion = null;
    static String login;
    static String motdepasse;
    static ResultSet rs =null;

    public static void selectBDD() {

        try {
            connexion = DriverManager.getConnection(url, utilisateur, motDePasse);
            String sql = "SELECT ag_nom, ag_password FROM agents where ag_nom LIKE " 
            + login + " and ag_password like " + motdepasse
            + ";";
            PreparedStatement statement = connexion.prepareStatement(sql);
            rs = statement.executeQuery(sql);
       } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println(ex.getMessage());

        }
    }
    public static void InsertBDD() {
        try {
            connexion = DriverManager.getConnection(url, utilisateur, motDePasse);
            String sql = "INSERT INTO agents ( ag_matricule, ag_nom_utilisateur, ag_password, fk_se, fk_ta,fk_ve) "
            +"VALUE( ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connexion.prepareStatement(sql);
            statement.setInt(1, 6);
            statement.setString(2, "lucas");
            statement.setString(3, "lucas");
            statement.setInt(4, 2);
            statement.setInt(5, 1);
            statement.setString(6, "AZ8BESE");

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("A new user was inserted successfully!");
            }
    
        }catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println(ex.getMessage());
        }
    }
    }
    public static void UpdateBDD(){
        try {
            connexion = DriverManager.getConnection(url, utilisateur, motDePasse);
            String sql = "UPDATE agents SET AG_matricule=? ,AG_nom=? ,AG_password=?";
            PreparedStatement statement = connexion.prepareStatement(sql);


            statement.setString(1, "1234567891");
            statement.setString(2, "William Henry Bill Gates");
            statement.setString(3, "bill.gates@microsoft.com");

            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("An existing user was updated successfully!");

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println(ex.getMessage());
        }
    }
}
