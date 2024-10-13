package controller;

import com.example.java5buoi5.repository.SinhVienRepository;
import model.SinhVien;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class SinhVienController {
    @Autowired
    private SinhVienRepository sinhVienRepository;
    @GetMapping("/danh-sach")
    public String danhSach(Model model){
        List<SinhVien> list = sinhVienRepository.findAll();
        model.addAttribute("list",list);
        return "danh-sach";
    }
}
