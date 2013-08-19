package upload;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;

@SuppressWarnings("serial")
public class MultipartTestServlet extends HttpServlet {

	public MultipartTestServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		RequestContext requestContext = new ServletRequestContext(request);

		if (FileUpload.isMultipartContent(requestContext)) {

			DiskFileItemFactory factory = new DiskFileItemFactory();

			factory.setRepository(new File(request.getSession().getServletContext().getRealPath("/xmlFile/")));
			ServletFileUpload upload = new ServletFileUpload(factory);

			upload.setSizeMax(100 * 1024 * 1024);
			@SuppressWarnings("rawtypes")
			List items = new ArrayList();
			try {

				items = upload.parseRequest(request);
			} catch (FileUploadException e1) {
				System.out.println("error" + e1.getMessage());
			}

			@SuppressWarnings("rawtypes")
			Iterator it = items.iterator();
			while (it.hasNext()) {
				FileItem fileItem = (FileItem) it.next();

				if (fileItem.isFormField()) {
					System.out.println(fileItem.getFieldName()
							+ "   "
							+ fileItem.getName()
							+ "   "
							+ new String(fileItem.getString().getBytes(
									"iso8859-1"), "UTF-8"));
				} else {
					System.out.println(fileItem.getFieldName() + "   "
							+ fileItem.getName() + "   "
							+ fileItem.isInMemory() + "    "
							+ fileItem.getContentType() + "   "
							+ fileItem.getSize());

					if (fileItem.getName() != null && fileItem.getSize() != 0) {
						File fullFile = new File(fileItem.getName());
						File newFile = new File(request.getSession().getServletContext().getRealPath("/xmlFile/") + fullFile.getName());
						try {
							fileItem.write(newFile);
						} catch (Exception e) {
							e.printStackTrace();
						}
					} else {
						System.out.println("文件没有选择 或 文件内容为空");
					}
				}

			}
		}
	}

}
