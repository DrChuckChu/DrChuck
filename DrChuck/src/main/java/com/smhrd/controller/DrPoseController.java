package com.smhrd.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;

// import org.apache.commons.io.FilenameUtils; // 제거
// import org.apache.tomcat.util.codec.binary.StringUtils; // 제거
// import org.json.JSONObject; // 제거

// 추가
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.entity.DrMember;
import com.smhrd.entity.DrPose;
import com.smhrd.repository.DrPoseRepository;

@Controller // 추가: 이 클래스가 컨트롤러임을 나타내는 어노테이션
public class DrPoseController {

	@Autowired
	private DrPoseRepository drPoseRepository;
	
	private static final String UPLOAD_DIRECTORY = "C:\\Users\\USER\\git\\DrChuckChu\\DrChuck\\src\\main\\resources\\static\\images\\pose";
	private static final String RESULT_DIRECTORY = "C:\\Users\\USER\\git\\DrChuckChu\\DrChuck\\src\\main\\resources\\static\\images\\resultpose";

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String uploadImage(@RequestParam("fImg") MultipartFile fImg, @RequestParam("sImg") MultipartFile sImg,
			@RequestParam("dpId") String dpId, HttpSession session) {

		if (fImg.isEmpty() || sImg.isEmpty()) {
			throw new RuntimeException("Both images must be provided.");
		}

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMddHHmmss");
		String dayday = dateFormat.format(new Date());

		String[] prefixes = { "F_", "S_" };

		handleFileUpload(fImg, dpId, dayday, prefixes[0]);
		handleFileUpload(sImg, dpId, dayday, prefixes[1]);

		try {
			Thread.sleep(3000); // Delay for 3 seconds to ensure the image file is saved.
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return "redirect:/uploadRe";
	}

	private void handleFileUpload(MultipartFile file, String dpId, String dayday, String prefix) {
		String originalFilename = org.springframework.util.StringUtils.cleanPath(file.getOriginalFilename());
		String fileExtension = FilenameUtils.getExtension(originalFilename);
		String filename = prefix + dpId + "_" + dayday + "." + fileExtension;

		Path uploadPath = Paths.get(UPLOAD_DIRECTORY);
		Path filePath = uploadPath.resolve(filename);

		try {
			file.transferTo(filePath.toFile());

			DrPose drPose = new DrPose();
			drPose.setDpId(dpId);

			String relativePath = "/images/pose/" + filename;
			drPose.setDpImg(relativePath);

			if (prefix.equals("S_")) {
				drPose.setDpStat("S");
			} else if (prefix.equals("F_")) {
				drPose.setDpStat("F");
			}
			drPoseRepository.save(drPose);

			RestTemplate restTemplate = new RestTemplate();
			String flaskUrl = "http://172.30.1.55:5000/upload"; // Flask 서버의 URL을 입력해주세요.

			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.MULTIPART_FORM_DATA);

			MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
			body.add("image", new FileSystemResource(filePath.toFile()));

			HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(body, headers);

			ResponseEntity<String> response = restTemplate.exchange(flaskUrl, HttpMethod.POST, requestEntity,
					String.class);
			System.out.println("Response from Flask server: " + response.getBody());

			// Base64 문자열 디코딩하여 바이트 배열 얻기
			byte[] decodedBytes = Base64.getDecoder().decode(response.getBody());

			// 디코딩된 이미지를 결과 디렉토리에 저장
			String outputFilename = prefix + dpId + "_" + dayday + ".jpg"; // 확장자를 jpg로 고정하였습니다.
			Path outputPath = Paths.get(RESULT_DIRECTORY, outputFilename);

			// 디코딩된 바이트 배열을 BufferedImage로 변환
			ByteArrayInputStream bais = new ByteArrayInputStream(decodedBytes);
			BufferedImage bufferedImage = ImageIO.read(bais);

			// BufferedImage를 이미지 파일로 저장
			ImageIO.write(bufferedImage, "jpg", outputPath.toFile());

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@GetMapping("/uploadRe")
	@ResponseBody
	public List<DrPose> getUploadRe(HttpSession session) {
		DrMember user = (DrMember) session.getAttribute("user");
		String userId = user.getDmId();
		List<DrPose> imagesList = drPoseRepository.findTop2ByDpIdOrderByDpIdxDesc(userId);
		System.out.println("이미지에는 뭐가 들어갈까? : " + imagesList);

		return imagesList;
	}

	
	@GetMapping("/feedImg")
	@ResponseBody
	public List<DrPose> getFeedImg(HttpSession session) {
		DrMember user = (DrMember) session.getAttribute("user");
		String userId = user.getDmId();
		List<DrPose> imagesList = drPoseRepository.findTop2ByDpIdOrderByDpIdxDesc(userId);
		System.out.println("피드백에는 들어갈까? : " + imagesList);

		return imagesList;
	}
	
	@GetMapping("/resultImg")
	@ResponseBody
	public List<DrPose> getResultImg(HttpSession session) {
		DrMember user = (DrMember) session.getAttribute("user");
		String userId = user.getDmId();
		List<DrPose> imagesList = drPoseRepository.findTop2ByDpIdOrderByDpIdxDesc(userId);
		System.out.println("결과이미지는 들어갈까? : " + imagesList);

		return imagesList;
	}
	
	
}