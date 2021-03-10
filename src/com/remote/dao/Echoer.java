package com.remote.dao;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.net.Socket;

import com.remote.model.ChatModel;

public class Echoer extends Thread{
	private Socket socket;

    public Echoer(Socket socket) {
        this.socket = socket;
    }

    @Override
    public void run() {
        try{
        	ObjectOutputStream out = new ObjectOutputStream(socket.getOutputStream());
        	ObjectInputStream in = new ObjectInputStream(new BufferedInputStream(socket.getInputStream()));
        	ChatModel model = (ChatModel) in.readObject();
            System.out.println("client message--> "+model.getMessage());
        	ChatDAO.saveMessage(model.getEmail(), model.getUsername(), model.getMessage());
            socket.close(); 
        }catch (IOException | ClassNotFoundException e){
            System.out.println("oops "+e.getMessage());
        }finally 
        {
            try {
                socket.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
