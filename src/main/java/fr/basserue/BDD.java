package fr.basserue;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;

class BDD {
    public class PleaseProvideControllerClassName {

        @FXML
        private CheckBox visiteur;
    
        @FXML
        private CheckBox comptable;
    
        @FXML
        private TextField login;
    
        @FXML
        private PasswordField motdepasse;
    
        @FXML
        private Button bt_authentifier;
    
        @FXML
        private Button bt_annuler;


        @FXML
        void identifier(ActionEvent event) {
            System.out.println(login.getText());
             }

        @FXML
        void annuler(ActionEvent event) {
            System.out.println(login.getText());
         }
    public void main(String[] args) throws SQLException {
        
        /* Connexion à la base de données */
        String url = "jdbc:mysql://127.0.0.1:3306/ap2_gsb2 ?useUnicode=true"
        +"&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&"
        +"serverTimezone=UTC";
        String utilisateur = "root";
        String motDePasse = "Simon59300sql";
        Connection connexion = null;

        try {
            connexion = DriverManager.getConnection(url, utilisateur, motDePasse);
            String sql = "SELECT * FROM agents where ag_nom LIKE " + login + " and ag_password like " + motdepasse + ";";
            PreparedStatement statement = connexion.prepareStatement(sql);
            /*statement.setString(1, "lucas");
            statement.setString(2, "lucas");
            statement.setInt(3, 2);
            statement.setInt(4, 1);
            statement.setString(5, "AZ8BESE");

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("A new user was inserted successfully!");
            }
    
        }*/}catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println(ex.getMessage());
      
        }
        
        }
    }
}

