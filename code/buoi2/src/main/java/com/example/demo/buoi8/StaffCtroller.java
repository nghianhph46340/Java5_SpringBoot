package com.example.demo.buoi8;

import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/buoi8")
public class StaffCtroller {
    @GetMapping("/staff")
    public String showForm(Model model) {
        model.addAttribute("staff", new Staff());
        return "buoi8/hien-thi";
    }

    @PostMapping("/staff")
    public String save(@Valid @ModelAttribute("staff") Staff staff, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "buoi8/hien-thi";
        }
        model.addAttribute("msg", "thanh cong");
        return "buoi8/hien-thi";
    }

    @ModelAttribute("positions")
    public Map<String, String> getPosition() {
        Map<String, String> positions = new HashMap<>();
        positions.put("tp", "truong phong");
        positions.put("gd", "giam doc");
        positions.put("tk", "thu ky");
        return positions;
    }

    @ModelAttribute("hobbies")
    public String[] getHobbies() {
        return new String[]{"an", "ngu", "choi"};
    }

    @ModelAttribute("countries")
    public List<Country> getCountries() {
        List<Country> countries = new ArrayList<>();
        countries.add(new Country(1, "vn"));
        countries.add(new Country(2, "my"));
        countries.add(new Country(3, "tq"));
        return countries;

    }
}
