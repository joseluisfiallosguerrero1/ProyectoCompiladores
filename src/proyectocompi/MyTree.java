/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectocompi;

import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.DefaultTreeModel;
import javax.swing.tree.TreeModel;

/**
 *
 * @author josef
 */
public class MyTree {

    TreeNode root;
    Tree tree;

    public MyTree() {
        this.tree = new Tree();
    }

    public MyTree(TreeNode root) {
        this.root = root;
        this.tree = new Tree();
    }

    public void showTree(TreeNode parent, TreeNode node, DefaultTreeModel model, DefaultMutableTreeNode treeNode) {
        if (parent == null) {
            model = new DefaultTreeModel(new DefaultMutableTreeNode(node.getValue()));
            showTree(node, node.getLefterSon(),model,(DefaultMutableTreeNode)model.getRoot());
        } else {
            DefaultMutableTreeNode hijo = new DefaultMutableTreeNode(node.getValue());
            treeNode.add(hijo);
            if (node.hasRightBrother()) {
                showTree(parent, node.getRightBrother(),model,treeNode);
            }
            
            if(node.hijos.size()>0){
                showTree(node,node.getLefterSon(),model, hijo);
            }
        }
        this.tree.jTree1.setModel(model);
    }
}
