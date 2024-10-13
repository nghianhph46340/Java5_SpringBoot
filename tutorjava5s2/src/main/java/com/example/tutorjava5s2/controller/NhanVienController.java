package com.example.tutorjava5s2.controller;

import com.example.tutorjava5s2.Repository.NhanVienRepository;
import com.example.tutorjava5s2.Repository.NhanVienRepositoryChucNang;
import com.example.tutorjava5s2.model.NhanVien;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class NhanVienController {
    @Autowired
    private NhanVienRepository nhanVienRepository;
//    @Autowired
//    private NhanVienRepositoryChucNang chucNang;
    @GetMapping("/nhanvien")
    public String hienThi(Model model) {
        model.addAttribute("list", nhanVienRepository.getAllNhanVien());
        return "NhanVienViewJSP";
    }

    @PostMapping("/nhanvien/add")
    public String add(Model model, @ModelAttribute NhanVien nv) {
        nhanVienRepository.save(nv);
        return "redirect:/nhanvien";
    }
}
