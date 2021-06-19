package com.as.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Locale;

import com.as.dto.Member;
import com.as.mapper.MemberMapper;
import com.as.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FrontController {

	@Autowired
	MemberService memberService;

	@Autowired
	MemberMapper memberMapper;

	@RequestMapping("/index")
	public String idex(Model model, Principal p) {
		model.addAttribute("name", p.toString().split(",")[2].split("=")[1]); // 회원 이름
		
		return "user/index";
	}

	@RequestMapping({"/", "/login"})
	public String login(Model model) {

		return "user/login";
	}

	@RequestMapping("/user/mypages")
	public String mypages(Model model, Principal p) throws Exception {
		String[] strArr = p.toString().split(",");
		SimpleDateFormat KST = new SimpleDateFormat("E MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
        // 여기에 원하는 포맷을 넣어주면 된다
        SimpleDateFormat NOW = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);

		model.addAttribute("name", strArr[2].split("=")[1]); // 회원 이름
		model.addAttribute("snum", p.getName());
		model.addAttribute("email", strArr[4].split("=")[1]);
		model.addAttribute("first", memberMapper.findMajorAtId(Integer.parseInt(strArr[5].split("=")[1])));
		model.addAttribute("sec", memberMapper.findMajorAtId(Integer.parseInt(strArr[6].split("=")[1])));
		model.addAttribute("signup_date", NOW.format(KST.parse(strArr[7].split("=")[1])));

		return "user/mypages";
	}
}
