package com.bread.service.bread;


import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
@Slf4j
@Service("bDownload")
public class BreadDownloadService implements BreadService {
    @Override
    public void download(String originfile_name, String savefile_name, HttpServletRequest request, HttpServletResponse response) {

        // 서블릿 컨텍스트를 통해 실제 경로를 얻습니다.
        String uploadPath = request.getServletContext().getRealPath("/resources/uploads/");
        File downloadFile = new File(uploadPath, savefile_name);

        try (InputStream is = new FileInputStream(downloadFile); // 저장된 파일에 대한 입력 스트림 생성
             OutputStream os = response.getOutputStream();) { // response 객체에 출력할 출력 스트림 얻음

            // 한글 파일명 깨짐 방지를 위한 처리
            String client = request.getHeader("User-Agent");
            if(client.indexOf("WOW64") == -1){
                originfile_name = new String(originfile_name.getBytes("UTF-8"), "ISO-8859-1");
            } else {
                originfile_name = new String(originfile_name.getBytes("KSC5601"), "ISO-8859-1");
            }

            // 파일 다운로드용 응답헤더 설정
            response.reset();
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + originfile_name + "\"");
            response.setHeader("Content-Length", ""+downloadFile.length());

            // 출력 스트림에 파일 내용 출력하기
            byte[] buffer = new byte[(int) downloadFile.length()];
            int readBuffer = 0;
            while((readBuffer = is.read(buffer)) > 0){
                os.write(buffer, 0, readBuffer);
                System.out.println("readBuffer: "+readBuffer);
                log.info("파일 다운로드 경로: {}", downloadFile.getAbsolutePath());
            }


        } catch (Exception e) {
            log.error("다운로드 중 예외 발생", e);
        }
    }
}
