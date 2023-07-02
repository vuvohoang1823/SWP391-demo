/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtils.DBUtils;
import entity.Course;
import entity.Trainer;
import entity.TrainerSP;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author hoang
 */
public class TrainerDAO implements Serializable {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();

    /*GET ALL PRODUCT*/
    public List<TrainerSP> getTrainerUnavailable() throws ClassNotFoundException, SQLException, IOException {
        List<TrainerSP> list = new ArrayList<>();
        String sql = "select * from tbl_trainer where status ='available'";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
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
                TrainerSP trainer = new TrainerSP(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), base64Image, rs.getString(6), rs.getInt(7));
                list.add(trainer);
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        return list;
    }

    public TrainerSP getTrainerInfo(int user_id) throws SQLException, NamingException, ClassNotFoundException {

//        (String trainer_id, String user_id, String fullname, String achievement, String status, String contact)
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        TrainerSP trainer = null;
        try {
            con = DBUtils.getConnection();

            if (con != null) {
                String sql = "Select trainer_id, user_id, fullname, achievement, status, contact "
                        + "From tbl_trainer "
                        + "Where user_id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, user_id);
                rs = stm.executeQuery();
                if (rs.next()) {
//                    int trainer_id = rs.getInt("trainer_id");
//                    String fullname = rs.getString("fullname");
//                    String achievement = rs.getString("achievement");
//                    String status = rs.getString("status");
//                    String contact = rs.getString("contact");
                    trainer = new TrainerSP(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), null, rs.getString(5), rs.getInt(6));
                    System.out.println(trainer);
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
        return trainer;
    }

    public int getTrainerIID(int user_id) throws SQLException, NamingException, ClassNotFoundException {

//        (String trainer_id, String user_id, String fullname, String achievement, String status, String contact)
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int trainerID = 0;
        try {
            con = DBUtils.getConnection();

            if (con != null) {
                String sql = "Select trainer_id, user_id, fullname, achievement, status, contact "
                        + "From tbl_trainer "
                        + "Where user_id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, user_id);
                rs = stm.executeQuery();
                if (rs.next()) {
//                    int trainer_id = rs.getInt("trainer_id");
//                    String fullname = rs.getString("fullname");
//                    String achievement = rs.getString("achievement");
//                    String status = rs.getString("status");
//                    String contact = rs.getString("contact");
                    trainerID = rs.getInt("trainer_id");
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
        return trainerID;
    }

    public Trainer getTrainerByID(String trainer_id) throws SQLException, NamingException, ClassNotFoundException {

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Trainer trainer = null;
        try {
            con = DBUtils.getConnection();

            if (con != null) {
                String sql = "SELECT T.trainer_id, T.user_id, T.fullname, T.achievement, T.img, T.status, T.contact,\n"
                        + "                     STRING_AGG(K.skill_id, ',') AS skill_ids,\n"
                        + "                      STRING_AGG(S.name, ',') AS skill_names\n"
                        + "                FROM tbl_trainer AS T\n"
                        + "               JOIN tbl_skillTrainer AS K ON T.trainer_id = K.trainer_id\n"
                        + "               JOIN tbl_skill AS S ON S.skill_id = K.skill_id\n"
                        + "			   where T.trainer_id = ?\n"
                        + "             GROUP BY T.trainer_id, T.user_id, T.fullname, T.achievement, T.img, T.status, T.contact";
                stm = con.prepareStatement(sql);
                stm.setString(1, trainer_id);
                rs = stm.executeQuery();
                if (rs.next()) {
//                    
                    trainer = new Trainer(rs.getInt(1),
                            rs.getInt(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getString(6),
                            rs.getInt(7),
                            rs.getString(8),
                            rs.getString(9)
                    );
                    System.out.println(trainer);
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
        return trainer;
    }

    public List<Trainer> getTrainerUnavailableWithfullSkill() throws ClassNotFoundException, SQLException, IOException {
        List<Trainer> list = new ArrayList<>();
//        String sql = "			   Select T.trainer_id, T.user_id, T.fullname, T.achievement, T.img,T.status, T.contact ,K.skill_id ,S.name\n"
//                + "                        from tbl_trainer  as T\n"
//                + "                        Join tbl_skillTrainer as K ON T.trainer_id = K.trainer_id\n"
//                + "                        Join tbl_skill as S ON s.skill_id = K.skill_id\n"
//                + "						where T.status = 'available'";

        String sql = "SELECT T.trainer_id, T.user_id, T.fullname, T.achievement, T.img, T.status, T.contact,\n"
                + "       STRING_AGG(K.skill_id, ',') AS skill_ids,\n"
                + "       STRING_AGG(S.name, ',') AS skill_names\n"
                + "FROM tbl_trainer AS T\n"
                + "JOIN tbl_skillTrainer AS K ON T.trainer_id = K.trainer_id\n"
                + "JOIN tbl_skill AS S ON S.skill_id = K.skill_id\n"
                + "WHERE T.status = 'available'\n"
                + "GROUP BY T.trainer_id, T.user_id, T.fullname, T.achievement, T.img, T.status, T.contact;";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
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
                Trainer trainer = new Trainer(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        base64Image,
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9)
                );
                list.add(trainer);
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        return list;
    }

    public List<Trainer> getTrainerLIST() throws ClassNotFoundException, SQLException, IOException {
        List<Trainer> list = new ArrayList<>();
//        String sql = "			   Select T.trainer_id, T.user_id, T.fullname, T.achievement, T.img,T.status, T.contact ,K.skill_id ,S.name\n"
//                + "                        from tbl_trainer  as T\n"
//                + "                        Join tbl_skillTrainer as K ON T.trainer_id = K.trainer_id\n"
//                + "                        Join tbl_skill as S ON s.skill_id = K.skill_id\n"
//                + "						where T.status = 'available'";

        String sql = "SELECT T.trainer_id, T.user_id, T.fullname, T.achievement, T.img, T.status, T.contact,\n"
                + "                       STRING_AGG(K.skill_id, ',') AS skill_ids,\n"
                + "                       STRING_AGG(S.name, ',') AS skill_names\n"
                + "               FROM tbl_trainer AS T\n"
                + "                JOIN tbl_skillTrainer AS K ON T.trainer_id = K.trainer_id\n"
                + "                JOIN tbl_skill AS S ON S.skill_id = K.skill_id\n"
                + "                GROUP BY T.trainer_id, T.user_id, T.fullname, T.achievement, T.img, T.status, T.contact";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
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
                Trainer trainer = new Trainer(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        base64Image,
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9)
                );
                list.add(trainer);
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        return list;
    }

    public void setTrainerUnavailable(int trainer_id) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "Update tbl_trainer Set status='unavailable' "
                + "Where trainer_id = ?";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, trainer_id);
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

    public void setTrainerAvailable(int trainer_id) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "Update tbl_trainer Set status='available' "
                + "Where trainer_id = ?";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, trainer_id);
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

    public String getTrainerNameByRequestTrainerId(String requesttrainerid) {

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String fullname = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "  select a.Request_trainer_id ,t.fullName from tbl_appointment as a \n"
                        + "  join tbl_trainer as t ON a.Request_trainer_id = t.trainer_id\n"
                        + " where a.Request_trainer_id = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, requesttrainerid);
                rs = ps.executeQuery();
                if (rs.next()) {
                    fullname = rs.getString("fullName");
                }
                if (rs.wasNull()) {
                    fullname = "N/A";
                }

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return fullname;

    }
    public void setWorkshopComplete(String trainer_id) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "UPDATE a\n" +
                    "SET a.status = 'Complete'\n" +
                    "FROM tbl_attendance AS a\n" +
                    "JOIN tbl_workshopTraining AS t ON a.workshop_id = t.workshop_id\n" +
                    "JOIN tbl_course AS c ON c.course_id = t.course_id\n" +
                    "JOIN tbl_courseImg AS i ON c.course_id = i.course_id\n" +
                    "WHERE c.trainer_id = ?\n" +
                    "AND a.status = 'In progress';";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, trainer_id);
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
