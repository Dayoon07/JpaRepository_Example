package com.e.d.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.e.d.model.entity.UserEntity;
import com.e.d.model.repository.UserRepository;

import jakarta.transaction.Transactional;

@Controller
@Transactional
public class MainController {
    private static final Logger LOGGER = LoggerFactory.getLogger(MainController.class);

    @Autowired
    private UserRepository repository;
    
    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/select")
    public String fff(Model model) {
    	model.addAttribute("selectAll", repository.findAll());
        return "test/select";
    }
    
    @PostMapping("/insertIntoTESTUESR")
    public String plusTableTestuser(@ModelAttribute UserEntity entity) {
    	repository.save(entity);
    	return "redirect:/select";
    }
    
    @PostMapping("/deleteRecord")
    public String deleteRecord(@RequestParam UserEntity ID) {
    	repository.delete(ID);
    	return "redirect:/select";
    }
    
    @GetMapping("/update/{id}")
    public String updateList(@PathVariable int id, Model model) {
        model.addAttribute("userentityinfo", repository.findById(id).orElse(null));
        model.addAttribute("updateBottomList", repository.findAll());
        return "test/update";
    }
    
    @PostMapping("/updating/{id}")
    public String updateUser(@PathVariable int id, @ModelAttribute UserEntity updatedUser) {
        UserEntity user = repository.findById(id).orElse(null);
        if (user != null) {
            // 직접 필드를 수정
            user.setUsername(updatedUser.getUsername());
            user.setUseremail(updatedUser.getUseremail());
            user.setUserpassword(updatedUser.getUserpassword());
        }
        // save() 호출 시 상태가 관리되고 있으므로 변경 사항이 반영됨
        repository.save(user);
        return "redirect:/select";
    }
    
    
}
