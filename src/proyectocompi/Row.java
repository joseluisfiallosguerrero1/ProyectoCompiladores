/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectocompi;

/**
 *
 * @author Usuario
 */
public class Row {
    String id;
    String type;
    int offset = 0;
    boolean isParameter = false;
    
    public Row() {
    }

    public Row(String id, String type) {
        this.id = id;
        this.type = type;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return  "{id: " + id + ", type: " + type + ", offset: " + offset+"}" + '\n';
    }
    
    
}
