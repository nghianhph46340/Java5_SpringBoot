package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.lang.reflect.Array;
import java.util.ArrayList;

@Controller
public class ctrlBanh {
    ArrayList<BanhTet> list = new ArrayList<>();

    public ctrlBanh() {
        list.add(new BanhTet(1, "trung", 10, true));
        list.add(new BanhTet(2, "dau", 102, true));
        list.add(new BanhTet(3, "xanh", 100, false));
        list.add(new BanhTet(4, "hat", 10, false));
        list.add(new BanhTet(5, "sen", 10, true));
    }

    @GetMapping(value = "/hien-thi")
    public String showBanh(Model model) {
        model.addAttribute("list", list);
        return "home";
    }

    @GetMapping(value = "/xoa/{id}")
    public String xoa(@PathVariable("id") int id, Model model) {
        for (BanhTet b : list
        ) {
            if (id == b.getId()) {
                list.remove(b);
                break;
            }
        }

        return "redirect:/hien-thi?msg=1";
    }

    @GetMapping(value = "/sua")
    public String showSua(int id, Model model) {
        for (BanhTet b : list
        ) {
            if (id == b.getId()) {
                model.addAttribute("b", b);
                break;
            }
        }

        return "sua";
    }

    @PostMapping(value = "/sua")
    public String sua(BanhTet b, int id) {
        for (int i = 0; i < list.size(); i++) {
            if (id == list.get(i).getId()) {
                list.set(i, b);
                break;
            }
        }
        return "redirect:/hien-thi";
    }

    @GetMapping(value = "/detail")
    public String detail(int id, Model model) {
        for (BanhTet b : list
        ) {
            if (id == b.getId()) {
                model.addAttribute("b", b);
                break;
            }
        }

        return "datail";
    }

    @PostMapping(value = "detail")
    public String quay() {
        return "redirect:/hien-thi";
    }
}
