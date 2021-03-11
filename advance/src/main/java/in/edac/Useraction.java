package in.edac;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user")
public class Useraction {

	
	@Autowired
	UserRepository userrepository;
	
	@GetMapping("/")
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView("register");
		return mv;
	}
	
	@GetMapping("show1")
	public ModelAndView show1() {
		ModelAndView mv = new ModelAndView("show");
		return mv;
	}
	@PostMapping("/re")
	public ModelAndView create(User user) {
		userrepository.save(user);
		
		ModelAndView mv = new ModelAndView("register");
		return mv;
	}
	
	@GetMapping("show")
	public ModelAndView show() {
		ModelAndView mv = new ModelAndView("register");
		return mv;
	}
	
	@GetMapping("/s{id}")
	public User single(@PathVariable int id) {
return userrepository.findById(id).get();}
	
	@GetMapping("/a")
	public List<User> all() {
return userrepository.findAll();
}

@PutMapping("/{id}")
public void update(@PathVariable int id ,User user){
	userrepository.save(user);

}
@DeleteMapping("/{id}")
public String delte(@PathVariable int id) {
	userrepository.deleteById(id);
	return "suceess";
}


	}

