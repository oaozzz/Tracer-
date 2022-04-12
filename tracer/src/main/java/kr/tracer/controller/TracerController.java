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
import kr.tracer.entity.Car;
import kr.tracer.entity.Pothole;
import kr.tracer.mapper.AdminMapper;
import kr.tracer.mapper.CarMapper;

@Controller
public class TracerController {

	@Autowired
	private TracerController AdminMapper;
	private TracerController CarMapper;
	
	@RequestMapping("/main.do")
	public String main(Model model) {
		return "main";
	}
	
	@RequestMapping("/Login.do")
	public String login(Admin avo) {
		return "Login";
	
	}
	
	@RequestMapping("/Car.do")
	public String car(Car cvo) {
		return "Car";
	}
	@RequestMapping("/Pothole.do")
	public String pothole(Pothole pvo) {
		return "Pothole";
	}
	


}
