package com.kanishka.rms.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanishka.rms.dto.UserDTO;
import com.kanishka.rms.entity.User;
import com.kanishka.rms.exception.UserAlreadyExistsException;
import com.kanishka.rms.exception.UserNotFoundException;
import com.kanishka.rms.model.UserType;
import com.kanishka.rms.repo.UserRepository;

@Service
public class UserService {
    @Autowired
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void register(UserDTO userDTO) throws Exception {
        Optional<User> optionalUser = userRepository.findByUsername(userDTO.getUsername());

        if(optionalUser.isPresent()) {
            throw new UserAlreadyExistsException("This username is already used by another user.");
        }

        User user = new User();
        user.setFname(userDTO.getFname());
        user.setLname(userDTO.getLname());
        user.setUsername(userDTO.getUsername());
        user.setPassword(userDTO.getPassword());
        user.setUserType(UserType.valueOf(userDTO.getUsertype()));

        if(userRepository.save(user) == null) {
            throw new Exception("Something went wrong! Please try again later.");
        }
    }

    public User login(String username, String password) throws UserNotFoundException {
        Optional<User> optionalUser = userRepository.findByUsernameAndPassword(username, password);

        if(optionalUser.isPresent()) {
            return optionalUser.get();
        } else {
            throw new UserNotFoundException("Wrong username or password!");
        }
    }
}
