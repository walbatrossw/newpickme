package com.cafe24.newpickme.commons.fileupload;

import org.springframework.util.FileCopyUtils;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

public class UploadFileUtils {
    // 파일저장
    public static String uploadFile(String uploadRootPath, String originalName, byte[] fileData) throws Exception {
        // UUID 발급
        UUID uuid = UUID.randomUUID();
        // 저장할 파일명
        String savedName = uuid.toString() + "_" + originalName;
        // 업로드 디렉토리(날짜별) 생성
        String calcPath = calcPath(uploadRootPath);
        // 파일경로(기존의 업로드경로+날짜별 경로), 파일명을 받아 파일 객체 생성
        File target = new File(uploadRootPath + calcPath, savedName);
        // 임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 저장
        FileCopyUtils.copy(fileData, target);
        return calcPath + File.separator +savedName;
    }

    // 날짜별 디렉토리 추출
    private static String calcPath(String uploadRootPath) {
        Calendar calendar = Calendar.getInstance();
        String yearPath = File.separator + calendar.get(Calendar.YEAR); // 연도
        String monthPath = yearPath + File.separator + new DecimalFormat("00").format(calendar.get(Calendar.MONTH) + 1 ); // 월
        String datePath = monthPath + File.separator + new DecimalFormat("00").format(calendar.get(Calendar.DATE)); // 일
        makeDir(uploadRootPath, yearPath, monthPath, datePath); // 디렉토리 생성메서드 호출
        return datePath;
    }

    // 디렉토리 생성
    private static void makeDir(String uploadRootPath, String ... paths) {
        // 디렉토리가 존재하면
        if (new File(paths[paths.length - 1 ]).exists()) {
            return;
        }
        // 디렉토리가 존재하지 않으면 디렉토리 생성
        for (String path : paths) {
            File dirPath = new File(uploadRootPath + path);
            if (!dirPath.exists()) {
                dirPath.mkdir();
            }
        }
    }
}
