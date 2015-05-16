/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sr.model.connection;

import java.sql.Connection;
import java.sql.SQLException;
import oracle.jdbc.pool.OracleDataSource;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Lorencius
 */

public class DatabaseConnection {
//    ClassPathXmlApplicationContext ctx;
    @Autowired
    static OracleDataSource dataSource;
    
    public DatabaseConnection() throws SQLException {
//        ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
//            dataSource = new OracleDataSource();
//            dataSource.setURL("jdbc:oracle:thin:@localhost:1521:xe");
//            dataSource.setUser("mhs125314085");
//            dataSource.setPassword("mhs125314085");
    }

//    public void setOracleDataSource(OracleDataSource oracleDataSource){
//        this.dataSource = oracleDataSource;
//    }
    
    public static OracleDataSource getmDataSource() {
        return dataSource;
    }

    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }
}
