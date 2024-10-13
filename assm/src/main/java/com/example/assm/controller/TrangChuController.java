package com.example.assm.controller;

import com.example.assm.model.*;
import com.example.assm.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

//import java.sql.Date;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;

@Controller
public class TrangChuController {
    public Integer idSp = 0;
    @Autowired
    private SanPhamRepository sanPhamRepository;
    @Autowired
    private DanhMucRepository danhMucRepository;
    @Autowired
    private SizeRepository sizeRepository;
    @Autowired
    private MauSacRepository mauSacRepository;
    @Autowired
    private ChiTietSanPhamRepository chiTietSanPhamRepository;
    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;
    @Autowired
    private HoaDonRepository hoaDonRepository;
    @Autowired
    private KhachHangRepository khachHangRepository;
    LocalDate dateNow = LocalDate.now();
    java.sql.Date dates = java.sql.Date.valueOf(dateNow);
    Integer idHoaDons = 0;
    String thanhCong = "";

    @GetMapping("/trang-chu")
    public String trangChu(Model model) {
        return "BanHang";
    }

    @GetMapping("/ban-hang")
    public String banHang(Model model) {
        Integer soLuong = 1;
        model.addAttribute("soLuong", soLuong);
        model.addAttribute("listSPBanHang", chiTietSanPhamRepository.listCTSPtheoSPBanHang());
        model.addAttribute("listHoaDonTong", hoaDonRepository.listHoaDonTong());
        model.addAttribute("listKH", khachHangRepository.findAll());
        model.addAttribute("thongBao", thanhCong);
        thanhCong = "";
        return "BanHangBan";
    }

    @GetMapping("/ban-hang/hoa-don/{id}")
    public String hoaDon(Model model, @PathVariable Integer id) {
        Integer idHoaDon = id;
        idHoaDons = idHoaDon;
        Boolean checkKH = true;
        model.addAttribute("idHoaDon", idHoaDon);
        model.addAttribute("listSPBanHang", chiTietSanPhamRepository.listCTSPtheoSPBanHang());
        model.addAttribute("listHoaDonTong", hoaDonRepository.listHoaDonTong());
        model.addAttribute("listHoaDonChiTietHD", hoaDonChiTietRepository.listHoaDonChiTietTheoHoaDon(id));
        model.addAttribute("listKH", khachHangRepository.findAll());
        model.addAttribute("tongTien", tinhTien(hoaDonChiTietRepository.listHoaDonChiTietTheoHoaDon(id)));
//        if (hoaDonRepository.findById(id).get().getKhach_hang().getHo_ten().isEmpty()){
//            checkKH = true;
//            model.addAttribute("checkKH",checkKH);
//        }else {
//            checkKH = false;
//            model.addAttribute("checkKH",checkKH);
//        }
        return "BanHangBan";
    }

    @GetMapping("/san-pham")
    public String sanPham(Model model) {
        model.addAttribute("listSP", sanPhamRepository.listSanPham());
        model.addAttribute("listDanhMuc", danhMucRepository.findAll());
        model.addAttribute("listMauSac", mauSacRepository.findAll());
        model.addAttribute("listSize", sizeRepository.findAll());


        return "SanPham";

    }

    public void detail(@RequestParam("spSua") Integer spSua) {
        if (spSua <= 0) {
        } else {
            idSp = spSua;
        }
    }

    @PostMapping("/san-pham/add")
    public String addSanPham(
            @RequestParam("ngay_tao") String ngayTao,
            @RequestParam("ngay_sua") String ngaySua,
            @RequestParam("danhMuc") Integer id,
            @ModelAttribute SanPham sp) {
        sp.setNgay_sua(changeDate(ngaySua));
        sp.setNgay_tao(changeDate(ngayTao));
        sp.setDanhMuc(danhMucRepository.findById(id).get());
        if (sp.getTrang_thai() == null) {
            sp.setTrang_thai("Không hoạt động");
        }
        sanPhamRepository.save(sp);
        return "redirect:/san-pham";
    }

    @PostMapping("/san-pham/add/ctsp/")
    public String addCTSP(Model model, @RequestParam("id_sp") Integer idSP,
                          @RequestParam("ngay_tao") String ngayTao,
                          @RequestParam("ngay_sua") String ngaySua,
                          @RequestParam("mauSac") Integer mauSac,
                          @RequestParam("size") Integer size,
                          @ModelAttribute ChiTietSanPham ctsp) {
        ctsp.setSp(sanPhamRepository.findById(idSP).get());
        ctsp.setNgay_sua(changeDate(ngaySua));
        ctsp.setNgay_tao(changeDate(ngayTao));
        ctsp.setMauSac(mauSacRepository.findById(mauSac).get());
        ctsp.setSize(sizeRepository.findById(size).get());
        if (ctsp.getTrang_thai() == null) {
            ctsp.setTrang_thai("Không hoạt động");
        }
        chiTietSanPhamRepository.save(ctsp);
        System.out.println(idSP);

        return "redirect:/san-pham/ctsp/" + idSP;
    }

