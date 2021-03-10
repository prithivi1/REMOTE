package com.remote.control;

import com.remote.util.*;
import java.sql.*;
import java.io.*; 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class uploadcsv
 */
@WebServlet("/uploadcsv")
public class uploadcsv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uploadcsv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String contentType = request.getContentType();
		if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) 
		{
			DataInputStream in = new DataInputStream(request.getInputStream());
			int formDataLength = request.getContentLength();
			System.out.println(formDataLength);
			byte dataBytes[] = new byte[formDataLength];
			int byteRead = 0;
			int totalBytesRead = 0;
			
			while (totalBytesRead < formDataLength) 
			{
				byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
				totalBytesRead += byteRead;
			}
			
			String file = new String(dataBytes);
			String saveFile = file.substring(file.indexOf("filename=\"") + 10);
			System.out.println("saveFile=" + saveFile);
			saveFile = saveFile.substring(saveFile.lastIndexOf("\\")+ 1,saveFile.indexOf("\""));
			System.out.println("saveFile" + saveFile);
			saveFile = file.substring(file.indexOf("filename=\"") + 10);
			saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
			saveFile = saveFile.substring(saveFile.lastIndexOf("\\")+ 1,saveFile.indexOf("\""));
			int lastIndex = contentType.lastIndexOf("=");
			String boundary = contentType.substring(lastIndex + 1,contentType.length());
			int pos;
			
			pos = file.indexOf("filename=\"");
			pos = file.indexOf("\n", pos) + 1;
			pos = file.indexOf("\n", pos) + 1;
			pos = file.indexOf("\n", pos) + 1;
			int boundaryLocation = file.indexOf(boundary, pos) - 4;
			int startPos = ((file.substring(0, pos)).getBytes()).length;
			int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
			
			FileOutputStream fileOut = new FileOutputStream(saveFile);
			fileOut.write(dataBytes, startPos, (endPos - startPos));
			
			
			Connection con=DBConnection.getConnection();
			Statement pst=null;
			String line = null;
			String value=null;
			try{
				Statement st = con.createStatement();
				int az = st.executeUpdate("truncate dashboard");
				StringBuilder contents = new StringBuilder();
				BufferedReader input = new BufferedReader(new FileReader(saveFile));
				while (( line = input.readLine()) != null)
				{
					String[] a = line.split(",");
					PreparedStatement ps = con.prepareStatement("insert into dashboard(`Mailid`, `Name`, `week1`, `week2`, `week3`, `week4`, `avg`, `rank`) values(?,?,?,?,?,?,?,?)");
					ps.setString(1,a[0]);
					ps.setString(2,a[1]);
					ps.setInt(3,Integer.parseInt(a[2]));
					ps.setInt(4,Integer.parseInt(a[3]));
					ps.setInt(5,Integer.parseInt(a[4]));
					ps.setInt(6,Integer.parseInt(a[5]));
					ps.setInt(7,Integer.parseInt(a[6]));
					ps.setInt(8,Integer.parseInt(a[7]));
					int data = ps.executeUpdate();
				}
				response.sendRedirect("admin_home.jsp");
			}
			catch(Exception e)
			{
				System.out.println(e.getMessage());		
			}
		}
	}

}
