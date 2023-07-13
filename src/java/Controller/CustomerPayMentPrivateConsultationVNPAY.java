/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.vnpay.common.Config;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hoang
 */
@WebServlet(name = "CustomerPayMentPrivateConsultationVNPAY", urlPatterns = {"/CustomerPayMentPrivateConsultationVNPAY"})
public class CustomerPayMentPrivateConsultationVNPAY extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    
    // Retrieve request parameters
    String orderType = request.getParameter("ordertype");
    long amount = Integer.parseInt(request.getParameter("amount"));
    String bankCode = request.getParameter("bankCode");
    
    // Set VNPay parameters
    Map<String, String> vnp_Params = new HashMap<>();
    vnp_Params.put("vnp_Version", "2.1.0");
    vnp_Params.put("vnp_Command", "pay");
    vnp_Params.put("vnp_TmnCode", Config.vnp_TmnCode);
    vnp_Params.put("vnp_Amount", String.valueOf(amount));
    vnp_Params.put("vnp_CurrCode", "VND");
    
    if (bankCode != null && !bankCode.isEmpty()) {
        vnp_Params.put("vnp_BankCode", bankCode);
    }
    
    String vnp_TxnRef = Config.getRandomNumber(8);
    vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
    vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang: " + vnp_TxnRef);
    vnp_Params.put("vnp_OrderType", "other");
    
    String locate = request.getParameter("language");
    if (locate != null && !locate.isEmpty()) {
        vnp_Params.put("vnp_Locale", locate);
    } else {
        vnp_Params.put("vnp_Locale", "vn");
    }
    
    vnp_Params.put("vnp_ReturnUrl", Config.vnp_Returnurl);
    vnp_Params.put("vnp_IpAddr", Config.getIpAddress(request));
    
    Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
    SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
    String vnp_CreateDate = formatter.format(cld.getTime());
    vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
    
    cld.add(Calendar.MINUTE, 15);
    String vnp_ExpireDate = formatter.format(cld.getTime());
    vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);
    
    // Generate hash data and query
    List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
    Collections.sort(fieldNames);
    StringBuilder hashData = new StringBuilder();
    StringBuilder query = new StringBuilder();
    
    for (String fieldName : fieldNames) {
        String fieldValue = vnp_Params.get(fieldName);
        if (fieldValue != null && fieldValue.length() > 0) {
            // Build hash data
            hashData.append(fieldName).append('=');
            hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
            
            // Build query
            query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
            query.append('=');
            query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
            
            if (fieldNames.indexOf(fieldName) < fieldNames.size() - 1) {
                query.append('&');
                hashData.append('&');
            }
        }
    }
    
    // Append Secure Hash
    String vnp_SecureHash = Config.hmacSHA512(Config.vnp_HashSecret, hashData.toString());
    query.append("&vnp_SecureHash=").append(vnp_SecureHash);
    
    String queryUrl = query.toString();
    String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
    
    // Prepare JSON response
    JsonObject job = new JsonObject();
    job.addProperty("code", "00");
    job.addProperty("message", "success");
    job.addProperty("data", paymentUrl);
    
    Gson gson = new Gson();
    response.getWriter().write(gson.toJson(job));
}
}