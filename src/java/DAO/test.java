/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

/**
 *
 * @author vuvoh
 */
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class test {
    public static void main(String[] args) {
        List<Double> revenueData = getRevenueData();
        System.out.println(revenueData);
    }

    public static List<Double> getRevenueData() {
        List<Double> revenueData = new ArrayList<>();

        // Generate random revenue data for the last 6 months
        Random random = new Random();
        for (int i = 0; i < 6; i++) {
            double revenue = random.nextDouble() * 10000; // Generate random revenue between 0 and 10000
            revenueData.add(revenue);
        }

        return revenueData;
    }
}

