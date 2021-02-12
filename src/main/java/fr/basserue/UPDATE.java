package fr.basserue;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


class UPDATE {


    public static void main(String[] args) throws SQLException {
        /* Connexion à la base de données */
        String url = "jdbc:mysql://127.0.0.1:3306/ap2_gsb2";
        String utilisateur = "root";
        String motDePasse = "Simon59300sql";
        Connection connexion = null;
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
