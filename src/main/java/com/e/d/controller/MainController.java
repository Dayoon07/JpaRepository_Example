package com.e.d.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.transaction.annotation.Transactional;

import com.e.d.model.entity.UserEntity;
import com.e.d.model.repository.UserRepository;

@Controller
@Transactional
public class MainController {
	
	private static final Logger log = LoggerFactory.getLogger(MainController.class);

    @Autowired
    private UserRepository repository;
    
    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/select")
    public String fff(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "15") int size,
            Model model) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(Sort.Direction.DESC, "ID"));
        Page<UserEntity> pagination = repository.findAll(pageable);

        StringBuilder pageBar = new StringBuilder();
        pageBar.append("<nav aria-label=\"Page navigation example\">\n\t\t\t\t<ul class=\"inline-flex -space-x-px text-lg my-10\">\n\t\t\t\t");

        // 이전 버튼
        if (pagination.hasPrevious()) {
            pageBar.append("<li><a href=\"/select?page=" + (pagination.getNumber() - 1) + "\" class=\"flex items-center justify-center px-3 h-10 leading-tight text-gray-500 bg-white border border-gray-300 rounded-l-lg hover:bg-gray-100 hover:text-gray-700\">이전</a></li>");
        }

        // 페이지 범위 설정
        int startPage = Math.max(0, page - 5);
        int endPage = Math.min(pagination.getTotalPages(), page + 5);

        for (int i = startPage; i < endPage; i++) {
            if (i == pagination.getNumber()) {
                pageBar.append("<li><a href=\"/select?page=" + i + "\" aria-current=\"page\" class=\"flex items-center justify-center px-5 h-10 text-blue-600 border border-gray-300 bg-blue-50 w-8\">" + (i + 1) + "</a></li>\n");
            } else {
                pageBar.append("<li><a href=\"/select?page=" + i + "\" class=\"flex items-center justify-center px-5 h-10 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 w-8\">" + (i + 1) + "</a></li>\n");
            }
        }

        // 다음 버튼
        if (pagination.hasNext()) {
            pageBar.append("<li><a href=\"/select?page=" + (pagination.getNumber() + 1) + "\" class=\"flex items-center justify-center px-3 h-10 leading-tight text-gray-500 bg-white border border-gray-300 rounded-r-lg hover:bg-gray-100 hover:text-gray-700\">다음</a></li>\n");
        }

        pageBar.append("</ul>\n\t\t\t</nav>");

        model.addAttribute("pageBar", pageBar.toString());
        model.addAttribute("users", pagination.getContent()); // 수정된 부분: 페이지네이션 데이터 전달
        model.addAttribute("cl", "/"); // 컨텍스트 경로를 전달
        return "test/select";
    }
    
    @PostMapping("/insertIntoTESTUSER")
    public String plusTableTestuser(@ModelAttribute UserEntity entity) {
        repository.save(entity);
        log.info("{}", entity);
        return "redirect:/select";
    }
    
    @PostMapping("/deleteRecord")
    public String deleteRecord(@RequestParam int ID) {
        UserEntity user = repository.findById(ID).orElse(null);
        if (user != null) {
            repository.delete(user);
            log.info("고유 식별자 : " + ID + "를 가진 레코드가 삭제되었습니다.");
        }
        return "redirect:/select";
    }
    
    @PostMapping("/deleteTable")
    public String deleteTable() {
    	repository.deleteAll();
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
            user.setUsername(updatedUser.getUsername());
            user.setUseremail(updatedUser.getUseremail());
            user.setUserpassword(updatedUser.getUserpassword());
        }
        repository.save(user);
        log.info("{}", user + "가 새롭게 업데이트 되었습니다.");
        return "redirect:/select";
    }
    
}
