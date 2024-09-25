package com.example.lab1.controller;

import com.example.lab1.model.BanhTet;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.ArrayList;

@Controller
public class ControllerBanhTet {
    ArrayList<BanhTet> listBanh = new ArrayList<>();
    String mess = "";

    public ControllerBanhTet() {
        listBanh.add(new BanhTet(1, "Banh nep", 100000, true));
        listBanh.add(new BanhTet(2, "Banh te", 250000, false));
        listBanh.add(new BanhTet(3, "Banh hap", 700000, true));
        listBanh.add(new BanhTet(4, "Banh thit", 400000, false));
        listBanh.add(new BanhTet(5, "Banh da", 700000, true));
    }

    @GetMapping("/banhtet")
    public String hienThiBanh(Model model) {
        model.addAttribute("mess", mess);
        mess = "";
        model.addAttribute("list", listBanh);
        return "banhtet";
    }

    @GetMapping("/delete/{id}")
    public String delete(Model model, @PathVariable("id") int id) {
        BanhTet banh = new BanhTet();
        for (BanhTet banhTet : listBanh) {
            if (banhTet.getId() == id) {
                banh = banhTet;
            }
        }
        listBanh.remove(banh);
        mess = "Xoa thanh cong";
        System.out.println(mess);
//        model.addAttribute("mess", "Xóa thành công");
        return "redirect:/banhtet";
    }

//    @PostMapping("/banhtet")
//    public String hienThiBanh2(Model model) {
//        model.addAttribute("mess", mess);
//        return "banhtet";
//    }

    @GetMapping("/detail/{id}")
    public String detail(Model model, @PathVariable("id") int id) {
        BanhTet banh = new BanhTet();
        for (BanhTet banhTet : listBanh) {
            if (banhTet.getId() == id) {
                banh = banhTet;
            }
        }
        model.addAttribute("banh", banh);
        return "detail";
    }

    @PostMapping("/update/{id}")
    public String update(@PathVariable("id") int id, BanhTet banh) {
        BanhTet banhTest = new BanhTet();
        for (BanhTet banhTet : listBanh) {
            if (banhTet.getId() == id) {
                banhTest = banhTet;
            }
        }
        listBanh.set(listBanh.indexOf(banhTest), banh);
        return "redirect:/banhtet";
    }
}
