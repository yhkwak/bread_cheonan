package com.bread.service.member;

import java.io.File;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bread.app.dao.MemberDAO;
import com.bread.app.vo.MemberVO;

import lombok.AllArgsConstructor;

@Service("mUpdate")
@AllArgsConstructor
public class MemberUpdateService implements MemberService {

	private MemberDAO dao;

	@Override
	public MemberVO update(MemberVO memberVO, HttpServletRequest request) {

		// 파일 업로드 처리
		MultipartFile uploadFile = memberVO.getUploadFile();

		if(uploadFile != null && !uploadFile.isEmpty()) {
			String originFileName = uploadFile.getOriginalFilename();

			System.out.println("originFileName: "+originFileName);

			String ext = originFileName.substring(originFileName.lastIndexOf("."));
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			String saveFileName = now + ext;

			System.out.println("saveFileName: "+saveFileName);

//			String saveDirectory = "resources/uploads/";
			String saveDirectory = request.getServletContext().getRealPath("resources/uploads/");
			
			System.out.println("saveDirectory: "+saveDirectory);
			
			String fullPath = saveDirectory + saveFileName;

			try {
				uploadFile.transferTo(new File(fullPath));
				memberVO.setMember_img(originFileName);
				memberVO.setMember_img_save(saveFileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 데이터베이스 업데이트
		MemberVO newVO = null;
		try {
			newVO = dao.updateMember(memberVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return newVO;
	}
}