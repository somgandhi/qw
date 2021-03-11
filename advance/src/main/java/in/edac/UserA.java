package in.edac;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/user1")
public class UserA {

	
	@Autowired
	UserRepository userrepository;
	
	
	
	
	
	@GetMapping("/s{id}")
	public User single(@PathVariable int id) {
return userrepository.findById(id).get();}
	
	@GetMapping("/a")
	public List<User> all() {
return userrepository.findAll();
}

@PutMapping("/{id}")
public String update(@PathVariable int id ,User user){
	userrepository.save(user);
	return "sucess";
}
@DeleteMapping("/{id}")
public String delte(@PathVariable int id) {
	userrepository.deleteById(id);
	return "suceess";
}


	}

