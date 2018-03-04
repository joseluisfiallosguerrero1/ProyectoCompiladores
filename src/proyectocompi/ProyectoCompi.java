/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectocompi;


import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.UnsupportedEncodingException;

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
//        String[] params = new String[3];
//        params[0] = "-d";
//        params[1] = "src/proyectocompi";
//        params[2] = "src/proyectocompi/Lexer.flex";
//
//        try {
//            jflex.Main.generate(params);
//            System.out.println("Se genero");
//        } catch (Exception e) {
//        }

        FileReader reader = new FileReader("test.txt");
        Lexer lexer = new Lexer(reader);

        try {
            while(!lexer.zzAtEOF){
                lexer.yylex();
            }
        } catch (Exception e) {
        }
    }

}
