package ezo.shop.controller;

import java.io.PrintWriter;

public class WriteFile {
    public static void main(String[] args) {
        
        try (PrintWriter output = new PrintWriter("c:/example.md")) {
            for (int i = 1; i < 11; i++) {
                String data = i + " ��° ���Դϴ�.";
                output.println(data);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("�����");
    }
}