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
    Object value;
    TreeNode parent;
    int nivel;
    ArrayList<TreeNode> hijos = new ArrayList();

    public TreeNode() {
    }

    public TreeNode(Object value, TreeNode Parent) {
        this.value = value;
        this.parent = Parent;
        if (Parent != null) {
            this.nivel = this.parent.nivel + 1;
        } else {
            this.nivel = 0;
        }
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
    
    public void mostrar(ArrayList gen) {
        ArrayList general = new ArrayList();
        TreeNode nodo = new TreeNode("a", null);
        TreeNode nodo2 = new TreeNode("b", nodo);
        TreeNode nodo3 = new TreeNode("c", nodo);
        TreeNode nodo4 = new TreeNode("d", nodo2);
        TreeNode nodo5 = new TreeNode("e", nodo2);
        TreeNode nodo6 = new TreeNode("f", nodo3);
        TreeNode nodo7 = new TreeNode("g", nodo3);

        MyTree miarbol = new MyTree(nodo);

        general.add(nodo);
        general.add(nodo2);
        general.add(nodo3);
        general.add(nodo4);
        general.add(nodo5);
        general.add(nodo6);
        general.add(nodo7);
        // metodo mostrar ....................
        int maximo = 0;
        for (Object object : gen) {
            if (((TreeNode) object).nivel > maximo) {
                maximo = ((TreeNode) object).nivel;
            }
        }
        System.out.println("maximo" + maximo);
        int espacios = 75;
        for (int i = 0; i <= maximo; i++) {
            System.out.println("paapaaaaaaa");
            System.out.println("Nivel " + i);
            for (int j = 0; j < espacios; j++) {
                System.out.print(" ");
            }
            for (Object object : gen) {
                if (((TreeNode) object).nivel == i) {
                    if (((TreeNode) object).nivel != 0) {
                        System.out.print("Padre = " + ((TreeNode) object).parent.toString() + " valor = " + ((TreeNode) object).toString() + "               ");
                    } else {
                        System.out.println(" valor = " + ((TreeNode) object).toString());
                    }
                }

            }
            System.out.println("");
            espacios = espacios - 10;
        }
    }

    @Override
    public String toString() {
        return (String) value;
    }
}
