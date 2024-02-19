package com.bread.service.Review;


import com.bread.app.dao.ReviewDAO;
import com.bread.app.vo.ReviewVO;
import lombok.AllArgsConstructor;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.logging.SimpleFormatter;
@Slf4j
@Service("rInsert")
@AllArgsConstructor
public class ReviewInsertService implements ReviewService {

    private ReviewDAO dao;

    @Override
    public int insert(ReviewVO vo, HttpServletRequest request) {


        int result = 0;

        MultipartFile uploadFile = vo.getUploadFile();

        if(uploadFile.getSize() != 0) {//게시글 등록시 파일을 업로드한 경우

            //1.저장 디렉터리에 저장할 새로운 파일명
            String originFileName = uploadFile.getOriginalFilename();
            String ext = originFileName.substring(originFileName.lastIndexOf("."));
            String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
            String saveFileName = now+ext;

            //2.지정된 경로에 파일 저장
            String saveDirectory = request.getServletContext().getRealPath("resources/uploads/");
            String fullPath = saveDirectory + saveFileName;

            try {
                uploadFile.transferTo(new File(fullPath));
            } catch (IOException e) {
                log.info("파일 저장 중 예외 발생={}", e.getMessage(), e);
            }

            //3. 다른 폼의 전달값을 BoardVO에 저장
            vo.setOriginfile_name(originFileName);
            vo.setSavefile_name(saveFileName);
            log.info("파일이 저장된 경로={}", fullPath);
            log.info("저장된 파일 이름={}", saveFileName);
        }

        result = dao.insert(vo);

        return result;
    }

}
