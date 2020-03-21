package ezo.shop.controller;

import java.io.PrintWriter;
import java.io.IOException;

public class WriteFile {
    public static void main(String[] args) {// throws IOException {
        PrintWriter output = new PrintWriter("c:/example.md");
        for (int i = 1; i < 11; i++) {
            String data = i + " 번째 줄입니다.";
            output.println(data);
        }
        output.close();
    }
}