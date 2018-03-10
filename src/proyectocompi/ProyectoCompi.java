/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectocompi;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.UnsupportedEncodingException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Scanner;
import java_cup.runtime.*;

/**
 *
 * @author Usuario
 */
public class ProyectoCompi {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws FileNotFoundException, UnsupportedEncodingException {
        // TODO code application logic here
        Scanner rd = new Scanner(System.in);
        System.out.println("1. Generar");
        System.out.println("2. Ejecutar");
        int opcion = rd.nextInt();
        
        if (opcion == 1) {
            generateLexer();
            generateParser();
            moveFile("AnalizadorSintactico.java");
            moveFile("sym.java");
        } else if (opcion == 2) {
            runParser();
        }
        
      
    }

    public static int sum(){
        return 1;
    }
    public static void generateLexer() {
        String[] params = new String[3];
        params[0] = "-d";
        params[1] = "src/proyectocompi";
        params[2] = "src/proyectocompi/Lexer.flex";

        try {
            jflex.Main.generate(params);
            System.out.println("Se genero lexer");
        } catch (Exception e) {
        }
    }

    public static void generateParser() {
        String[] params2 = new String[3];
        params2[0] = "-parser";
        params2[1] = "AnalizadorSintactico";
        params2[2] = "src/proyectocompi/Asintactico.cup";

        try {
            java_cup.Main.main(params2);
            System.out.println("Se genero el Parser");
        } catch (Exception e) {
        }
    }
    
    public static boolean moveFile(String archNombre) {
        boolean efectuado = false;
        File arch = new File(archNombre);
        if (arch.exists()) {
            System.out.println("\n*** Moviendo " + arch + " \n***");
            Path currentRelativePath = Paths.get("");
            String nuevoDir = currentRelativePath.toAbsolutePath().toString()
                    + File.separator + "src" + File.separator
                    + "proyectocompi" + File.separator + arch.getName();
            File archViejo = new File(nuevoDir);
            archViejo.delete();
            if (arch.renameTo(new File(nuevoDir))) {
                System.out.println("\n*** Generado " + archNombre + "***\n");
                efectuado = true;
            } else {
                System.out.println("\n*** No movido " + archNombre + " ***\n");
            }
        } else {
            System.out.println("\n*** Codigo no existente ***\n");
        }
        return efectuado;
    }

    public static void runParser() throws FileNotFoundException {
        Lexer lexer = new Lexer(new FileReader("test.txt"));
        AnalizadorSintactico parser = new AnalizadorSintactico(lexer);

        try {
            Object result = parser.parse().value;
            System.out.println("Parseado correctamente");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
