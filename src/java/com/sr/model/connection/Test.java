/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sr.model.connection;

import java.sql.SQLException;

/**
 *
 * @author Lorencius
 */
public class Test {

    /**
     * @param args the command line arguments
     * @throws java.sql.SQLException
     */
    public static void main(String[] args) throws SQLException{
        DatabaseConnection.getConnection();
    }
    
}
