package com.example.demo.Repository;

import com.example.demo.model.ChiTietSanPham;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ChiTietSanPhamRepo extends JpaRepository<ChiTietSanPham, Integer> {

    @Modifying
    @Transactional
    @Query(value = "DELETE FROM ctsp WHERE id_sp = :sanPhamId", nativeQuery = true)
    void deleteBySanPhamId(@Param("sanPhamId") Integer sanPhamId);

}
