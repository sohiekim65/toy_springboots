package com.study.toy_springboots.utils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class MangoUtils {
    public String getUniqueId() {
        UUID uuid = UUID.randomUUID();
        return uuid.toString();
    }

    // 파일 관련
    public List getAttachFiles(MultipartHttpServletRequest multipartHttpServletRequest
                    , @RequestParam Map<String, Object> params) {
        
        Iterator<String> fileNames = multipartHttpServletRequest.getFileNames();
        String relativePath = "C:\\Develops\\toy_springboots\\src\\main\\resources\\static\\files\\";

        Map attachfile = null;
        List attachfiles = new ArrayList<>();
        String physicalFileName = this.getUniqueId();
        String storePath = relativePath + physicalFileName + "\\";
        File newPath = new File(storePath);
        String originalFileName = null;
        newPath.mkdir();
        while(fileNames.hasNext()){
            String fileName = fileNames.next();
            MultipartFile multipartFile = multipartHttpServletRequest.getFile(fileName);
            originalFileName = multipartFile.getOriginalFilename();

            String storePathFileName = storePath + originalFileName;
            try {
                multipartFile.transferTo(new File(storePathFileName));
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            attachfile = new HashMap<>();
            attachfile.put("ATTACHFILE_SEQ", this.getUniqueId());
            attachfile.put("SOURCE_UNIQUE_SEQ", params.get("COMMON_CODE_ID"));
            attachfile.put("ORGINALFILE_NAME", originalFileName);
            attachfile.put("PHYSICALFILE_NAME", physicalFileName);
            attachfile.put("REGISTER_SEQ", params.get("REGISTER_SEQ"));
            attachfile.put("MODIFIER_SEQ", params.get("MODIFIER_SEQ"));

            attachfiles.add(attachfile);
        }
        
        return attachfiles;
    }
}
