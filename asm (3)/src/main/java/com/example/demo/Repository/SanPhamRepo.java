package com.example.demo.Repository;

import com.example.demo.model.SanPham;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface SanPhamRepo extends JpaRepository<SanPham, Integer> {
    @Modifying
    @Transactional
    @Query(value = "DELETE FROM san_pham WHERE id = :sanPhamId", nativeQuery = true)
    void deleteById(@Param("sanPhamId") Integer sanPhamId);
}
