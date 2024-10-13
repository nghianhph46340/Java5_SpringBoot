package com.example.java5buoi5.repository;

import com.example.java5buoi5.model.LopHocViewModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface LopHocViewRepository extends JpaRepository<LopHocViewModel,String> {
//    @Query(nativeQuery = true,
//    value = "select ")
}
