package com.Grownited.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Grownited.entity.CategoryEntity;
import com.Grownited.repository.CategoryRepository;

  

@Controller
public class CategoryController {

	@Autowired 
	CategoryRepository categoryRepository; 
	
	@GetMapping("/newCategory")
	public String newCategory() {
		return "admin/NewCategory";
	}

	@PostMapping("saveCategory")
	public String saveCategory(CategoryEntity categoryEntity) {

		categoryEntity.setActive(true);
		categoryRepository.save(categoryEntity); 
		return "admin/AdminDashboard";
	}
	
	@GetMapping("/listCategory")
	public String listCategory(Model model) {
		
		List<CategoryEntity> categoryList = categoryRepository.findAll();
		model.addAttribute("categoryList",categoryList);//
		
		return "admin/ListCategory";
	}
	
	@GetMapping("/deleteCategory")
	public String deleteCategory(Integer categoryId) {

	    categoryRepository.deleteById(categoryId);

	    return "redirect:/listCategory";
	}
	
	@GetMapping("/editCategory")
	public String editCategory(@RequestParam("id") Integer categoryId, Model model) {

	    if (categoryId == null) {
	        return "redirect:/listCategory";
	    }

	    CategoryEntity category = categoryRepository.findById(categoryId).orElse(null);

	    model.addAttribute("category", category);

	    return "admin/EditCategory";
	}
	
	@PostMapping("/updateCategory")
	public String updateCategory(CategoryEntity categoryEntity) {

	    categoryRepository.save(categoryEntity);

	    return "redirect:/listCategory";
	}
		

}