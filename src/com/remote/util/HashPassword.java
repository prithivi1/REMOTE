	package com.remote.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class HashPassword {

	public static final String SALT = "my-salt-text";

	public static void main(String args[]) {
//		HashPassword hashPassword = new HashPassword();

//		// login should succeed.
//		if (demo.login("john", "dummy123"))
//			System.out.println("user login successfull.");
//
//		// login should fail because of wrong password.
//		if (demo.login("john", "blahblah"))
//			System.out.println("User login successfull.");
//		else
//			System.out.println("user login failed.");
	}

	public String signup(String password) {
		String saltedPassword = SALT + password;
		String hashedPassword = generateHash(saltedPassword);
		return hashedPassword;
	}

	public Boolean login(String userPassword,String dbPassword) {
		Boolean isAuthenticated = false;

		String saltedPassword = SALT + userPassword;
		String hashedPassword = generateHash(saltedPassword);

		if(hashedPassword.equals(dbPassword)){
			isAuthenticated = true;
		}else{
			isAuthenticated = false;
		}
		return isAuthenticated;
	}

	public static String generateHash(String input) {
		StringBuilder hash = new StringBuilder();

		try {
			MessageDigest sha = MessageDigest.getInstance("SHA-1");
			byte[] hashedBytes = sha.digest(input.getBytes());
			char[] digits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
					'a', 'b', 'c', 'd', 'e', 'f' };
			for (int idx = 0; idx < hashedBytes.length; ++idx) {
				byte b = hashedBytes[idx];
				hash.append(digits[(b & 0xf0) >> 4]);
				hash.append(digits[b & 0x0f]);
			}
		} catch (NoSuchAlgorithmException e) {
			System.out.println(e);
		}

		return hash.toString();
	}

}

