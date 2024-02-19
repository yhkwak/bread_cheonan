package com.bread.service.Review;


import com.bread.app.dao.ReviewDAO;
import com.bread.app.vo.ReviewVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
@Slf4j
@Service("rUpdate")
@AllArgsConstructor
public class ReviewUpdateService implements ReviewService {

    private ReviewDAO dao;

    @Override
    public int update(ReviewVO vo, HttpServletRequest request) {
        int result = 0;

        MultipartFile uploadFile = vo.getUploadFile();

        if (uploadFile.getSize() != 0) {

            String originFileName = uploadFile.getOriginalFilename();
            String ext = originFileName.substring(originFileName.lastIndexOf("."));
            String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
            String saveFileName = now+ext;

            String saveDirectory = request.getServletContext().getRealPath("resources/uploads/");
            String fullPath = saveDirectory + saveFileName;


            try {
                uploadFile.transferTo(new File(fullPath));
            } catch (IOException e) {
                log.info("파일 저장 중 예외 발생");
            }
            //3. 다른 폼의 전달값을 BoardVO에 저장하기
            vo.setOriginfile_name(originFileName);
            vo.setSavefile_name(saveFileName);
        }

        result = dao.update(vo);

        return result;

    }
}
