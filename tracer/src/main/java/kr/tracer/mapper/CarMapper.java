package kr.tracer.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;

import kr.tracer.entity.Car;

public interface CarMapper {

	public List<Car> carList();
	public void carInsert(Car cvo);
	public void carContent(int idx);
	
	@Delete("delete from t_board where idx=#{idx}")
	public void carDelete(int idx);

	


}
