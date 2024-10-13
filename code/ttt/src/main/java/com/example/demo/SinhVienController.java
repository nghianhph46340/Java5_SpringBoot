package com.example.demo;

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
    @Autowired
    SinhVienRepository sinhVienRepository;
    @Autowired
    LopHocRepository lopHocRepository;

    @GetMapping("/sinh-vien")
    public String hienThi(Model model) {
        List<SinhVien> list = sinhVienRepository.findAll();
        List<LopHoc> lop = lopHocRepository.findAll();
        model.addAttribute("list", list);
        model.addAttribute("lop", lop);
        return "sinhVien";
    }

    @PostMapping("/sinh-vien/add")
    public String add(@ModelAttribute SinhVien sinhVien) {
        sinhVienRepository.save(sinhVien);
        return "redirect:/page";
    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        sinhVienRepository.deleteById(id);
        return "redirect:/page";
    }

    @GetMapping("/page")
    public String phanTrang(Model model, @RequestParam(value = "page", defaultValue = "0") Integer page, @RequestParam(value = "size", defaultValue = "3") Integer size) {


        Pageable pageable1 = PageRequest.of(page, size);
        Page<SinhVien> list1 = sinhVienRepository.findAll(pageable1);
        model.addAttribute("list", list1.getContent());
        List<LopHoc> lop = lopHocRepository.findAll();
        model.addAttribute("lop", lop);
        model.addAttribute("b", list1.getTotalPages());
        model.addAttribute("a", page);
        model.addAttribute("listChiSo", lopHocRepository.getList());
        return "sinhVien";
    }
}
