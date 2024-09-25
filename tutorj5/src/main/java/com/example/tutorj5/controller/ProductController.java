package com.example.tutorj5.controller;

import com.example.tutorj5.model.Category;
import com.example.tutorj5.model.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.ArrayList;

@Controller
public class ProductController {
    ArrayList<Product> list = new ArrayList<>();
    ArrayList<Category> listCate = new ArrayList<>();
    Boolean check = true;

    public ProductController() {
        list.add(new Product("1", "BanhKeo", 1000, "yes", "Cate1"));
        list.add(new Product("2", "BanhTrai", 4000, "no", "Cate2"));
        list.add(new Product("3", "BanhHeo", 9000, "yes", "Cate3"));
        listCate.add(new Category("1", "Cate1"));
        listCate.add(new Category("2", "Cate2"));
        listCate.add(new Category("3", "Cate3"));
    }

    @GetMapping("/product")
    public String hienThi(Model model) {
        model.addAttribute("list", list);
        model.addAttribute("listcate", listCate);
        return "product";
    }

    @PostMapping("/add")
    public String add(Product pr) {
        check = false;
        list.add(pr);
        return "redirect:/product";
    }

    @GetMapping("/detail/{id}")
    public String detail(Model model, @PathVariable("id") String id) {
        check = true;
        Product pr = new Product();
        for (Product p : list) {
            if (p.getId().equals(id)) {
                pr = p;
            }
        }
        model.addAttribute("pr", pr);
        model.addAttribute("listcate", listCate);
        return "product";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") String id) {
        Product prx = new Product();
        for (Product pr : list) {
            if (pr.getId().equals(id)) {
                prx = pr;
            }
        }
        list.remove(prx);
        return "redirect:/product";
    }

//    @PostMapping("/update/{id}")
//    public String update(Model model, @PathVariable("id") String id, Product pr) {
//        for (Product pro : list) {
//            if (pro.getId().equals(id)) {
//                list.set(list.indexOf(pro), pr);
//            }
//        }
//        model.addAttribute("pr", pr);
//        return "redrect:/product";
//    }

    @PostMapping("/update/{id}")
    public String update2(Model model, @PathVariable("id") String id, @ModelAttribute("pr") Product pr) {
        for (Product pro : list) {
            if (pro.getId().equals(id)) {
                pro.setName(pr.getName());
                pro.setCategory(pr.getCategory());
                pro.setStatus(pr.getStatus());
                pro.setPrice(pr.getPrice());
            }
        }
//        model.addAttribute("pr",pr);
        return "redrect:/product";
    }

}
