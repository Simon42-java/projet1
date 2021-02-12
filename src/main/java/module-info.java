module fr.basserue {
    requires javafx.controls;
    requires javafx.fxml;

    opens fr.basserue to javafx.fxml;
    exports fr.basserue;
}