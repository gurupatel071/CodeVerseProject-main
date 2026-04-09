package com.Grownited.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Grownited.entity.UserDetailEntity;
import com.Grownited.entity.UserEntity;
import com.Grownited.repository.UserDetailRepository;
import com.Grownited.repository.UserRepository;

@Controller
public class UserController {

	@Autowired
	UserRepository userRepository;

	@Autowired
	UserDetailRepository userDetailRepository;

	@GetMapping("/listUser")
	public String listUser(Model model) {

	    List<UserEntity> allUser = userRepository.findAll();

	    long adminCount = userRepository.countByRole("ADMIN");
	    long activeUsers = userRepository.countByActive(true);
	    long inactiveUsers = userRepository.countByActive(false);

	    model.addAttribute("userList", allUser);
	    model.addAttribute("adminCount", adminCount);
	    model.addAttribute("activeUsers", activeUsers);
	    model.addAttribute("inactiveUsers", inactiveUsers);

	    return "admin/ListUser";
	}

	@GetMapping("/viewUser")
	public String viewUser(Integer userId, Model model) {

	    UserEntity user = userRepository.findById(userId).orElse(null);
	    UserDetailEntity userDetail = userDetailRepository.findByUserId(userId).orElse(null);

	    if (user == null) {
	        return "redirect:admin/listUser";
	    }

	    model.addAttribute("user", user);
	    model.addAttribute("userDetail", userDetail);

	    return "admin/ViewUser";
	}
	
	@GetMapping("/deleteUser")
	public String deleteUser(Integer userId) {


	    userDetailRepository.deleteById(userId);

	    userRepository.deleteById(userId);

	    return "redirect:/listUser";
	}
	
	@GetMapping("/editUser")
	public String editUser(@RequestParam("userId") Integer userId, Model model) {

	    if (userId == null) {
	        return "redirect:/listUser";
	    }

	    UserEntity user = userRepository.findById(userId).orElse(null);
	    UserDetailEntity userDetail = userDetailRepository.findByUserId(userId).orElse(null);

	    model.addAttribute("user", user);
	    model.addAttribute("userDetail", userDetail);

	    return "admin/EditUser";
	}
	
	@PostMapping("/updateUser")
	public String updateUser(UserEntity user) {

	    userRepository.save(user);

	    return "redirect:/listUser";
	}
	
	

}