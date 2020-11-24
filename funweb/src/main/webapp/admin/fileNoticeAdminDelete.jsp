<%@page import="exam.dao.BoardDao"%>
<%@page import="java.io.File"%>
<%@page import="exam.domain.AttachfileVo"%>
<%@page import="java.util.List"%>
<%@page import="exam.dao.AttachfileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");

	if (id.equals("admin")){
		
		// num  pageNum  파라미터 가져오기

		String pageNum = request.getParameter("pageNum");
		String[] selected = request.getParameterValues("selected");

	
		if (selected != null) {
			BoardDao dao = BoardDao.getInstance();
			AttachfileDao attachDao = AttachfileDao.getInstance();
			for (int i=0; i<selected.length; i++) {
				int bno = Integer.parseInt(selected[i]);
				List<AttachfileVo> attachList = attachDao.getAttachfilesByBno(bno);
			
			for (AttachfileVo attachVo : attachList) {
				String filename = attachVo.getUuid() + "_" + attachVo.getFilename(); 
			
				File file = new File(attachVo.getUploadpath(), filename);
				
				if (file.exists()) {
					file.delete();
				}
			
			}
			attachDao.deleteAttachfilesByBno(bno);
			dao.deleteByNum(bno);
			
			}
			response.sendRedirect("fileNoticeAdmin.jsp?pageNum=" + pageNum);
		} else {
			%>
			<script>
			alert('선택한 글이 없습니다.')
			history.back();
			</script>
		<%
		}
	}
		 %>
		
		







