package com.example.tutorjava5s2.Repository;

import com.example.tutorjava5s2.model.NhanVien;
import com.example.tutorjava5s2.model.NhanVienView;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.ArrayList;

public interface NhanVienRepository extends JpaRepository<NhanVien,Integer> {
    @Query(nativeQuery = true,value = " select nv.ID, nv.HoTen, nv.Tuoi, nv.DiaChi, nv.PhongBan, nv.GioiTinh from NhanVien nv")
    ArrayList<NhanVienView> getAllNhanVien();
}
