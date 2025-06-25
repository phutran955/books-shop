/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.ProductDAO;
import model.ProductDTO;
import model.CategoryDTO;
import model.CategoryDAO;
import utils.AuthUtils;

/**
 *
 * @author trang
 */
@WebServlet(name = "ProductController", urlPatterns = {"/ProductController"})
public class ProductController extends HttpServlet {

    ProductDAO pdao = new ProductDAO();
   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "";
        try {
            String action = request.getParameter("action");
            if (action.equals("addProduct")) {
                url = handleProductAdding(request, response);
            } else if (action.equals("searchProduct")) {
                url = handleProductSearching(request, response);

            } else if (action.equals("changeProductStatus")) {
                url = handleProductStatusChanging(request, response);
            } else if (action.equals("editProduct")) {
                url = handleProductEditing(request, response);
            } else if (action.equals("updateProduct")) {
                url = handleProductUpdating(request, response);
                
            } else if (action.equals("viewProduct")) {
                url =handleViewProduct(request, response);
            }
        } catch (Exception e) {
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }
    
    private String handleViewProduct (HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        ProductDTO oneP =pdao.getProductByID(id);
        request.setAttribute("p", oneP);
        return "productDetail.jsp";
    }

    private String handleProductSearching(HttpServletRequest request, HttpServletResponse response) {
        String keyword = request.getParameter("keyword");
        List<ProductDTO> list = pdao.getActiveProductsByName(keyword);
        request.setAttribute("list", list);
        request.setAttribute("keyword", keyword);
        return "productEdit.jsp";
    }

    private String handleProductStatusChanging(HttpServletRequest request, HttpServletResponse response) {
        String productId = request.getParameter("productId");
        if (AuthUtils.isAdmin(request)) {
            pdao.updateStatus(productId, false);
        }
        return handleProductSearching(request, response);
    }

    private String handleProductEditing(HttpServletRequest request, HttpServletResponse response) {
        String productId = request.getParameter("productId");
        String keyword = request.getParameter("keyword");
        if (AuthUtils.isAdmin(request)) {
            ProductDTO product = pdao.getProductByID(productId);
            if (product != null) {
                request.setAttribute("keyword", keyword);
                request.setAttribute("product", product);
                request.setAttribute("isEdit", true);
                return "productForm.jsp";
            }
        }
        return handleProductSearching(request, response);
    }

    private String handleProductUpdating(HttpServletRequest request, HttpServletResponse response) {
        if (AuthUtils.isAdmin(request)) {
            String checkError = "";
            String message = "";
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String image = request.getParameter("image");
            String description = request.getParameter("description");
            String price = request.getParameter("price");
            String catID = request.getParameter("catID");
            String status = request.getParameter("status");

            double price_value = -1;

            //checkPrice
            try {
                price_value = Double.parseDouble(price);
                if (price_value <= 0) {
                    checkError += "Price must be greater than zero.<br/>";
                }
            } catch (NumberFormatException e) {
                checkError += "Invalid price format. Please enter a valid number.<br/>";
            }

            boolean status_value = status != null && status.equals("true");

            if (name == null || name.trim().isEmpty()) {
                checkError += "Product name is requried.<br/>";
            }

            if (checkError.isEmpty()) {
                ProductDTO product = new ProductDTO(id, name, image, description, price_value, catID, status_value);
                if (pdao.update(product)) {
                    message = "Product updated succesfully";
                    //return to productEdit
                    return handleProductSearching(request, response);
                } else {
                    checkError += "Cannot update product <br/>";
                    request.setAttribute("product", product);
                }
            } else {
                //keep the form so that user can recheck
                ProductDTO product = new ProductDTO(id, name, image, description, price_value, catID, status_value);
                request.setAttribute("product", product);
            }

            request.setAttribute("checkError", checkError);
            request.setAttribute("message", message);
            request.setAttribute("isEdit", true);
        }
        return "productForm.jsp";
    }

    private String handleProductAdding(HttpServletRequest request, HttpServletResponse response) {
        if (AuthUtils.isAdmin(request)) {
            String checkError = "";
            String message = "";
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String image = request.getParameter("image");
            String description = request.getParameter("description");
            String price = request.getParameter("price");
            String catID = request.getParameter("catID");
            String status = request.getParameter("status");

            double price_value = -1;
            try {
                price_value = Double.parseDouble(price);
                if (price_value <= 0) {
                    checkError += "Price must be greater than zero.<br/>";
                }
            } catch (NumberFormatException e) {
                checkError += "Invalid price format. Please enter a valid number.<br/>";
            }

            boolean status_value = true;
            try {
                status_value = Boolean.parseBoolean(status);
            } catch (Exception e) {
            }

            // Kiem tra loi
            if (pdao.isProductExists(id)) {
                checkError = "Product ID already exists.<br/>";
            }

            if (checkError.isEmpty()) {
                message = "Add product successfully.";
            }

            ProductDTO product = new ProductDTO(id, name, image, description, price_value, catID, status_value);
            if (!pdao.create(product)) {
                checkError += "<br/>Can not add new product.";
            }

            request.setAttribute("product", product);
            request.setAttribute("checkError", checkError);
            request.setAttribute("message", message);
        }
        return "productForm.jsp";
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
