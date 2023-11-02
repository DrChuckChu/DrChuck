package com.smhrd.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smhrd.entity.DrMember;
import com.smhrd.repository.DrMemberRepository;

@Controller
public class DrMemberController {

	
	@Autowired
	private DrMemberRepository repo;
	
	
	//로그인,회원가입 페이지
	@RequestMapping("/goLogin")
	public String goLogin() {
		return "loginpage";
	}
	
	//로그인,회원가입 페이지
		@RequestMapping("/goTest")
		public String goTest() {
			return "testMain_save";
		}

	// 아이디 찾기 페이지 이동
		@RequestMapping("/goFind")
		public String goFind() {
			return "find";
		}
	
	// 아이디 찾기
	@RequestMapping("/findId")
	@ResponseBody
	public String resultId(String dmName, String dmEmail, HttpSession session) {
		    DrMember dm = repo.findByDmNameAndDmEmail(dmName, dmEmail);
		    return (dm != null) ? dm.getDmId() : "";
		}
	// 비밀번호 찾기
	@RequestMapping("/findPw")
	@ResponseBody
	public String resultPw(String dmId, String dmEmail, HttpSession session) {
		DrMember dm = repo.findByDmIdAndDmEmail(dmId, dmEmail);
		return (dm != null) ? dm.getDmPw() : "";
	}
	
	// 메인페이지 이동
	@RequestMapping("/goMain")
	public String goMain() {
		
		return "main";
	}
	
		
	
	// 로그인기능
	@RequestMapping("/login")
	public String login(String dmId, String dmPw, HttpSession session, RedirectAttributes redirectAttrs) {
	    DrMember dm = repo.findByDmIdAndDmPw(dmId, dmPw);

	    System.out.println("로그인" + dmId + "/" + dmPw);

	    if (dm != null) {
	        session.setAttribute("user", dm);
	    } else {
	        System.out.println("로그인 실패");
	        String errorMessage = "로그인에 실패하였습니다. 다시 시도해 주세요.";
	        redirectAttrs.addFlashAttribute("errorMessage", errorMessage);
	        return "redirect:/goLogin";
	    }

	    return "redirect:/goMain";
	}

	// 회원가입 기능
	@RequestMapping("/join")
	public String join(@Validated DrMember dm, BindingResult bindingResult, Model model) {
		
		
		 // 아이디 중복 체크
	        if (repo.existsByDmId(dm.getDmId())) {
	            model.addAttribute("idError", "아이디가 이미 사용 중입니다.");
	            System.out.println("사용중 아이디");
	            return "redirect:/goLogin";
	        }
	        
	     // 이메일 중복 체크
	        if (repo.existsByDmEmail(dm.getDmEmail())) {
	            model.addAttribute("emailError", "이메일이 이미 사용 중입니다.");
	            System.out.println("사용중 이메일");
	            return "redirect:/goLogin";
	        }   
		 
		repo.save(dm);
		
		return "redirect:/goLogin";
	}
	
	
	// 업데이트 페이지 이동
	@RequestMapping("/goUpdate")
	public String goUpdate() {
		System.out.println("개인정보 업데트 간다리");
		return "update";
	}
	
	// 업데이트 페이지 기능
	@RequestMapping("/update")
	public String update(DrMember dr, HttpSession session) {
		
		
		
		DrMember user = repo.save(dr);
		// repo.save 이녀석은 엔터티를 받아서 엔터티를 넣어야함 string 원투, int 12하면 오류남
		session.setAttribute("user", user);
		System.out.println(user);
		System.out.println("업데이트 성공");
		
		
		return "redirect:/goMain";
		
	};
	
	
	@RequestMapping("/logOut")
	public String logOut(String dmId, HttpSession session) {
		
		session.invalidate();
		System.out.println("로그아웃 성공");
		
		return "redirect:/goLogin";
	}
	
	@RequestMapping("/goodBye")
	public String goodBye(HttpSession session) {
	    DrMember user  = (DrMember) session.getAttribute("user"); 

	    if (user != null) {
	    	String dmId = user.getDmId();
	        repo.deleteById(dmId);
	        session.removeAttribute("usere");
	        System.out.println("회원 탈퇴 성공");
	        return "redirect:/goLogin";
	    } else {
	        System.out.println("세션에서 dmId를 찾을 수 없습니다.");
	        return "redirect:/goFind"; 
	    }
	}

	
	

	
	
}
