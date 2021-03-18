package fr.basserue.bdd;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

class BDD {
    
    public static void main(String[] args) throws SQLException {
        /* Connexion à la base de données */
        String url = "jdbc:mysql://127.0.0.1:3306/ap2_gsb ?useUnicode=true"
                    + "&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&" 
                    + "serverTimezone=UTC";
        String utilisateur = "root";
        String motDePasse = "Simon59300sql";
        Connection connexion = null;
        

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
