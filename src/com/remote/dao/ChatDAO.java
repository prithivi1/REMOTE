package com.remote.dao;

import com.remote.model.*;  
import com.remote.util.DBConnection;

import java.util.*;
import java.io.*;
import java.net.Socket;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

public class ChatDAO {
	public static void clientSide(ChatModel model) {
        try (Socket socket = new Socket("localhost",6666)){
        	System.out.println("client connected");
        	ObjectOutputStream os = new ObjectOutputStream(new BufferedOutputStream(socket.getOutputStream()));
        	ObjectInputStream is = new ObjectInputStream(new BufferedInputStream(socket.getInputStream()));
        	os.writeObject(model);
        	os.flush();
        	System.out.println("client side message sent");
        } catch (Exception e) {
            System.out.println("client error :"+e.getMessage());
        }
    }
	
	public static void saveMessage(String email,String username,String mes){
		int result=0;
		try{
			Connection con = DBConnection.getConnection();
			String query = "insert into chat values(?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, username);
			ps.setString(3, mes);
			result = ps.executeUpdate();
			System.out.println("message saved");
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
	
	public static List<ChatModel> getAllMessages()
	{
		List<ChatModel> messages = new ArrayList<ChatModel>();
		try{
			Connection con= DBConnection.getConnection();
			String query = "select * from chat";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				ChatModel model = new ChatModel();
				model.setEmail(rs.getString("email"));
				model.setUsername(rs.getString("username"));
				model.setMessage(rs.getString("message"));
				messages.add(model);
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
		return messages;
	}
}

