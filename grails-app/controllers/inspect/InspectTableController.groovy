package inspect

import com.springsource.roo.inspect.dao.DbImpl
import com.springsource.roo.inspect.dao.InspectTableImpl
import model.PageInspectTable
import org.springframework.dao.DataIntegrityViolationException

import com.cesi.report.DownloadXml

class InspectTableController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    DbImpl d=new DbImpl();
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [inspectTableInstanceList: InspectTable.list(params), inspectTableInstanceTotal: InspectTable.count()]
    }
    def searchlist(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [inspectTableInstanceList: InspectTable.list(params), inspectTableInstanceTotal: InspectTable.count()]
    }

    def create() {
        List<PageInspectTable> rlist=d.getRoleName();
        [inspectTableInstance: new InspectTable(params),rlist:rlist]
    }

    def save() {
        def inspectTableInstance = new InspectTable(params)
        if (!inspectTableInstance.save(flush: true)) {
            render(view: "create", model: [inspectTableInstance: inspectTableInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'inspectTable.label', default: 'InspectTable'), inspectTableInstance.id])
        redirect(action: "show", id: inspectTableInstance.id)
    }

    def show(Long id) {
        def inspectTableInstance = InspectTable.get(id)
        if (!inspectTableInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectTable.label', default: 'InspectTable'), id])
            redirect(action: "list")
            return
        }
        String rolename=d.getRoleById(Integer.parseInt(inspectTableInstance.troleId.toString()))
        [inspectTableInstance: inspectTableInstance,rolename:rolename]
    }

    def edit(Long id) {
        def inspectTableInstance = InspectTable.get(id)
        if (!inspectTableInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectTable.label', default: 'InspectTable'), id])
            redirect(action: "list")
            return
        }
        List<PageInspectTable> rlist=d.getRoleName();
        [inspectTableInstance: inspectTableInstance,rlist:rlist]
    }

    def update(Long id, Long version) {
        def inspectTableInstance = InspectTable.get(id)
        if (!inspectTableInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectTable.label', default: 'InspectTable'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (inspectTableInstance.version > version) {
                inspectTableInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'inspectTable.label', default: 'InspectTable')] as Object[],
                          "Another user has updated this InspectTable while you were editing")
                render(view: "edit", model: [inspectTableInstance: inspectTableInstance])
                return
            }
        }

        inspectTableInstance.properties = params

        if (!inspectTableInstance.save(flush: true)) {
            render(view: "edit", model: [inspectTableInstance: inspectTableInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'inspectTable.label', default: 'InspectTable'), inspectTableInstance.id])
        redirect(action: "show", id: inspectTableInstance.id)
    }

    def delete(Long id) {
        System.out.print("Hh"+id)
        def inspectTableInstance = InspectTable.get(id)
        if (!inspectTableInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectTable.label', default: 'InspectTable'), id])
            redirect(action: "list")
            return
        }

        try {
            inspectTableInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'inspectTable.label', default: 'InspectTable'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'inspectTable.label', default: 'InspectTable'), id])
            redirect(action: "show", id: id)
        }
    }
    def generate(Long id){
        System.out.print(id+"ID1");
        int id1=Integer.parseInt(id.toString());
        InspectTableImpl t = new InspectTableImpl();
        String name = t.getNameById(id1);
        System.out.println(name + "name");
        String downFilename = name + ".xml";//要下载的文件名称
        String generateContent=new DownloadXml().downloadXml(id1);
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/plain;charset=utf-8");
        response.setHeader("Location",downFilename);
        response.setHeader("Content-Disposition", "attachment; filename="
                + new String(downFilename.getBytes("utf-8"),"ISO8859-1"));
        OutputStream outputStream = response.getOutputStream();
        System.out.println(generateContent);
        outputStream.write(generateContent.getBytes());
        outputStream.flush();
        outputStream.close();


    }
   /* def download(Long id){
        int id1=Integer.parseInt(id.toString())
        request.setAttribute("id",id1);
        render(view:"downSucc");
    }*/
    def downroletable(){
        /*String pathname1=request.getSession().getServletContext().getRealPath("/xmlFile/RolesTable.xml");
        new InsertToRolesTableXml().createXml(pathname1);
        render(view:"downroletable");*/
        String downFilename = "RolesTable.xml";//要下载的文件名称
        /*response.setContentType("text/plain;charset=UTF-8");*/
        response.reset();
        response.setContentType("application/x-msdownload");
        response.setHeader("Location",
                new String(downFilename.getBytes("GBK"), "UTF-8"));
        response.setHeader("Content-Disposition", "attachment; filename="
                + downFilename);
        String ss=new DownloadXml().downloadRoleTable();
        OutputStream outputStream = response.getOutputStream();
        outputStream.write(ss.getBytes());
        outputStream.flush();
        outputStream.close();

    }
}
