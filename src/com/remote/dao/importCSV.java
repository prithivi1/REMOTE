package com.remote.dao;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.sql.*;

import javax.swing.JFileChooser;

import com.remote.util.DBConnection;

public class importCSV {
	Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    String query;
    String Path;
    int batchsize = 10;
    public importCSV() {
        try {
            JFileChooser chooser = new JFileChooser();
            chooser.setCurrentDirectory(new File("."));
            chooser.setDialogTitle("choosertitle");
            chooser.setFileSelectionMode(0);
            chooser.setAcceptAllFileFilterUsed(false);
//            if (chooser.showOpenDialog((Component)null) == 0) {
//                this.Path = chooser.getSelectedFile().toString();
//            } else {
//                System.out.println("No Selection ");
//            }

            conn = DBConnection.getConnection();
            conn.setAutoCommit(false);
            query = "insert into  dashboard (Mailid,Name,week1,week2,week3,week4,avg,rank) values (?,?,?,?,?,?,?,?)";
            this.pst = this.conn.prepareStatement(this.query);
            BufferedReader lineReader = new BufferedReader(new FileReader(this.Path));
            String lineText = null;
            int count = 0;
            lineReader.readLine();

            while((lineText = lineReader.readLine()) != null) {
                String[] data = lineText.split(",");
                String Regno = data[0];
                String Name = data[1];
                String Gender = data[2];
                String Department = data[3];
                String Year = data[4];
                String Section = data[5];
                String Mode = data[6];
                String MailID = data[7];
                String Contact = data[8];
                this.pst.setString(1, Regno);
                this.pst.setString(2, Name);
                this.pst.setString(3, Gender);
                this.pst.setString(4, Department);
                this.pst.setString(5, Year);
                this.pst.setString(6, Section);
                this.pst.setString(7, Mode);
                this.pst.setString(8, MailID);
                this.pst.setString(9, Contact);
                this.pst.setString(10, Contact);
                this.pst.addBatch();
                if (count % this.batchsize == 0) {
                    this.pst.executeBatch();
                }
            }

            lineReader.close();
            this.conn.commit();
            this.conn.close();
        } catch (Exception var18) {
            var18.printStackTrace();
        }
    }
}