    @GetMapping("/san-pham/detail/{id}")
    public String detailSP(Model model, @PathVariable Integer id) {
        System.out.println("Get: " + id);
        model.addAttribute("listDanhMuc", danhMucRepository.findAll());
        model.addAttribute("spDetail", sanPhamRepository.findById(id).get());
        return "DetailSanPham";
    }

    @PostMapping("/san-pham/detail/{id}")
    public String suaSP(Model model, @PathVariable Integer id,
                        @RequestParam("ngay_tao") String ngayTao,
                        @RequestParam("ngay_sua") String ngaySua,
                        @RequestParam("danhMuc") Integer danhMuc,
                        @ModelAttribute SanPham sp) {
        sp.setNgay_sua(changeDate(ngaySua));
        sp.setNgay_tao(changeDate(ngayTao));
        sp.setDanhMuc(danhMucRepository.findById(danhMuc).get());
        if (sp.getTrang_thai() == null) {
            sp.setTrang_thai("Không hoạt động");
        }
        sanPhamRepository.save(sp);
        return "redirect:/san-pham";
    }

    @GetMapping("/san-pham/delete/{id}")
    public String xoaSP(@PathVariable Integer id) {
        SanPham sp = sanPhamRepository.findById(id).get();
        sanPhamRepository.delete(sp);
        return "redirect:/san-pham";
    }

    @GetMapping("/san-pham/ctsp/{id}")
    public String detailCtsptheoSP(Model model, @PathVariable Integer id) {
        model.addAttribute("listCTSP", chiTietSanPhamRepository.listCTSPtheoSP(id));
        model.addAttribute("listDanhMuc", danhMucRepository.findAll());
        model.addAttribute("idSPxx", id);
        model.addAttribute("tenSPx", sanPhamRepository.findById(id).get().getTen_san_pham());
        model.addAttribute("listMauSac", mauSacRepository.findAll());
        model.addAttribute("listSize", sizeRepository.findAll());
        return "ChiTietSanPham";
    }

    @GetMapping("/san-pham/ctsp/delete/{id}")
    public String xoaCTSP(@PathVariable Integer id) {
        ChiTietSanPham ctsp = chiTietSanPhamRepository.findById(id).get();
        Integer spId = chiTietSanPhamRepository.findById(id).get().getSp().getId();
        chiTietSanPhamRepository.delete(ctsp);
        return "redirect:/san-pham/ctsp/" + spId;
    }

    @GetMapping("/san-pham/ctsp/update/{id}")
    public String detailCTSP(@PathVariable Integer id, Model model) {
        ChiTietSanPham ctsp = chiTietSanPhamRepository.findById(id).get();
        model.addAttribute("ctsp", ctsp);
        model.addAttribute("listMauSac", mauSacRepository.findAll());
        model.addAttribute("listSize", sizeRepository.findAll());
        return "DetailChiTietSanPham";
    }

    @PostMapping("/san-pham/ctsp/update/{id}")
    public String suaCTSP(Model model, @PathVariable Integer id,
                          @RequestParam("ngay_tao") String ngayTao,
                          @RequestParam("ngay_sua") String ngaySua,
                          @RequestParam("mauSac") Integer mauSac,
                          @RequestParam("size") Integer size,
                          @ModelAttribute ChiTietSanPham ctsp) {
        Integer ctspId = chiTietSanPhamRepository.findById(id).get().getSp().getId();
        System.out.println(ctspId + "Chi tiết sản phapảm id");
        ctsp.setNgay_sua(changeDate(ngaySua));
        ctsp.setNgay_tao(changeDate(ngayTao));
        ctsp.setMauSac(mauSacRepository.findById(mauSac).get());
        ctsp.setSize(sizeRepository.findById(size).get());
        ctsp.setSp(chiTietSanPhamRepository.findById(id).get().getSp());
        if (ctsp.getTrang_thai() == null) {
            ctsp.setTrang_thai("Không hoạt động");
        }
        chiTietSanPhamRepository.save(ctsp);
        return "redirect:/san-pham/ctsp/" + ctspId;
    }

    @PostMapping("/ban-hang/hoa-don/add")
    public String addHoaDonNew(@ModelAttribute HoaDon hoaDon, @RequestParam("idKhach") Integer idKh) {
        System.out.println(idKh + "IDKhách hàng");
        hoaDon.setKhach_hang(khachHangRepository.findById(idKh).get());
        hoaDon.setNgay_tao(dates);
        hoaDon.setTrang_thai("Chưa thanh toán");
        hoaDonRepository.save(hoaDon);
        return "redirect:/ban-hang";
    }
//    @GetMapping("/ban-hang")
//    public String banHangSP(Model model) {
//        model.addAttribute("listSPBanHang", chiTietSanPhamRepository.listCTSPtheoSPBanHang());
//        return "BangHang-Ban";
//    }

