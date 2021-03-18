package fr.basserue;


import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.stage.Stage;


class Main {
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



            public void btauthentification(ActionEvent event) {    
                DataBase.selectBDD();
             }
            public void annuler(ActionEvent event) {
                Stage stage = (Stage) bt_annuler.getScene().getWindow();
                stage.close();
            }

    }
}

