package com.example.java5buoi5.controller;

import com.example.java5buoi5.model.SinhVienViewModel;
import com.example.java5buoi5.repository.LopHocRepository2;
import com.example.java5buoi5.repository.SinhVienRepository;
import com.example.java5buoi5.model.SinhVien;
import com.example.java5buoi5.repository.SinhVienRepository2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class SinhVienController {
//    Integer min = 0;
//    Integer max =
    @Autowired
    private SinhVienRepository sinhVienRepository;
    @Autowired
    private SinhVienRepository2 sinhVienRepository2;
    @Autowired
    private LopHocRepository2 lopHocRepository2;

    @GetMapping("/danh-sach")
    public String danhSach(Model model) {
        List<SinhVien> list = sinhVienRepository2.findAll();
        model.addAttribute("list", list);
        model.addAttribute("listClass", lopHocRepository2.findAll());
        return "danh-sach";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute SinhVien sv, Model model) {
        sinhVienRepository2.save(sv);
        return "redirect:/danh-sach";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        sinhVienRepository2.deleteById(id);
        return "redirect:/danh-sach";
    }

    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("sv", sinhVienRepository2.findById(id).get());
//        System.out.println();
        model.addAttribute("listClass", lopHocRepository2.findAll());
        model.addAttribute("list", sinhVienRepository2.findAll());
        return "danh-sach";
    }

    @GetMapping("/page")
    public String phanTrang(Model model, @RequestParam(value = "page", defaultValue = "0") Integer page,
                            @RequestParam(value = "size", defaultValue = "3") Integer size) {

        if (page < 0){
            page = 0;
            model.addAttribute("trangHien",page);
        }
        Pageable pageable = PageRequest.of(page, size);
        Page<SinhVien> list = sinhVienRepository2.findAll(pageable);
        Integer maxPage = list.getTotalPages();
        System.out.println(maxPage);

        if (page >= maxPage){
            page = maxPage -1;
        }
        model.addAttribute("trangHien",page);
        model.addAttribute("maxTrang",maxPage);
        model.addAttribute("list", list.getContent());
        return "/danh-sach";
    }
//    @PostMapping("/page")
//    public String tangTrang(Model model, @RequestParam(value = "page", defaultValue = "0") Integer page,
//                            @RequestParam(value = "size", defaultValue = "3") Integer size) {
//        Pageable pageable = PageRequest.of(page, size);
//
//        Page<SinhVien> list = sinhVienRepository2.findAll(pageable);
//        model.addAttribute("list", list.getContent());
//        return "/danh-sach";
//    }
}