    @PostMapping("/ban-hang/addHDCT")
    public String addGioHang(@RequestParam("idSanPham") Integer id, @RequestParam("idHoaDon") Integer idHoaDon,
                             @RequestParam("chonSL") Integer soLuongChon) {
        Integer idHoaDonReturn = idHoaDon;
        ChiTietSanPham ctsp = chiTietSanPhamRepository.findById(id).get();
        HoaDon hd = hoaDonRepository.findById(idHoaDon).get();
        HoaDonChiTiet hdct = new HoaDonChiTiet();
        ArrayList<HoaDonChiTietViewSoSanh> listTam = hoaDonChiTietRepository.listSS(idHoaDon);
        Integer idCtsp = 0;
        for (HoaDonChiTietViewSoSanh hdctss : listTam) {
            if (hdctss.getId_ctsp() == id) {
                idCtsp = hdctss.getId();
            }
        }
        if (idCtsp != 0) {
//            Update
            HoaDonChiTiet hdtt = hoaDonChiTietRepository.findById(idCtsp).get();
            hdct.setId(idCtsp);
            hdct.setCtsp(ctsp);
            hdct.setHoa_don(hd);
            hdct.setSo_luong_mua(hdtt.getSo_luong_mua() + soLuongChon);
            hdct.setGia_ban(ctsp.getGia_ban());
            hdct.setTong_tien((int) ((soLuongChon + hdtt.getSo_luong_mua()) * ctsp.getGia_ban()));
            ctsp.setSo_luong_ton(ctsp.getSo_luong_ton() - soLuongChon);
            chiTietSanPhamRepository.save(ctsp);
            hoaDonChiTietRepository.save(hdct);
        } else {
//            Thêm mới
            hdct.setCtsp(ctsp);
            hdct.setHoa_don(hd);
            hdct.setSo_luong_mua(soLuongChon);
            hdct.setGia_ban(ctsp.getGia_ban());
            hdct.setTong_tien((int) (soLuongChon * ctsp.getGia_ban()));
            ctsp.setSo_luong_ton(ctsp.getSo_luong_ton() - soLuongChon);
            chiTietSanPhamRepository.save(ctsp);
            hoaDonChiTietRepository.save(hdct);
        }

        return "redirect:/ban-hang/hoa-don/" + idHoaDonReturn;
    }

    private Date changeDate(String date) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            return dateFormat.parse(date);
        } catch (ParseException e) {
            return null;
        }
    }

    private Integer tinhTien(ArrayList<HoaDonChiTietView> list) {
        Integer tongTien = 0;
        for (HoaDonChiTietView hd : list) {
            tongTien += hd.getTong_tien();
        }
        return tongTien;
    }

    @PostMapping("/tinh-tien")
    public String tinhTienThua(@RequestParam("tienKhachDua") Integer tienKhachDua,
                               @RequestParam("tongTien") Integer tongTien,
                               Model model) {
        Integer tienThua = tongTien - tienKhachDua;
        Boolean check = true;
        if (tongTien == 0 || tienKhachDua <= 0) {
            thanhCong = "Thanh toán thất bại";
            model.addAttribute("thongBao", thanhCong);
        } else {
            if (tienThua <= 0) {
                model.addAttribute("tienThua", "Trả: " + (-tienThua));
                check = true;
                model.addAttribute("check", check);
            } else {
                model.addAttribute("tienThua", "Cần thêm: " + (tienThua));
//                thanhCong = "Thanh toán thất bại";
//                model.addAttribute("thongBao", thanhCong);
                check = false;
                model.addAttribute("check", check);
                return "redirect:/ban-hang/hoa-don/" + idHoaDons;
            }
        }
        model.addAttribute("listSPBanHang", chiTietSanPhamRepository.listCTSPtheoSPBanHang());
        model.addAttribute("listHoaDonTong", hoaDonRepository.listHoaDonTong());
        model.addAttribute("listHoaDonChiTietHD", hoaDonChiTietRepository.listHoaDonChiTietTheoHoaDon(idHoaDons));
        return "BanHangBan";
    }

    @GetMapping("/thanh-toan")
    public String thanhToanGet(Model model) {
        model.addAttribute("thongBao", thanhCong);
        thanhCong = "";
        return "BanHangBan";
    }


    @PostMapping("/thanh-toan")
    public String thanhToan(Model model) {
        HoaDon hd = hoaDonRepository.findById(idHoaDons).get();
        hd.setTrang_thai("Đã thanh toán");
        hoaDonRepository.save(hd);
        thanhCong = "Thanh toán thành công!!";
        model.addAttribute("thongBao", thanhCong);
        thanhCong = "";
        return "BanHangBan";
    }

    @GetMapping("/hoa-don")
    public String hoaDonQl() {
        return "HoaDon";

    }
}
