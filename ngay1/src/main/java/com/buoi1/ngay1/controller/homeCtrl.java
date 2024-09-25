package com.buoi1.ngay1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class homeCtrl {
    @GetMapping("/home")
    public String hienThi() {
        return "index";
    }
}
