package com.example.banbe.controller;

import com.example.banbe.model.BanBe;
import com.example.banbe.model.BanBeView;
import com.example.banbe.repository.BanBeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class BanBeController {
    @Autowired
    private BanBeRepository banBeRepository;

    @GetMapping("/ban/hien-thi")
    public String hienThi(Model model, @RequestParam(value = "page", defaultValue = "0") Integer page,
                          @RequestParam(value = "size", defaultValue = "3") Integer size) {
        Pageable pageable = PageRequest.of(page, size);
        Integer pageSize = pageable.getPageSize();
        Page<BanBe> listBanBe = banBeRepository.findAll(pageable);
        if (page >= 0 && page <= pageSize - 1) {
            model.addAttribute("list", listBanBe.getContent());
        } else if (page < 0) {
            pageable = PageRequest.of(0, size);
            Page<BanBe> listBanBe1 = banBeRepository.findAll(pageable);
            model.addAttribute("list", listBanBe1.getContent());
        } else if (page > pageSize - 1) {
            pageable = PageRequest.of(pageSize - 1, size);
            Page<BanBe> listBanBe1 = banBeRepository.findAll(pageable);
            model.addAttribute("list", listBanBe1.getContent());
        }
        return "Ban";
    }

    @PostMapping("/ban/add")
    public String add(@ModelAttribute BanBe banBe) {
        banBeRepository.save(banBe);
        return "redirect:/ban/hien-thi";
    }

    @GetMapping("/ban/detail/{id}")
    public String detail(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("ban", banBeRepository.findById(id));
//        model.addAttribute("list",banBeRepository.findAll());
        return "Ban";
    }
}
