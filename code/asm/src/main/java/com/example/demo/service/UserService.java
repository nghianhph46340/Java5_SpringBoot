package com.example.demo.service;


import com.example.demo.model.User;
import com.example.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.UUID;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private EmailService emailService;  // Assumes you have an email service

    public void sendPasswordResetLink(String email) {
        Optional<User> user = userRepository.findByEmail(email);
        if (!user.isPresent()) {
            throw new RuntimeException("Email không tồn tại");
        }

        String token = UUID.randomUUID().toString();
        // Save token to database or use some token management (e.g., JWT)

        String resetLink = "http://localhost:8080/user/reset-password?token=" + token;
        emailService.send(email, "Đặt lại mật khẩu", "Nhấn vào đây để đặt lại mật khẩu của bạn: " + resetLink);
    }

    public void resetPassword(String token, String newPassword) {
        // Verify token, then reset password
        User user = userRepository.findByResetToken(token)
                .orElseThrow(() -> new RuntimeException("Token không hợp lệ"));

        // Hash the new password
        user.setPasswordHash(passwordEncoder.encode(newPassword));
        userRepository.save(user);
    }
}
