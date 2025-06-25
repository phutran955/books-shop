/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DbUtils;

/**
 *
 * @author trang
 */
public class ProductDAO {

    // SQL Queries
    private static final String GET_ALL_PRODUCTS = "SELECT id, name, image, description, price, catID, status FROM tblProducts";
    private static final String GET_PRODUCT_BY_ID = "SELECT id, name, image, description, price, catID, status FROM tblProducts WHERE id = ?";
    private static final String CREATE_PRODUCT = "INSERT INTO tblProducts (id, name, image, description, price, catID, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
    private static final String UPDATE_PRODUCT = "UPDATE tblProducts SET name = ?, image=?, description = ?, price = ?, catID = ?, status = ? WHERE id = ?";
    private static final String DELETE_PRODUCT = "DELETE FROM tblProducts WHERE id = ?";

    public List<ProductDTO> getAll() {
        List<ProductDTO> products = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DbUtils.getConnection();
            ps = conn.prepareStatement(GET_ALL_PRODUCTS);
            rs = ps.executeQuery();

            while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setId(rs.getString("id"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setCatID(rs.getString("catID"));
                product.setStatus(rs.getBoolean("status"));

                products.add(product);
            }
        } catch (Exception e) {
            System.err.println("Error in getAll(): " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, ps, rs);
        }

        return products;
    }

    public List<ProductDTO> getAllActiveProducts() {
        List<ProductDTO> products = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = GET_ALL_PRODUCTS + " WHERE status=1";

        try {
            conn = DbUtils.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setId(rs.getString("id"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setCatID(rs.getString("catID"));
                product.setStatus(rs.getBoolean("status"));

                products.add(product);
            }
        } catch (Exception e) {
            System.err.println("Error in getAll(): " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, ps, rs);
        }

        return products;
    }

    public List<ProductDTO> getProductsByCatID(String catID) {
        List<ProductDTO> products = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = GET_ALL_PRODUCTS + " WHERE catID like ? and status=1";

        try {
            conn = DbUtils.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, catID);
            rs = ps.executeQuery();

            while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setId(rs.getString("id"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setCatID(rs.getString("catID"));
                product.setStatus(rs.getBoolean("status"));

                products.add(product);
            }
        } catch (Exception e) {
            System.err.println("Error in getAll(): " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, ps, rs);
        }

        return products;
    }

    public ProductDTO getProductByID(String id) {
        ProductDTO product = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DbUtils.getConnection();
            ps = conn.prepareStatement(GET_PRODUCT_BY_ID);
            ps.setString(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                product = new ProductDTO();
                product.setId(rs.getString("id"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setCatID(rs.getString("catID"));
                product.setStatus(rs.getBoolean("status"));
            }
        } catch (Exception e) {
            System.err.println("Error in getProductByID(): " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, ps, rs);
        }

        return product;
    }

    public List<ProductDTO> getActiveProductsByName(String name) {
        List<ProductDTO> products = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = GET_ALL_PRODUCTS + " WHERE name like ? and status=1";

        try {
            conn = DbUtils.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setId(rs.getString("id"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setCatID(rs.getString("catID"));
                product.setStatus(rs.getBoolean("status"));

                products.add(product);
            }
        } catch (Exception e) {
            System.err.println("Error in getProductsByStatus(): " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, ps, rs);
        }

        return products;
    }

    public List<ProductDTO> getProductsByStatus(boolean status) {
        List<ProductDTO> products = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = GET_ALL_PRODUCTS + " WHERE status = ?";

        try {
            conn = DbUtils.getConnection();
            ps = conn.prepareStatement(query);
            ps.setBoolean(1, status);
            rs = ps.executeQuery();

            while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setId(rs.getString("id"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setCatID(rs.getString("catID"));
                product.setStatus(rs.getBoolean("status"));

                products.add(product);
            }
        } catch (Exception e) {
            System.err.println("Error in getProductsByStatus(): " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, ps, rs);
        }

        return products;
    }

    /*
    public List<ProductDTO> getProductsByName(String name) {
        List<ProductDTO> products = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = GET_ALL_PRODUCTS + " WHERE name like ?";

        try {
            conn = DbUtils.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setId(rs.getString("id"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setCatID(rs.getString("catID"));
                product.setStatus(rs.getBoolean("status"));

                products.add(product);
            }
        } catch (Exception e) {
            System.err.println("Error in getProductsByStatus(): " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, ps, rs);
        }

        return products;
    }
     */

 /*functions*/
    public boolean create(ProductDTO product) {
        boolean success = false;
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DbUtils.getConnection();
            ps = conn.prepareStatement(CREATE_PRODUCT);

            ps.setString(1, product.getId());
            ps.setString(2, product.getName());
            ps.setString(3, product.getImage());
            ps.setString(4, product.getDescription());
            ps.setDouble(5, product.getPrice());
            ps.setString(6, product.getCatID());
            ps.setBoolean(7, product.isStatus());

            int rowsAffected = ps.executeUpdate();
            success = (rowsAffected > 0);

        } catch (Exception e) {
            System.err.println("Error in create(): " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, ps, null);
        }

        return success;
    }

    public boolean update(ProductDTO product) {
        boolean success = false;
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DbUtils.getConnection();
            ps = conn.prepareStatement(UPDATE_PRODUCT);

            ps.setString(1, product.getName());
            ps.setString(2, product.getImage());
            ps.setString(3, product.getDescription());
            ps.setDouble(4, product.getPrice());
            ps.setString(5, product.getCatID());
            ps.setBoolean(6, product.isStatus());
            ps.setString(7, product.getId()); // WHERE condition

            int rowsAffected = ps.executeUpdate();
            success = (rowsAffected > 0);

        } catch (Exception e) {
            System.err.println("Error in update(): " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, ps, null);
        }

        return success;
    }

    public boolean delete(String id) {
        boolean success = false;
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DbUtils.getConnection();
            ps = conn.prepareStatement(DELETE_PRODUCT);
            ps.setString(1, id);

            int rowsAffected = ps.executeUpdate();
            success = (rowsAffected > 0);

        } catch (Exception e) {
            System.err.println("Error in delete(): " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, ps, null);
        }

        return success;
    }

    private void closeResources(Connection conn, PreparedStatement ps, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            System.err.println("Error closing resources: " + e.getMessage());
            e.printStackTrace();
        }
    }

    /*check*/
    public boolean isProductExists(String id) {
        return getProductByID(id) != null;
    }

    public boolean updateStatus(String productId, boolean status) {
        ProductDTO product = getProductByID(productId);
        if (product != null) {
            product.setStatus(status);
            return update(product);
        }
        return false;
    }

}
