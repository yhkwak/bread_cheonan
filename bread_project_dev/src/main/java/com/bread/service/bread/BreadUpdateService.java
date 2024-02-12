package com.bread.service.bread;


import com.bread.app.dao.BreadDAO;
import com.bread.app.vo.BreadVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;


@Slf4j
@Service("bUpdate")
@AllArgsConstructor
public class BreadUpdateService implements BreadService {

    private BreadDAO dao;

    @Override
    public int update(BreadVO vo, HttpServletRequest request) {
        int result = 0;

        MultipartFile uploadFile = vo.getUploadFile();

        if (uploadFile.getSize() != 0) {

            String originFileName = uploadFile.getOriginalFilename();
            String ext = originFileName.substring(originFileName.lastIndexOf("."));
            String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
            String saveFileName = now + ext;

            // 서블릿 컨텍스트의 실제 경로를 기반으로 업로드 경로를 설정합니다.
            String saveDirectory = request.getServletContext().getRealPath("resources/uploads/");
            String fullPath = saveDirectory + saveFileName;

            try {
                uploadFile.transferTo(new File(fullPath));
            } catch (Exception e) {
                System.out.println("파일 저장 중 예외 발생");
                e.printStackTrace();
            }
            //3. 다른 폼의 전달값을 BoardVO에 저장하기
            vo.setBread_img(originFileName);
            vo.setBread_img_save(saveFileName);
        }

        result = dao.update(vo);

        return result;
    }
}