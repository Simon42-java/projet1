package fr.basserue;

import javafx.stage.Stage;
import java.util.Scanner;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;


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

        public void power(){
            Scanner scb = new Scanner(System.in);
            boolean bouton = scb.nextBoolean();
            if(bouton){
                DataBase.selectBDD();
            }
        }

        /*public void btauthentification(ActionEvent event) {    
            DataBase.selectBDD();
         }

        public void annuler(ActionEvent event) {
            Stage stage = (Stage) bt_annuler.getScene().getWindow();
            stage.close();
        }*/

    }
}

