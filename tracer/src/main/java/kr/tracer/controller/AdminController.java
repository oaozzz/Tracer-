package kr.tracer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.tracer.entity.Admin;
import kr.tracer.mapper.AdminMapper;

@Controller
public class AdminController {

	@Autowired
	private AdminMapper adminMapper;
	
	@GetMapping("/main.do")
	public String main() {
		return "main";
	}
	
	@PostMapping("/login.do")
	public String login(Admin avo, HttpServletRequest request) {
		Admin theVo = adminMapper.adminLogin(avo);
		if (theVo != null) {
			HttpSession session = request.getSession();
			session.setAttribute("avo", theVo);
		}
		return "redirect:/main.do";
	}
	@PostMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/main.do";
	}
}
