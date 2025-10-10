package com.Items;

import java.io.File;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/insertItem")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class insertItem extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Define the directory where uploaded files will be saved
    private static final String UPLOAD_DIRECTORY = "images";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String itemName = request.getParameter("itemName");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        
        // Retrieve image part
        Part filePart = request.getPart("itemImage");
        String fileName = extractFileName(filePart);

        // Define the upload path where the image will be saved
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);

        // Create the directory if it does not exist and handle potential errors
        if (!uploadDir.exists()) {
            if (!uploadDir.mkdirs()) {
                throw new ServletException("Unable to create upload directory at: " + uploadPath);
            }
        }

        // Save the file to the server
        String filePath = uploadPath + File.separator + fileName;
        try {
            filePart.write(filePath);
        } catch (IOException e) {
            throw new ServletException("File upload failed. Could not write the file to disk.", e);
        }

        // Store the relative path in the database
        String relativePath = fileName;
        boolean isTrue = ItemsDBUtil.insertItem(itemName, description, relativePath, price);
        
        // Handle the response
        if (isTrue) {
            System.out.println("Image Path Saved: " + relativePath);
            response.sendRedirect(request.getContextPath() + "/AdminViewServlet");
        } else {
            RequestDispatcher dis = request.getRequestDispatcher("Unsuccess.jsp");
            dis.forward(request, response);
        }
    }

    // Utility method to extract the file name from the Content-Disposition header
    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf('=') + 2, item.length() - 1);
            }
        }
        return "";
    }
}
