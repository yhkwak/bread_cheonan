package com.bread.service.Review;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@Slf4j
@Service("rDownload")
public class ReviewDownloadService implements ReviewService {
    @Override
    public void download(String originfile_name, String savefile_name, HttpServletRequest request, HttpServletResponse response) {

        String uploadPath = request.getServletContext().getRealPath("resources/uploads");
        File downloadFile = new File(uploadPath, savefile_name);

        try (InputStream is = new FileInputStream(downloadFile);
             OutputStream os = response.getOutputStream();) {
            String client = request.getHeader("User-Agent");

            if (client.indexOf("WOW64") == -1) {
                originfile_name = new String(originfile_name.getBytes("UTF-8"), "ISO-8859-1");
            } else {
                originfile_name = new String(originfile_name.getBytes("KSC5601"), "ISO-8859-1");
            }

            response.reset();
            response.setContentType("application/octet-stream");//파일 다운로드를 위한 MIME 설정
            response.setHeader("Content-Disposition", "attachment; filename=\""+originfile_name+"\"");
            response.setHeader("Content-Length", ""+downloadFile.length());

            byte [] buffer = new byte[(int)downloadFile.length()];
            int readBuffer = 0;
            while((readBuffer = is.read(buffer)) > 0){
                os.write(buffer, 0, readBuffer);;
                log.info("readBuffer={}",readBuffer);
            }


        } catch (Exception e) {
            log.info("다운로드 중 예외 발생");
        }
    }
}
