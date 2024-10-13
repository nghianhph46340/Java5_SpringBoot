package com.example.demo.controller;

import com.example.demo.Repository.*;
import com.example.demo.model.*;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class adminController {
    @Autowired
    private SanPhamRepo sanPhamRepo;
    @Autowired
    private DanhMucRepo danhMucRepo;
    @Autowired
    private MauSacRepo mauSacRepo;
    @Autowired
    private SizeRepo sizeRepo;
    @Autowired
    private ChiTietSanPhamRepo chiTietSanPhamRepo;

    @GetMapping("/admin")
    public String hienThi(Model model) {
        model.addAttribute("listSanPham", sanPhamRepo.findAll());
        model.addAttribute("listDanhMuc", danhMucRepo.findAll());
        model.addAttribute("listMauSac", mauSacRepo.findAll());
        model.addAttribute("listSize", sizeRepo.findAll());
        model.addAttribute("listCTSP", chiTietSanPhamRepo.findAll());
        return "admin";
    }

    //    @PostMapping("/admin/add")
//    public String add(@ModelAttribute SanPham sanPham){
//        sanPhamRepo.save(sanPham);
//        return "redirect:/admin";
//    }
    public Date parseDate(String d) {
        SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
        try {
            return s.parse(d);
        } catch (ParseException e) {
            return null;
        }
    }

    @GetMapping("/admin/detail/{id}")
    public String detailSP(Model model, @PathVariable("id") Integer id) {
        System.out.println("ID sản phẩm: " + id);
        model.addAttribute("detailSP", sanPhamRepo.findById(id).get());
        return "updateSanPham";
    }

    @PostMapping("/admin/update/{id}")
    public String updateProduct(@PathVariable("id") Integer idSP,
                                @RequestParam("ma_san_pham") String maSanPham,
                                @RequestParam("ten_san_pham") String tenSanPham,
                                @RequestParam("ngay_tao") String ngayTaoStr,
                                @RequestParam("ngay_sua") String ngaySuaStr,
                                @RequestParam("trang_thai") String trangThai, @RequestParam("danhMuc") Integer id) {

        // Chuyển chuỗi ngày từ form thành Date
        Date ngayTaoDate = parseDate(ngayTaoStr);
        Date ngaySuaDate = parseDate(ngaySuaStr);
        DanhMuc danhMuc = danhMucRepo.findById(id).get();
        // Tạo đối tượng sản phẩm và set các thuộc tính
        SanPham product = sanPhamRepo.findById(idSP).get();
        product.setMa_san_pham(maSanPham);
        product.setTen_san_pham(tenSanPham);
        product.setNgay_tao(ngayTaoDate);
        product.setNgay_sua(ngaySuaDate);
        product.setTrang_thai(trangThai);
        product.setDanhMuc(danhMuc);

        // Sau đó lưu sản phẩm vào cơ sở dữ liệu
        sanPhamRepo.save(product);
        return "redirect:/admin";
    }

    @PostMapping("/admin/add")
    public String addProduct(@RequestParam("ma_san_pham") String maSanPham,
                             @RequestParam("ten_san_pham") String tenSanPham,
                             @RequestParam("ngay_tao") String ngayTaoStr,
                             @RequestParam("ngay_sua") String ngaySuaStr,
                             @RequestParam("trang_thai") String trangThai, @RequestParam("danhMuc") Integer id) {

        // Chuyển chuỗi ngày từ form thành Date
        Date ngayTaoDate = parseDate(ngayTaoStr);
        Date ngaySuaDate = parseDate(ngaySuaStr);
        DanhMuc danhMuc = danhMucRepo.findById(id).get();
        // Tạo đối tượng sản phẩm và set các thuộc tính
        SanPham product = new SanPham();
        product.setMa_san_pham(maSanPham);
        product.setTen_san_pham(tenSanPham);
        product.setNgay_tao(ngayTaoDate);
        product.setNgay_sua(ngaySuaDate);
        product.setTrang_thai(trangThai);
        product.setDanhMuc(danhMuc);

        // Sau đó lưu sản phẩm vào cơ sở dữ liệu
        sanPhamRepo.save(product);
        return "redirect:/admin";
    }


    @PostMapping("/admin/addCTSP/")
    public String addCTSP(@RequestParam("ctspID") Integer ctspID,
                          @RequestParam("mauSac") Integer id_mau_sac,
                          @RequestParam("size") Integer id_size,
                          @RequestParam("gia_ban") double giaBan,
                          @RequestParam("so_luong_ton") Integer soLuongTon,
                          @RequestParam("ngay_tao") String ngayTao,
                          @RequestParam("ngay_sua") String ngaySua,
                          @RequestParam("trang_thai") String trangThai) {
        Date ngayTaoDate = parseDate(ngayTao);
        Date ngaySuaDate = parseDate(ngaySua);
        MauSac mauSac = mauSacRepo.findById(id_mau_sac).get();
        Size size = sizeRepo.findById(id_size).get();
        ChiTietSanPham ctsp = new ChiTietSanPham();
        ctsp.setSanPham(sanPhamRepo.findById(ctspID).get());
        ctsp.setMauSac(mauSac);
        ctsp.setSize(size);
        ctsp.setGia_ban(giaBan);
        ctsp.setSo_luong_ton(soLuongTon);
        ctsp.setNgay_tao(ngayTaoDate);
        ctsp.setNgay_sua(ngaySuaDate);
        ctsp.setTrang_thai(trangThai);
        chiTietSanPhamRepo.save(ctsp);
        return "redirect:/admin";

    }
    @Transactional
    public void xoaSanPhamVaChiTiet(Integer sanPhamId) {
        chiTietSanPhamRepo.deleteBySanPhamId(sanPhamId);

        sanPhamRepo.deleteById(sanPhamId);
    }
    @GetMapping ("/admin/xoa/{id}")
    public String xoaSanPham(@PathVariable("id") Integer id) {
        xoaSanPhamVaChiTiet(id);
        return "redirect:/admin";
    }
    @GetMapping("/admin/xoaCT/{id}")
    public String xoaCT(@PathVariable("id") Integer id){
        chiTietSanPhamRepo.deleteBySanPhamId(id);
        return "redirect:/admin";
    }

}
