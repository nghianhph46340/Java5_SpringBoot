package com.example.java5buoi5.repository;

import com.example.java5buoi5.model.SinhVien;
import com.example.java5buoi5.model.SinhVienViewModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.ArrayList;

public interface SinhVienRepository extends JpaRepository<SinhVienViewModel, Integer> {
    @Query(value = "select sv.id, sv.name, sv.address, sv.age, sv.status, l.class_name from sinh_vien sv inner join lop_hoc l on sv.id = l.id",nativeQuery = true)
    ArrayList<SinhVienViewModel> getAll();
}
