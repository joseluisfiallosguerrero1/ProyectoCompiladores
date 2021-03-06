/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectocompi;

import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public class SymbolTable {
    String ambit = "";
    ArrayList<Row> list = new ArrayList();
    int blockID = 0;
    
    public SymbolTable() {
    }
    
    public SymbolTable(String word){
        this.ambit = word;
    }

    public ArrayList<Row> getList() {
        return list;
    }

    public void setList(ArrayList<Row> list) {
        this.list = list;
    }
    
    public boolean existId(String id){
        for (int i = 0; i < list.size(); i++) {
            if(list.get(i).id.equals(id)){
                return true;
            }
        }
        return false;
    }
    
    public Row getRowById(String id){
        for (int i = 0; i < list.size(); i++) {
           if(list.get(i).id.equals(id)){
               return list.get(i);
           }
        }
        return new Row("null", "null");
    }
    
    public String toString(){
        return "ID: " + blockID + ", " +ambit + " : " + list.toString();
    }
}
