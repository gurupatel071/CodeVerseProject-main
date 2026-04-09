package com.Grownited.controller.admin;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.Grownited.entity.UserDetailEntity;
import com.Grownited.entity.UserEntity;
import com.Grownited.entity.UserTypeEntity;
import com.Grownited.repository.UserDetailRepository;
import com.Grownited.repository.UserRepository;
import com.Grownited.repository.UserTypeRepository;
import com.Grownited.service.MailerService;
import com.cloudinary.Cloudinary;

import jakarta.servlet.http.HttpSession;

@Controller
public class SessionController {

	@Autowired
	UserRepository userRepository;

	@Autowired
	UserTypeRepository userTypeRepository;

	@Autowired
	UserDetailRepository userDetailRepository;

	@Autowired
	PasswordEncoder passwordEncoder;

	@Autowired
	MailerService mailerService;

	@Autowired
	Cloudinary cloudinary;

	@GetMapping("/signup")
	public String openSignupPage(Model model) {

		List<UserTypeEntity> allUserType = userTypeRepository.findAll();
		model.addAttribute("allUserType", allUserType);
		return "admin/Signup";
	}

	@GetMapping("/login")
	public String openLoginPage() {
		return "admin/Login";
	}

	@PostMapping("/authenticate")
	public String authenticate(String email, String password, Model model, HttpSession session) {
		Optional<UserEntity> op = userRepository.findByEmail(email);

		if (op.isPresent()) {
			UserEntity dbUser = op.get();
			session.setAttribute("user", dbUser);

			if (passwordEncoder.matches(password, dbUser.getPassword())) {

				if (dbUser.getRole().equals("ADMIN")) {
					return "redirect:/admin-dashboard";
				} else if (dbUser.getRole().equals("PARTICIPANT")) {
					return "redirect:/participant/home";
				} else if (dbUser.getRole().equals("JUDGE")) {
					return "redirect:/judge-dashboard";
				}
			}
		}

		model.addAttribute("error", "Invalid Credentials");
		return "admin/Login";
	}

	@GetMapping("/forgetpassword")
	public String showForgotPasswordForm() {

		return "admin/ForgetPassword";
	}

	@PostMapping("/forgot-password")
	public String forgotPassword(@RequestParam String email) {

		// 1️⃣ Find user
		UserEntity user = userRepository.findByemail(email);

		if (user == null) {
			return "Email not found";
		}

		// 2️⃣ Call your existing method
		String otp = mailerService.sendForgotPasswordOtp(email);

		// 3️⃣ Save OTP in database
		user.setOtp(otp);
		userRepository.save(user);

		return "admin/ResetPassword";
	}

	@PostMapping("/reset-password")
	public String resetPassword(@RequestParam String email, @RequestParam String otp,
			@RequestParam String newPassword) {

		UserEntity user = userRepository.findByemail(email);

		if (user == null) {
			return "User not found";
		}

		if (!user.getOtp().equals(otp)) {

			return "admin/ResetPassword";

		}

		// Encode new password
		String encodedPassword = passwordEncoder.encode(newPassword);
		user.setPassword(encodedPassword);

		// Clear OTP after use
		user.setOtp(null);

		userRepository.save(user);

		return "admin/Login";
	}

	@PostMapping("/register")
	public String register(UserEntity userEntity, UserDetailEntity userDetailEntity, MultipartFile profilePic) {

		userEntity.setRole("PARTICIPANT");
		userEntity.setActive(true);
		userEntity.setCreatedAt(LocalDate.now());

		// password encode
		String encodedPassword = passwordEncoder.encode(userEntity.getPassword());

		userEntity.setPassword(encodedPassword);
		try {

			if (profilePic != null && !profilePic.isEmpty()) {

				System.out.println(profilePic.getOriginalFilename());

				Map uploadResult = cloudinary.uploader().upload(profilePic.getBytes(), Map.of());

				String profilePicURL = uploadResult.get("secure_url").toString();

				userEntity.setProfilePicURL(profilePicURL);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		// save user
		userRepository.save(userEntity);

		userDetailEntity.setUserId(userEntity.getUserId());
		userDetailRepository.save(userDetailEntity);

		mailerService.sendWelcomeMail(userEntity);

		return "admin/Login";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "admin/Login";
	}

}