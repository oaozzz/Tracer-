package kr.tracer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.tracer.entity.Car;
import kr.tracer.mapper.CarMapper;

//@RestController
public class TracerRestController {

//	@Autowired
//	private CarMapper carMapper;
//
//	@GetMapping("/t_board")
//	public List<Car> t_boardAjaxList() {
//		List<Car> tlist = carMapper.carList();
//		return tlist;
//	}
//
//	@PostMapping("/t_board")
//	public void t_boardAjaxInsert(Car cvo) {
//		carMapper.carInsert(cvo);
//	}
//
//	@DeleteMapping("/t_board{idx}")
//	public void t_boardAjaxDelete(@PathVariable int idx) {
//		carMapper.carDelete(idx);
//	}
}
