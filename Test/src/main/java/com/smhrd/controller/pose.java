package com.smhrd.controller;
/*
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.util.StringUtils;
import org.springframework.core.io.ResourceLoader;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.smhrd.entity.DrMember;
import com.smhrd.entity.DrPose;
import com.smhrd.repository.DrMemberRepository;
import com.smhrd.repository.DrPoseRepository;


// JSON 처리를 위한 import
import com.fasterxml.jackson.databind.ObjectMapper; 


@Controller
public class pose{
	
	
    @Autowired
    private DrPoseRepository drPoseRepository;
    


    private static final String UPLOAD_DIRECTORY = "C:\\eGovFrame-4.0.0\\workspace.edu\\Test\\src\\main\\resources\\static\\images\\pose";

    @RequestMapping(value="/upload", method=RequestMethod.POST)
    public String uploadImage(
        @RequestParam("fImg") MultipartFile fImg,
        @RequestParam("sImg") MultipartFile sImg,
        @RequestParam("dpId") String dpId,
        RedirectAttributes redirectAttrs) {

    	if (fImg.isEmpty() || sImg.isEmpty()) {
    		   throw new RuntimeException("Both images must be provided.");
    		}
    	
    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMddHHmmss");
    	String dayday = dateFormat.format(new Date());

    	String[] prefixes = {"F_", "S_"};

    	// Handle front image
    	handleFileUpload(fImg, dpId, dayday, prefixes[0]);

    	// Handle side image
    	handleFileUpload(sImg, dpId, dayday, prefixes[1]);

    	List<DrPose> imagesList = drPoseRepository.findTop2ByDpIdOrderByDpIdxDesc(dpId);

    	redirectAttrs.addFlashAttribute("images", imagesList);
    	
    	try {
    	    // Delay for 2 seconds
    	    Thread.sleep(3000);
    	} catch (InterruptedException e) {
    	    e.printStackTrace();
    	}
    	return "redirect:/goTest";
    }

    private void handleFileUpload(MultipartFile file,String dpId,String dayday,String prefix){
         String originalFilename = StringUtils.cleanPath(file.getOriginalFilename());
         String fileExtension = FilenameUtils.getExtension(originalFilename);
         String filename = prefix + dpId + "_" + dayday + "." + fileExtension;

         Path uploadPath = Paths.get(UPLOAD_DIRECTORY);
         Path filePath = uploadPath.resolve(filename);

         try{
             
        	 file.transferTo(filePath.toFile());

             DrPose drPose=new DrPose();
             drPose.setDpId(dpId); 

             String relativePath="/images/pose/" + filename;
             drPose.setDpImg(relativePath);

             if (prefix.equals("S_")) {
                 drPose.setDpStat("1");
             } else if (prefix.equals("F_")) {
                 drPose.setDpStat("0");
             }
             
             
             
             drPoseRepository.save(drPose);  
    	 } catch(IOException e){
    	     e.printStackTrace();
    	 }
    }
}    
 
*/