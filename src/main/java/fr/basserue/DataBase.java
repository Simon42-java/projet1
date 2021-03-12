package fr.basserue;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class DataBase {

    static String url = "jdbc:mysql://127.0.0.1:3306/ap2_gsb2 ?useUnicode=true"
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
}
