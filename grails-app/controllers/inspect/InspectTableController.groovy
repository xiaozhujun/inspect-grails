package inspect

import com.springsource.roo.inspect.dao.DBImpl
import com.springsource.roo.inspect.dao.InspectTableImpl
import com.xmlparse.dom4j.insertToRolesTableXml
import model.PageInspectTable
import org.springframework.dao.DataIntegrityViolationException
import com.xmlparse.dom4j.insertToTableTestXml;
class InspectTableController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    DBImpl d=new DBImpl();
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
        InspectTableImpl t=new InspectTableImpl();
        System.out.println(t.getNameById(id1));
        String tname=t.getNameById(id1);
        String pathname=request.getSession().getServletContext().getRealPath("/xmlFile/"+tname+".xml");
        new insertToTableTestXml().createXml(pathname,id1);

        String rname=t.getRoleNameByTid(id1);
        String pathname1=request.getSession().getServletContext().getRealPath("/xmlFile/RolesTable.xml");
        new insertToRolesTableXml().createXml(pathname1);
        request.setAttribute("id",id1);
        render (view:"downSuccess");
    }
   /* def download(Long id){
        int id1=Integer.parseInt(id.toString())
        request.setAttribute("id",id1);
        render(view:"downSucc");
    }*/
    def downroletable(){
        String pathname1=request.getSession().getServletContext().getRealPath("/xmlFile/RolesTable.xml");
        new insertToRolesTableXml().createXml(pathname1);
        render(view:"downroletable");
    }
}
