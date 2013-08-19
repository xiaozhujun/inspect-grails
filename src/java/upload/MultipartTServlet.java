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

import com.execute.DOMAnalysisXml;


@SuppressWarnings("serial")
public class MultipartTServlet extends HttpServlet {
	public MultipartTServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		@SuppressWarnings("unused")
		String worker = null;
              System.out.print("Hello");
		String path = null;
		 String file=request.getParameter("myfile");
        System.out.print(file+"ppppppppppppp");
		request.setCharacterEncoding("UTF-8");

		RequestContext requestContext = new ServletRequestContext(request);

		if (FileUpload.isMultipartContent(requestContext)) {

			DiskFileItemFactory factory = new DiskFileItemFactory();

			factory.setRepository(new File(request.getSession().getServletContext().getRealPath(request.getRequestURI())));

			ServletFileUpload upload = new ServletFileUpload(factory);

			upload.setSizeMax(100 * 1024 * 1024);
			@SuppressWarnings("rawtypes")
			List items = new ArrayList();
			try {

				items = upload.parseRequest(request);
                System.out.print(items+"llllllll");
			} catch (FileUploadException e1) {
				System.out.println("error" + e1.getMessage());
			}
            System.out.print("?????????????");
			@SuppressWarnings("rawtypes")
			Iterator it = items.iterator();
			while (it.hasNext()) {
                System.out.print("****************");
				FileItem fileItem = (FileItem) it.next();

				if (fileItem.isFormField()) {
					System.out.println(fileItem.getFieldName()
							+ " hh  "
							+ fileItem.getName()
							+ "   "
							+ new String(fileItem.getString().getBytes(
									"iso8859-1"), "UTF-8"));
					worker = new String(fileItem.getString().getBytes(
							"iso8859-1"), "UTF-8");
				} else {
					System.out.println(fileItem.getFieldName() + " ss  "
							+ fileItem.getName() + "   "
							+ fileItem.isInMemory() + "    "
							+ fileItem.getContentType() + "   "
							+ fileItem.getSize());

					if (fileItem.getName() != null && fileItem.getSize() != 0) {
						File fullFile = new File(fileItem.getName());
						File newFile = new File((request.getSession().getServletContext().getRealPath(request.getRequestURI())) + fullFile.getName());
						// 以上是上传的文件

						path =request.getSession().getServletContext().getRealPath(request.getRequestURI()) + fullFile.getName();
                        System.out.print(path+"PATH");
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
//		DOMAnalysisXml d = new DOMAnalysisXml();
//		System.out.println(path+"文件???");
//		d.analysisXml(path);
        
	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doPost(request, response);
	}

}
