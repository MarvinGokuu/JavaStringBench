@echo off
set PATH_TO_FX="C:\Users\theca\Downloads\javafx-sdk-23\lib"
javac --module-path %PATH_TO_FX% --add-modules javafx.controls,javafx.fxml,javafx.graphics CamaraCuaterniones3D.java
java --module-path %PATH_TO_FX% --add-modules javafx.controls,javafx.fxml,javafx.graphics CamaraCuaterniones3D
pause
