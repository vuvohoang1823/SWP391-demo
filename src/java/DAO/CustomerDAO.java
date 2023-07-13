/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import entity.CustomerDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import DBUtils.DBUtils;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.Base64;
import static java.util.Base64.getDecoder;

/**
 *
 * @author hoang
 */
public class CustomerDAO implements Serializable {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();

    public CustomerDTO getCustomerInfo(int user_id) throws SQLException, NamingException, ClassNotFoundException {

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        CustomerDTO customer = null;
        try {
            con = DBUtils.getConnection();

            if (con != null) {
                String sql = "Select customer_id, user_id, fullname, contact "
                        + "From tbl_customer "
                        + "Where user_id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, user_id);
                rs = stm.executeQuery();
                if (rs.next()) {
                    int customer_id = rs.getInt("user_id");
                    String fullName = rs.getString("fullname");
                    String contact = rs.getString("contact");
                    customer = new CustomerDTO(customer_id, user_id, fullName, contact);
                    System.out.println(customer);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return customer;
    }

    public int getCustomerID(int user_id) throws SQLException, NamingException, ClassNotFoundException {

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        CustomerDTO customer = null;
        int customerID = 0;
        try {
            con = DBUtils.getConnection();

            if (con != null) {
                String sql = "Select customer_id, user_id, fullname, contact "
                        + "From tbl_customer "
                        + "Where user_id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, user_id);
                rs = stm.executeQuery();
                if (rs.next()) {
                    customerID = rs.getInt("customer_id");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return customerID;
    }

    public CustomerDTO getCustomerInfoByCustomerID(int user_id) throws SQLException, NamingException, ClassNotFoundException {

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        CustomerDTO customer = null;
        try {
            con = DBUtils.getConnection();

            if (con != null) {
                String sql = "Select customer_id, user_id, fullname, contact "
                        + "From tbl_customer "
                        + "Where customer_id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, user_id);
                rs = stm.executeQuery();
                if (rs.next()) {
                    int customer_id = rs.getInt("user_id");
                    String fullName = rs.getString("fullname");
                    String contact = rs.getString("contact");
                    customer = new CustomerDTO(customer_id, user_id, fullName, contact);
                    System.out.println(customer);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return customer;
    }

    public CustomerDTO getCustomerInformation(int user_id) throws SQLException, NamingException, ClassNotFoundException, IOException {

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        CustomerDTO customer = null;
        try {
            con = DBUtils.getConnection();

            if (con != null) {
                String sql = "Select customer_id, c.user_id, fullname, contact, img, u.password, u.username\n"
                        + "     From tbl_customer c \n"
                        + "	JOIN tbl_user u ON u.user_id = c.user_id\n"
                        + "     Where customer_id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, user_id);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String base64Image = null;
                    Blob blob = rs.getBlob("img");
                    if (blob != null) {
                        InputStream inputStream = blob.getBinaryStream();
                        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                        byte[] buffer = new byte[4096];
                        int bytesRead = -1;
                        while ((bytesRead = inputStream.read(buffer)) != -1) {
                            outputStream.write(buffer, 0, bytesRead);
                        }
                        byte[] imageBytes = outputStream.toByteArray();
                        base64Image = Base64.getEncoder().encodeToString(imageBytes);
                        inputStream.close();
                        outputStream.close();
                    } else {
                        base64Image = "default";
                    }
                    customer = new CustomerDTO(
                            rs.getInt(1),
                            rs.getInt(2),
                            rs.getString(3),
                            rs.getString(4),
                            base64Image,
                            rs.getString(6),
                            rs.getString(7)
                    );
                }
//                if (rs.next()) {
//                    int customer_id = rs.getInt("user_id");
//                    String fullName = rs.getString("fullname");
//                    String contact = rs.getString("contact");
//                    customer = new CustomerDTO(customer_id, user_id, fullName, contact);
//                    System.out.println(customer);
//                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return customer;
    }

    public boolean updateCustomerProfile(String customer_image, String fullname, String contact, int customer_id) {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            con = DBUtils.getConnection();
            String sql = "UPDATE c\n"
                    + "SET c.fullname = ? ,\n"
                    + "    c.contact = ? ,\n"
                    + "    c.img = ? \n"
                    + "FROM tbl_customer c\n"
                    + "JOIN tbl_user u ON u.user_id = c.user_id\n"
                    + "WHERE c.customer_id = ? ;";

            stm = con.prepareStatement(sql);

            stm.setString(1, fullname);
            stm.setString(2, contact);
            stm.setBytes(3, Base64.getDecoder().decode(customer_image));
            stm.setInt(4, customer_id);

            int effectRows = stm.executeUpdate();

            if (effectRows >= 0) {
                result = true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return result;
    }

    public boolean updateUserProfile(String username, String password, int customer_id) {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            con = DBUtils.getConnection();

            String sql = "UPDATE u\n"
                    + "SET u.password = ? ,\n"
                    + "    u.username = ? \n"
                    + "FROM tbl_user u\n"
                    + "JOIN tbl_customer c ON u.user_id = c.user_id\n"
                    + "WHERE c.customer_id = ? ;";

            stm = con.prepareStatement(sql);
            stm.setString(1, password);
            stm.setString(2, username);
            stm.setInt(3, customer_id);

            int effectRows = stm.executeUpdate();

            if (effectRows >= 0) {
                result = true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return result;
    }

    public void addNewCustomer(int customer_id, int user_id, String fullname, String contact)
            throws ClassNotFoundException, SQLException, IOException {
        String sql = "insert into tbl_customer(customer_id, user_id , fullname, contact, img)\n"
                + "values(?,?,?,?,NULL) ";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, customer_id);
            ps.setInt(2, user_id);
            ps.setString(3, fullname);
            ps.setString(4, contact);
            ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public int generateCustomerID() throws ClassNotFoundException, SQLException, IOException {
        String sql = "SELECT * FROM tbl_customer WHERE customer_id = (SELECT MAX(TRY_CAST(customer_id AS INT))FROM tbl_customer)";
        int newID = 0;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                int MAXconsultationID = rs.getInt("customer_id");
                newID = MAXconsultationID + 1;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return newID;
    }

    public void deleteCustomer(int user_id) throws SQLException {
        String sql = "DELETE FROM tbl_customer WHERE user_id = ?;";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

}
