package com.kanishka.rms.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanishka.rms.dto.UserDTO;
import com.kanishka.rms.entity.Contact;
import com.kanishka.rms.entity.User;
import com.kanishka.rms.exception.UserAlreadyExistsException;
import com.kanishka.rms.exception.UserNotFoundException;
import com.kanishka.rms.model.UserType;
import com.kanishka.rms.repo.ContactRepository;
import com.kanishka.rms.repo.UserRepository;

@Service
public class UserService {
    @Autowired
    private final UserRepository userRepository;
    @Autowired
    private final ContactRepository contactRepository;

    public UserService(UserRepository userRepository, ContactRepository contactRepository) {
        this.userRepository = userRepository;
        this.contactRepository = contactRepository;
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

    public void update(UserDTO userDTO) throws Exception {
        Optional<User> optionalUser = userRepository.findByUsername(userDTO.getUsername());

        if(optionalUser.isEmpty()) {
            throw new UserNotFoundException("The user is not found!");
        }

        User user = optionalUser.get();
        user.setFname(userDTO.getFname());
        user.setLname(userDTO.getLname());
        user.setPassword(userDTO.getPassword());
        user.setUserType(UserType.valueOf(userDTO.getUsertype()));

        if(userRepository.save(user) == null) {
            throw new Exception("Something went wrong! Please try again later.");
        }
    }

    public void update(User user, String mobile, String address) throws Exception {
        Optional<User> optionalUser = userRepository.findByUsername(user.getUsername());

        if(optionalUser.isEmpty()) {
            throw new UserNotFoundException("User not found");
        }

        Contact contact = new Contact();
        contact.setCustomer(optionalUser.get());
        contact.setMobile(mobile);
        contact.setAddress(address);

        if(contactRepository.save(contact) == null) {
            throw new Exception("Something went wrong! Please try again later.");
        }
    }

    public User findById(Long id) throws UserNotFoundException {
        Optional<User> optionalUser = userRepository.findById(id);

        if(optionalUser.isEmpty()) {
            throw new UserNotFoundException("User not found.");
        }

        return optionalUser.get();
    }

    public List<UserDTO> findAll() {
        List<UserDTO> userDTOList = new ArrayList<>();

        for(User user : userRepository.findAll()) {
            UserDTO userDTO = new UserDTO();
            userDTO.setFname(user.getFname());
            userDTO.setLname(user.getLname());
            userDTO.setUsername(user.getUsername());
            userDTO.setUsertype(user.getUserType().toString());

            userDTOList.add(userDTO);
        }

        return userDTOList;
    }
}
