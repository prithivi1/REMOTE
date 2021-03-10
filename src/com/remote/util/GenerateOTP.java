package com.remote.util;
import java.util.*;

public class GenerateOTP {
	public static void main(String[] args)
    {
        int length = 6;
        System.out.println(Password(length));
    }

    public static String Password(int len)
    {

        String numbers = "0123456789";
        String values = numbers;

        Random rndm_method = new Random();

        char[] password = new char[len];
        for (int i = 0; i < len; i++)
        {
            password[i] = values.charAt(rndm_method.nextInt(values.length()));
        }
        return  new String(password);
    }
}
