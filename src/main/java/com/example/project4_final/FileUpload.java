package com.example.project4_final;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class FileUpload {
    public BoardVO uploadPhoto(HttpServletRequest request) throws IOException {
        String filename="";
        int sizeLimit = 15 * 1024 * 1024;

        String realPath = request.getServletContext().getRealPath("upload");

        File dir = new File(realPath);
        if (!dir.exists()) dir.mkdirs();

        BoardVO one = null;
        MultipartRequest multpartRequest = null;

        try {
            multpartRequest = new MultipartRequest(request, realPath,
                    sizeLimit, "utf-8", new DefaultFileRenamePolicy());
            filename = multpartRequest.getFilesystemName("img");

            one = new BoardVO();
            String seq = multpartRequest.getParameter("seq");
            if(seq != null && !seq.equals("")) one.setSeq(Integer.parseInt(seq));
            one.setTitle(multpartRequest.getParameter("title"));
            one.setWriter(multpartRequest.getParameter("writer"));
            one.setCategory(multpartRequest.getParameter("category"));
            one.setContent(multpartRequest.getParameter("content"));

            if(seq!=null&&!seq.equals("")){
                BoardDAO dao = new BoardDAO();
                String oldfilename = dao.getPhotoFilename(Integer.parseInt(seq));

                if(filename != null && oldfilename != null)
                    FileUpload.deleteFile(request, oldfilename);
                else if(filename == null && oldfilename != null)
                    filename = oldfilename;
            }
            one.setImg(filename);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return one;
    }
    public static void deleteFile(HttpServletRequest request, String filename){
        String filePath = request.getServletContext().getRealPath("upload");
        File f = new File(filePath + "/" + filename);
        if(f.exists())
            f.delete();
    }
}
