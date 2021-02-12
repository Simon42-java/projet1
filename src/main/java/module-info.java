module fr.basserue {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;
    requires mysql.connector.java;

    opens fr.basserue to javafx.fxml;
    exports fr.basserue;
}