/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectocompi;

import java.util.ArrayList;

/**
 *
 * @author josef
 */
public class TreeNode {
    boolean visited = false;
    Object value;
    int line = 0;
    int column = 0;
    TreeNode parent;
    int nivel;
    int tableID = 0;
    String tag = "";
    String verdadera = "",falsa = "",siguiente = "",primero = "";
    ArrayList<TreeNode> hijos = new ArrayList();
    
    public TreeNode() {
        
    }
    public TreeNode(Object value, TreeNode Parent) {
        this.value = value;
        this.parent = Parent;
        this.line = 0;
        this.column = 0;
        if (Parent != null) {
            this.nivel = this.parent.nivel + 1;
        } else {
            this.nivel = 0;
        }
    }
    public TreeNode(Object value, TreeNode Parent,int line,int column) {
        this.value = value;
        this.parent = Parent;
        this.line = line;
        this.column = column;
        if (Parent != null) {
            this.nivel = this.parent.nivel + 1;
        } else {
            this.nivel = 0;
        }
    }

    public int getLine() {
        return line;
    }

    public void setLine(int line) {
        this.line = line;
    }

    public int getColumn() {
        return column;
    }

    public void setColumn(int column) {
        this.column = column;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }
    
    public Object getValue() {
        return value;
    }

    public TreeNode getParent() {
        return parent;
    }

    public ArrayList<TreeNode> getHijos() {
        return hijos;
    }

    public void setValue(Object value) {
        this.value = value;
    }

    public void setParent(TreeNode parent) {
        this.parent = parent;
    }

    public void addSon(TreeNode son) {
        this.hijos.add(son);
    }

    public TreeNode getLefterSon() {
        return this.getHijos().get(0);
    }

    public boolean isParent() {
        boolean retorno;
        if (this.getHijos().size() > 0) {
            retorno = true;
        } else {
            retorno = false;
        }

        return retorno;
    }

    public int getMyPoistion(){
        for(int i = 0; i < this.parent.hijos.size(); i++){
            if(this.equals(this.parent.hijos.get(i))){
                return i;
            }
        }
        return -1;
    }
    
    public boolean hasRightBrother(){
        int position = this.getMyPoistion();
        
        if(position == -1 || position == this.parent.hijos.size()-1){
            return false;
        }
        
        return true;
    }
    
    public TreeNode getRightBrother(){
        if(this.hasRightBrother()){
            return this.parent.hijos.get(this.getMyPoistion()+1);
        }
        return new TreeNode();
    }

    public boolean containValueInSon(String value){
        for (int i = 0; i < this.hijos.size(); i++) {
            if(this.hijos.get(i).value.toString().equals(value)){
                return true;
            }
        }
        return false;
    }
    
    @Override
    public String toString() {
        return (String) value;
    }
}
