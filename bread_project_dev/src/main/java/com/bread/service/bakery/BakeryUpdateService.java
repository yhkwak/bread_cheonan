package com.bread.service.bakery;

import java.io.File;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bread.app.dao.BakeryDAO;
import com.bread.app.vo.BakeryVO;

import lombok.AllArgsConstructor;


@AllArgsConstructor
@Service("bakeryUpdate")
public class BakeryUpdateService implements BakeryService {
	
	private BakeryDAO dao;
	
	@Override
	public BakeryVO update(BakeryVO bakeryVO, HttpServletRequest request) {
		// 파일 업로드 처리
				MultipartFile uploadFile = bakeryVO.getUploadFile();

				if(uploadFile != null && !uploadFile.isEmpty()) {
					String originFileName = uploadFile.getOriginalFilename();

					System.out.println("originFileName: "+originFileName);

					String ext = originFileName.substring(originFileName.lastIndexOf("."));
					String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
					String saveFileName = now + ext;

					System.out.println("saveFileName: "+saveFileName);

//					String saveDirectory = "resources/uploads/";
					String saveDirectory = request.getServletContext().getRealPath("resources/uploads/");
					
					System.out.println("saveDirectory: "+saveDirectory);
					
					String fullPath = saveDirectory + saveFileName;

					try {
						uploadFile.transferTo(new File(fullPath));
						bakeryVO.setBakery_img(originFileName);
						bakeryVO.setBakery_img_save(saveFileName);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}

		BakeryVO newVO = null;
		
		try {
			newVO=dao.update(bakeryVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return newVO;
	}

}
