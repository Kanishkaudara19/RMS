package com.kanishka.rms.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.kanishka.rms.dto.FoodDTO;
import com.kanishka.rms.entity.User;
import com.kanishka.rms.model.UserType;
import com.kanishka.rms.service.FoodService;
import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/food")
public class FoodController {
    @Autowired
    private final FoodService foodService;

    public FoodController(FoodService foodService) {
        this.foodService = foodService;
    }

    @PostMapping("/insert")
    public ResponseEntity<String> insertFood(@RequestPart("food") FoodDTO foodDTO,
                                             @RequestPart("image") MultipartFile image,
                                             HttpServletRequest request) {
        try {
            // Save image
            String filename = saveImage(image, request);

            // Insert food
            foodDTO.setAvailable(1);
            foodDTO.setThumbnailUrl(filename);
            foodService.insert(foodDTO);

            return ResponseEntity.ok("Food is added successfully!");
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Something went wrong! Please try again later.");
        }
    }

    private static String saveImage(MultipartFile image, HttpServletRequest request) throws IOException {
        String uploadDir = "/uploads/foods/";
        String realUploadPath = request.getServletContext().getRealPath(uploadDir);

        if(!new File(realUploadPath).exists()) {
            boolean mkdir = new File(realUploadPath).mkdir();
        }
        String filname = System.currentTimeMillis() +"-"+ image.getOriginalFilename() ;
        filname = filname.replace(' ', '-');

        File destination = new File(realUploadPath + filname);
        image.transferTo(destination);

        return filname;
    }

    @GetMapping("/all")
    public ResponseEntity<List<FoodDTO>> getAllFoods(HttpServletRequest request) {
        List<FoodDTO> foodDTOList;

        UserType userType = ((User) request.getSession().getAttribute("user")).getUserType();

        if(userType == UserType.CUSTOMER) {
            foodDTOList = foodService.findAll(true);
        } else {
            foodDTOList = foodService.findAll(false);
        }

        return ResponseEntity.ok().body(foodDTOList);
    }
}
