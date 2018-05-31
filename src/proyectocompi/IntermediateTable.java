/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectocompi;

import java.util.ArrayList;

/**
 *
 * @author Christian
 */
public class IntermediateTable {
    ArrayList<RowIntermediate> list = new ArrayList();
    int contador = 1;
    
    public IntermediateTable() {
    }

    public ArrayList<RowIntermediate> getList() {
        return list;
    }

    public void setList(ArrayList<RowIntermediate> list) {
        this.list = list;
    }
    
    public String tempNuevo(){
        String temp = "t"+contador;
        contador++;
        return temp;
    }
    
}
