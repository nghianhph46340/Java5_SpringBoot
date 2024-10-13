package com.example.tutorjava5s2.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "nhanvien")
public class NhanVien {
    @Id
    private Integer id;
    private String hoten;
    private Integer tuoi;
    private String diachi;
    private String phongban;
    private String gioitinh;

}
