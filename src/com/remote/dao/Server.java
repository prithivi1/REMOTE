package com.remote.dao;

import java.io.IOException; 
import java.net.ServerSocket;

public class Server {
	public static void main(String[] args) {
	    try(ServerSocket serverSocket = new ServerSocket(6666)){
	        while (true){
	            new Echoer(serverSocket.accept()).start();
            }
        } catch (IOException e) {
            System.out.println("server exception "+e.getMessage());
            e.printStackTrace();
        }
	}
}
