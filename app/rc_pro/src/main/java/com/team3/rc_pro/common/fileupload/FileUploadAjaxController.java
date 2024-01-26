package com.team3.rc_pro.common.fileupload;

import java.io.File;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadAjaxController {

	private static final Logger logger = LoggerFactory.getLogger(FileUploadAjaxController.class);
	
	//저장경로 (Windows 환경이므로 경로구분자를 \\로 지정)
	private String uploadFileRepoDir = "C:\\Users\\soldesk\\Desktop\\Spring\\upload" ;

	//업로드 요청 파일-저장 및 결과 메시지 전송
	@PostMapping(value = "/board/register/fileUploadAjaxAction", produces = {"text/plain; charset=UTF-8"})
	public @ResponseBody String fileUploadActionPost(MultipartFile[] uploadFiles) {//Ajax사용 시 Model 필요없슴

		logger.info("====FileUpload With Ajax ========");
		
		for(MultipartFile multipartUploadFile : uploadFiles) {
			logger.info("=================================");
			logger.info("Upload File Name: "+ multipartUploadFile.getOriginalFilename());
			logger.info("Upload File Size: "+ multipartUploadFile.getSize());

			//업로드파일이름 원본문자열
			String strUploadFileName = multipartUploadFile.getOriginalFilename();
 
			//[Edge, IE 오류 해결] multipartUploadFile.getOriginalFilename()에서 업로드 파일이름만 추출
			//파일이름만 있는 경우, 파일이름만 추출됨
			 strUploadFileName = strUploadFileName.substring(strUploadFileName.lastIndexOf("\\")+1);
			 logger.info("수정된 파일이름(strUploadFileName): " + strUploadFileName);
 
			 //업로드 정보(저장폴더와 파일이름 문자열)의 파일객체 생성
			 File saveUploadFile = new File(uploadFileRepoDir, strUploadFileName);
			 logger.info("저장시 사용되는 파일이름(saveUploadFile, 경로포함): " + saveUploadFile);
			 
			 try {
			 //서버에 파일객체를 이용하여 업로드 파일 저장
				 multipartUploadFile.transferTo(saveUploadFile);
			 } catch (Exception e) {
				 logger.error(e.getMessage());
			 }
		} // End-for
		
		return "파일업로드 성공";
	}
}
