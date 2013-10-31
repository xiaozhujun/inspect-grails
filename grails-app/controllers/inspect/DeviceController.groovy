package inspect

import com.springsource.roo.inspect.dao.DBImpl
import model.PageInspectTable
import org.springframework.dao.DataIntegrityViolationException
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
class DeviceController {
    DBImpl d=new DBImpl();
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [deviceInstanceList: Device.list(params), deviceInstanceTotal: Device.count()]
    }
    def adminlist(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [deviceInstanceList: Device.list(params), deviceInstanceTotal: Device.count()]
    }

    def create() {
        List<PageInspectTable> typelist=d.getTyname();
        [deviceInstance: new Device(params),typelist:typelist]
    }
    def admincreate() {
        List<PageInspectTable> typelist=d.getTyname();
        [deviceInstance: new Device(params),typelist:typelist]
    }
    def gouserresearch(){
        System.out.print("gouserrearch")
        render(view:"gouserresearch")
    }
    def goadminresearch(){
        render(view:"goadminresearch")
    }
    def userupload(){
        render(view:"userupload")
    }
    def adminupload(){
        render(view:"adminupload")
    }
    def save() {
        def deviceInstance = new Device(params)
        if (!deviceInstance.save(flush: true)) {
            render(view: "create", model: [deviceInstance: deviceInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'device.label', default: 'Device'), deviceInstance.id])
        redirect(action: "show", id: deviceInstance.id)
    }
    def adminsave() {
        def deviceInstance = new Device(params)
        if (!deviceInstance.save(flush: true)) {
            render(view: "admincreate", model: [deviceInstance: deviceInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'device.label', default: 'Device'), deviceInstance.id])
        redirect(action: "adminshow", id: deviceInstance.id)
    }
    def show(Long id) {
        def deviceInstance = Device.get(id)
        if (!deviceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'device.label', default: 'Device'), id])
            redirect(action: "list")
            return
        }
         String typename=d.getTypeById(Integer.parseInt(deviceInstance.typeId.toString()))
        [deviceInstance: deviceInstance,typename:typename]
    }
    def adminshow(Long id) {
        def deviceInstance = Device.get(id)
        if (!deviceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'device.label', default: 'Device'), id])
            redirect(action: "adminlist")
            return
        }
        String typename=d.getTypeById(Integer.parseInt(deviceInstance.typeId.toString()))
        [deviceInstance: deviceInstance,typename:typename]
    }
    def edit(Long id) {
        def deviceInstance = Device.get(id)
        if (!deviceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'device.label', default: 'Device'), id])
            redirect(action: "list")
            return
        }
        List<PageInspectTable> typelist=d.getTyname();
        [deviceInstance: deviceInstance,typelist:typelist]
    }
    def adminedit(Long id) {
        def deviceInstance = Device.get(id)
        if (!deviceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'device.label', default: 'Device'), id])
            redirect(action: "adminlist")
            return
        }
        List<PageInspectTable> typelist=d.getTyname();
        [deviceInstance: deviceInstance,typelist:typelist]
    }

    def update(Long id, Long version) {
        def deviceInstance = Device.get(id)
        if (!deviceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'device.label', default: 'Device'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (deviceInstance.version > version) {
                deviceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'device.label', default: 'Device')] as Object[],
                          "Another user has updated this Device while you were editing")
                render(view: "edit", model: [deviceInstance: deviceInstance])
                return
            }
        }

        deviceInstance.properties = params

        if (!deviceInstance.save(flush: true)) {
            render(view: "edit", model: [deviceInstance: deviceInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'device.label', default: 'Device'), deviceInstance.id])
        redirect(action: "show", id: deviceInstance.id)
    }
    def adminupdate(Long id, Long version) {
        def deviceInstance = Device.get(id)
        if (!deviceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'device.label', default: 'Device'), id])
            redirect(action: "adminlist")
            return
        }

        if (version != null) {
            if (deviceInstance.version > version) {
                deviceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'device.label', default: 'Device')] as Object[],
                        "Another user has updated this Device while you were editing")
                render(view: "adminedit", model: [deviceInstance: deviceInstance])
                return
            }
        }

        deviceInstance.properties = params

        if (!deviceInstance.save(flush: true)) {
            render(view: "adminedit", model: [deviceInstance: deviceInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'device.label', default: 'Device'), deviceInstance.id])
        redirect(action: "adminshow", id: deviceInstance.id)
    }
    def delete(Long id) {
        def deviceInstance = Device.get(id)
        if (!deviceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'device.label', default: 'Device'), id])
            redirect(action: "list")
            return
        }

        try {
            deviceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'device.label', default: 'Device'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'device.label', default: 'Device'), id])
            redirect(action: "show", id: id)
        }
    }
    def admindelete(Long id) {
        def deviceInstance = Device.get(id)
        if (!deviceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'device.label', default: 'Device'), id])
            redirect(action: "adminlist")
            return
        }

        try {
            deviceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'device.label', default: 'Device'), id])
            redirect(action: "adminlist")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'device.label', default: 'Device'), id])
            redirect(action: "adminshow", id: id)
        }
    }

    def upload = {
        System.out.print("xxxx")
        def f = request.getFile("myFile")
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
        if(!f.empty) {
            //f.transferTo( new File("web-app/xmlFiles") )
            response.sendError(200,'Done');
            //String path="web-app/xmlFiles"
            DOMAnalysisXml d = new DOMAnalysisXml();
           // System.out.println(path+"文件???");
	       /* d.analysisXml(path);*/
            int flag=d.analysisXml(f.getInputStream());
            if (flag!=0){
                System.out.print("数据已存在")
            }
        }
        else {
            flash.message = 'file cannot be empty'
            render(view:'adminupload')
        }
    }
    def upload1 ={
        System.out.print("userupload")
        def f = request.getFile("myFile")
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        if(!f.empty) {
           // f.transferTo( new File("web-app/xmlFiles") )
            response.sendError(200,'Done');
            //String path="web-app/xmlFiles"
            DOMAnalysisXml d = new DOMAnalysisXml();
            //System.out.println(path+"文件???");
            int flag=d.analysisXml(f.getInputStream());
            if (flag!=0){
                System.out.print("数据已存在")
            }
        }
        else {
            flash.message = 'file cannot be empty'
            render(view:'userupload')
        }
    }

}
