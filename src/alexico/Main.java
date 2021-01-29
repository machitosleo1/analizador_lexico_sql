/*
* To change this template, choose Tools | Templates
* and open the template in the editor. 
*/

package alexico;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 * @author gabinopc
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        String ruta1="E:/UNA2019/COMPILADORES/alexico/src/alexico/lexico.flex";
        String ruta2="E:/UNA2019/COMPILADORES/alexico/src/alexico/lexicoCup.flex";
        String[] rutaS ={"-parser", "Sintac", "E:/UNA2019/COMPILADORES/alexico/src/alexico/sintactico.cup"};
        generar(ruta1, ruta2, rutaS);
    }
    public static void generar(String ruta1, String ruta2, String[] rutaS) throws IOException, Exception {
        File archivo;
        archivo=new File(ruta1);
        jflex.Main.generate(archivo);
        archivo=new File(ruta2);
        jflex.Main.generate(archivo);
        java_cup.Main.main(rutaS);
        
        Path rutaSym = Paths.get("E:/UNA2019/COMPILADORES/alexico/src/alexico/sym.java");
        if(Files.exists(rutaSym))
            Files.delete(rutaSym);        
        Files.move(Paths.get("E:/UNA2019/COMPILADORES/alexico/sym.java"), 
                Paths.get("E:/UNA2019/COMPILADORES/alexico/src/alexico/sym.java"));

        Path rutaSin = Paths.get("E:/UNA2019/COMPILADORES/alexico/src/alexico/Sintac.java");
        if(Files.exists(rutaSin))
            Files.delete(rutaSin);        
        Files.move(Paths.get("E:/UNA2019/COMPILADORES/alexico/Sintac.java"), 
                Paths.get("E:/UNA2019/COMPILADORES/alexico/src/alexico/Sintac.java"));       
    }
}
