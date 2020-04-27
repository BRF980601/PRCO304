package cn.bjsxt.controller;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import cn.bjsxt.pojo.Car;
import cn.bjsxt.service.CarService;

class CarConrollerTest extends CarConroller {

	@Autowired
	private CarService carservice;
	@Test
	void test() {
		Car car = new Car("9", "SUV1","梅赛德斯", "粉色", 10.0, 100.0, 1000.0,"isrenting"," img", "description","problem");
		System.out.println(car);
		addCar();
	}

}
