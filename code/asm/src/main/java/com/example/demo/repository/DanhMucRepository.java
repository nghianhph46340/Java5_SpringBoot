package com.example.demo.repository;

import com.example.demo.model.DanhMuc;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DanhMucRepository extends JpaRepository<DanhMuc,Integer> {
}
