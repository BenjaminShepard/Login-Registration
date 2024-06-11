package com.codingdojo.loginreg.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.loginreg.models.LoginUser;
import com.codingdojo.loginreg.models.User;
import com.codingdojo.loginreg.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	UserRepository uRepo;
	
	public User register(User newUser, BindingResult result) {
		
		Optional<User> potentialUser = uRepo.findByEmail(newUser.getEmail());
		
		if(potentialUser.isPresent()) {
			result.rejectValue("email", "matches", "An account already exists please sign in." );
		}
		if(!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "matches", "Confirm password and password must match." );
		}
		
		if(result.hasErrors()) {
			return null;
		}
		
		String hashedPass= BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashedPass);
		return uRepo.save(newUser);
	}
	public User login(LoginUser newLoginUser, BindingResult result) {
		Optional<User> potentialUser = uRepo.findByEmail(newLoginUser.getEmail());
		if(!potentialUser.isPresent()) {
			result.rejectValue("email", "matches", "Invalid Email/Passsword");
			return null;
		}
		
		User user = potentialUser.get();
		if(!BCrypt.checkpw(newLoginUser.getPassword(), user.getPassword())) {
			result.rejectValue("password", "matches", "Invalid Email/Password");
			return null;
		}
		if(result.hasErrors()) {
			return null;
		}
		return user;
	}
	public User getUserById(Long id) {
		Optional<User> user=uRepo.findById(id);
		if(user.isPresent()) {
			return user.get();
		} else {
			return null;
		}
	}
}
