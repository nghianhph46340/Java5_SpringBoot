package com.example.demo.buoi8;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Staff {
    @NotNull
    private int id;
    @NotBlank
    private String name;
    @Min(value = 17, message = "tuoi lon hon 17")
    @NotNull(message = "vui long nhap tuoi  ")
    private int age;
    @NotBlank(message = "vui long chon vi tri")
    private String position;
    @NotEmpty(message = "vui long chon so thich")
    private String[] hobbies;
    @NotNull(message = "vui long chon quoc ")
    private Country country;
}
