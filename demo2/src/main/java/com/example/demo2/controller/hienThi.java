package com.example.demo2.controller;

import com.example.demo2.NguoiDung;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.ArrayList;

@Controller
public class hienThi {
    ArrayList<NguoiDung> list = new ArrayList<>();

    public hienThi() {
        list.add(new NguoiDung(1, "Nghĩa"));
        list.add(new NguoiDung(2, "Nghĩa1"));
    }

    @GetMapping("/hien-thi")
    public String ht() {
        return "index";
    }

    @GetMapping("/danh-sach")
    public String danhSach(Model model) {
        model.addAttribute("list", list);
        return "danhSach";
    }

    @GetMapping("/detail/{id}")
    public String detail(Model model, @PathVariable int id) {
        NguoiDung ng = new NguoiDung();
        for (NguoiDung ng1 : list) {
            if (ng1.getId() == id) {
                ng = ng1;
            }
        }
        model.addAttribute("ng", ng);
        return "detail";
    }
    @PostMapping("/detail/{id}")
    public String detailUp(Model model, @PathVariable("id") int id,NguoiDung ngUp) {
        NguoiDung ng = new NguoiDung();
        for (NguoiDung ng1 : list) {
            if (ng1.getId() == id) {
                ng = ng1;
                list.set(list.indexOf(ng1),ngUp);
            }
        }
        model.addAttribute("ng", ng);
        return "redirect:/danh-sach";
    }

    @PostMapping("/user/add")
    public String add(NguoiDung ng) {
        list.add(ng);
        return "redirect:/danh-sach";
    }
    @GetMapping("/update/{id}")
    public String updateHienThi(Model model, @PathVariable int id) {
        NguoiDung ng = new NguoiDung();
        for (NguoiDung ng1 : list) {
            if (ng1.getId() == id) {
                ng = ng1;
            }
        }
        model.addAttribute("ng", ng);
        return "update";
    }
}
