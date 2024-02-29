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
@Service("bakeryJoin")
public class BakeryJoinService implements BakeryService {
    
    private BakeryDAO dao;
    
    @Override
    public int join(BakeryVO bakeryVO, HttpServletRequest request) {
        
        int result = 0; // 회원가입 실패시 결과값
        MultipartFile uploadFile = bakeryVO.getUploadFile();
        
        if (uploadFile.getSize() != 0) { // 게시글 등록시 파일을 업로드한 경우

            // 1.저장 디렉터리에 저장할 새로운 파일명 만들기
            String originFileName = uploadFile.getOriginalFilename();
            String ext = originFileName.substring(originFileName.lastIndexOf("."));
            String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
            String saveFileName = now + ext;

            // 2.지정된 경로에 파일 저장하기
            String saveDirectory = request.getServletContext().getRealPath("resources/uploads/");
            String fullPath = saveDirectory + saveFileName;

            try {
                uploadFile.transferTo(new File(fullPath));
            } catch (Exception e) {
                System.out.println("파일 저장 중 예외 발생");
                e.printStackTrace();
            }

            bakeryVO.setBakery_img(originFileName);
            bakeryVO.setBakery_img_save(saveFileName);
        }
        
        try {
            result = dao.join(bakeryVO);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return result;
    }
}