package fr.basserue;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

class BDD {
    
    public static void main(String[] args) throws SQLException {
        /* Connexion à la base de données */
        String url = "jdbc:mysql://127.0.0.1:3306/ap2_gsb2";
        String utilisateur = "root";
        String motDePasse = "Simon59300sql";
        Connection connexion = null;
        

        try {
            connexion = DriverManager.getConnection(url, utilisateur, motDePasse);
            String sql = "INSERT INTO agents ( ag_nom, ag_password, fk_se, fk_ta,fk_ve) "
            +"VALUE( ?, ?, ?, ?, ?)";
            PreparedStatement statement = connexion.prepareStatement(sql);
            statement.setString(1, "lucas");
            statement.setString(2, "lucas");
            statement.setInt(3, 2);
            statement.setInt(4, 1);
            statement.setString(5, "AZ8BESE");

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
