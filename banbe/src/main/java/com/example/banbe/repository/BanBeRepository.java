package com.example.banbe.repository;

import com.example.banbe.model.BanBe;
import com.example.banbe.model.BanBeView;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.ArrayList;

public interface BanBeRepository extends JpaRepository<BanBe, Integer> {
    @Query(nativeQuery = true, value = "select  Id, Ma, Ten, SoThich, GioiTinh, IdMQH  from Ban")
    ArrayList<BanBeView> listBan();
}
