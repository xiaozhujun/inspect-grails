package inspect

import com.springsource.roo.inspect.dao.DbImpl
import model.PageInspectTable
import org.springframework.dao.DataIntegrityViolationException

class InspectTagRfIdController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    DbImpl d=new DbImpl();
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [inspectTagRfIdInstanceList: InspectTagRfId.list(params), inspectTagRfIdInstanceTotal: InspectTagRfId.count()]
    }
    def adminlist(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [inspectTagRfIdInstanceList: InspectTagRfId.list(params), inspectTagRfIdInstanceTotal: InspectTagRfId.count()]
    }
    def create() {
        List<PageInspectTable> devlist=d.getDeviceName();
        List<PageInspectTable> taglist=d.getTagName();
        [inspectTagRfIdInstance: new InspectTagRfId(params),devlist:devlist,taglist:taglist]
    }
    def admincreate() {
        List<PageInspectTable> devlist=d.getDeviceName();
        List<PageInspectTable> taglist=d.getTagName();
        [inspectTagRfIdInstance: new InspectTagRfId(params),devlist:devlist,taglist:taglist]
    }
    def save() {
        System.out.println();
        def inspectTagRfIdInstance = new InspectTagRfId(params)
        if (!inspectTagRfIdInstance.save(flush: true)) {
            render(view: "create", model: [inspectTagRfIdInstance: inspectTagRfIdInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'inspectTagRfId.label', default: 'InspectTagRfId'), inspectTagRfIdInstance.id])
        redirect(action: "show", id: inspectTagRfIdInstance.id)
    }
    def adminsave() {
        def inspectTagRfIdInstance = new InspectTagRfId(params)
        if (!inspectTagRfIdInstance.save(flush: true)) {
            render(view: "admincreate", model: [inspectTagRfIdInstance: inspectTagRfIdInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'inspectTagRfId.label', default: 'InspectTagRfId'), inspectTagRfIdInstance.id])
        redirect(action: "adminshow", id: inspectTagRfIdInstance.id)
    }
    def show(Long id) {
        def inspectTagRfIdInstance = InspectTagRfId.get(id)
        if (!inspectTagRfIdInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectTagRfId.label', default: 'InspectTagRfId'), id])
            redirect(action: "list")
            return
        }
        String devname=d.getDevNameById(Integer.parseInt(inspectTagRfIdInstance.deviceId.toString()));
        String tagname=d.getTagNameById(Integer.parseInt(inspectTagRfIdInstance.tagcagId.toString()))
        [inspectTagRfIdInstance: inspectTagRfIdInstance,devname:devname,tagname:tagname]
    }
    def adminshow(Long id) {
        def inspectTagRfIdInstance = InspectTagRfId.get(id)
        if (!inspectTagRfIdInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectTagRfId.label', default: 'InspectTagRfId'), id])
            redirect(action: "adminlist")
            return
        }
        String devname=d.getDevNameById(Integer.parseInt(inspectTagRfIdInstance.deviceId.toString()));
        String tagname=d.getTagNameById(Integer.parseInt(inspectTagRfIdInstance.tagcagId.toString()))
        [inspectTagRfIdInstance: inspectTagRfIdInstance,devname:devname,tagname:tagname]
    }
    def edit(Long id) {
        def inspectTagRfIdInstance = InspectTagRfId.get(id)
        if (!inspectTagRfIdInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectTagRfId.label', default: 'InspectTagRfId'), id])
            redirect(action: "list")
            return
        }
        List<PageInspectTable> devlist=d.getDeviceName();
        List<PageInspectTable> taglist=d.getTagName();
        [inspectTagRfIdInstance: inspectTagRfIdInstance,devlist:devlist,taglist:taglist]
    }
    def adminedit(Long id) {
        def inspectTagRfIdInstance = InspectTagRfId.get(id)
        if (!inspectTagRfIdInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectTagRfId.label', default: 'InspectTagRfId'), id])
            redirect(action: "adminlist")
            return
        }

        List<PageInspectTable> devlist=d.getDeviceName();
        List<PageInspectTable> taglist=d.getTagName();
        [inspectTagRfIdInstance: inspectTagRfIdInstance,devlist:devlist,taglist:taglist]
    }
    def update(Long id, Long version) {
        def inspectTagRfIdInstance = InspectTagRfId.get(id)
        if (!inspectTagRfIdInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectTagRfId.label', default: 'InspectTagRfId'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (inspectTagRfIdInstance.version > version) {
                inspectTagRfIdInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'inspectTagRfId.label', default: 'InspectTagRfId')] as Object[],
                          "Another user has updated this InspectTagRfId while you were editing")
                render(view: "edit", model: [inspectTagRfIdInstance: inspectTagRfIdInstance])
                return
            }
        }

        inspectTagRfIdInstance.properties = params

        if (!inspectTagRfIdInstance.save(flush: true)) {
            render(view: "edit", model: [inspectTagRfIdInstance: inspectTagRfIdInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'inspectTagRfId.label', default: 'InspectTagRfId'), inspectTagRfIdInstance.id])
        redirect(action: "show", id: inspectTagRfIdInstance.id)
    }
    def adminupdate(Long id, Long version) {
        def inspectTagRfIdInstance = InspectTagRfId.get(id)
        if (!inspectTagRfIdInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectTagRfId.label', default: 'InspectTagRfId'), id])
            redirect(action: "adminlist")
            return
        }

        if (version != null) {
            if (inspectTagRfIdInstance.version > version) {
                inspectTagRfIdInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'inspectTagRfId.label', default: 'InspectTagRfId')] as Object[],
                        "Another user has updated this InspectTagRfId while you were editing")
                render(view: "adminedit", model: [inspectTagRfIdInstance: inspectTagRfIdInstance])
                return
            }
        }

        inspectTagRfIdInstance.properties = params

        if (!inspectTagRfIdInstance.save(flush: true)) {
            render(view: "adminedit", model: [inspectTagRfIdInstance: inspectTagRfIdInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'inspectTagRfId.label', default: 'InspectTagRfId'), inspectTagRfIdInstance.id])
        redirect(action: "adminshow", id: inspectTagRfIdInstance.id)
    }
    def delete(Long id) {
        def inspectTagRfIdInstance = InspectTagRfId.get(id)
        if (!inspectTagRfIdInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectTagRfId.label', default: 'InspectTagRfId'), id])
            redirect(action: "list")
            return
        }

        try {
            inspectTagRfIdInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'inspectTagRfId.label', default: 'InspectTagRfId'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'inspectTagRfId.label', default: 'InspectTagRfId'), id])
            redirect(action: "show", id: id)
        }
    }
    def admindelete(Long id) {
        def inspectTagRfIdInstance = InspectTagRfId.get(id)
        if (!inspectTagRfIdInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectTagRfId.label', default: 'InspectTagRfId'), id])
            redirect(action: "adminlist")
            return
        }

        try {
            inspectTagRfIdInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'inspectTagRfId.label', default: 'InspectTagRfId'), id])
            redirect(action: "adminlist")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'inspectTagRfId.label', default: 'InspectTagRfId'), id])
            redirect(action: "adminshow", id: id)
        }
    }
}
