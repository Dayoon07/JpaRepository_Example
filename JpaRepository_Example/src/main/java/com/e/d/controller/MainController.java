package com.e.d.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.e.d.model.entity.UserEntity;
import com.e.d.model.repository.UserRepository;

import jakarta.transaction.Transactional;

@Controller
public class MainController {

	private static final Logger log = LoggerFactory.getLogger(MainController.class);

	@Autowired
	private UserRepository repository;

	@GetMapping("/")
	public String index(Model model) {
		List<UserEntity> list = repository.findAll(Sort.by(Sort.Direction.DESC, "id"));
		model.addAttribute("users", list);
		log.info("{}", list);
		return "index";
	}

	@GetMapping("/edit")
	public String edit(@RequestParam int id, Model m) {
		repository.findById(id).ifPresent(i -> m.addAttribute("edit", i));
		return "example/edit";
	}

	@PostMapping("/update")
	public String update(@RequestParam int id, @RequestParam String name, @RequestParam String email,
			@RequestParam String password) {
		repository.findById(id).ifPresent(entity -> {
			entity.setName(name);
			entity.setEmail(email);
			entity.setPassword(password);
			repository.save(entity);
		});
		return "redirect:/";
	}

	@Transactional
	@PostMapping("/insert")
	public String insert(@ModelAttribute UserEntity entity) {
		repository.save(entity);
		log.info("저장됨 {}", entity);
		return "redirect:/";
	}

	@Transactional
	@PostMapping("/delete")
	public String delete(@RequestParam int id) {
		repository.deleteById(id);
		log.info("id : {}가 삭제됨", id);
		return "redirect:/";
	}

}
