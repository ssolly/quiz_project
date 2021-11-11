package com.care.root.testboard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardTest {

	@GetMapping("test/board")
	public String testBoard() {
		return "test/board";
	}
}
