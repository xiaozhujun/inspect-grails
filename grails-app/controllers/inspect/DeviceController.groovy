package inspect

import com.springsource.roo.inspect.dao.DbImpl
import model.PageInspectTable
import org.springframework.dao.DataIntegrityViolationException
import com.execute.DomAnalysisXml;
class DeviceController {
    DbImpl d=new DbImpl();
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
        def f = request.getFile("myFile")
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");
        def dd1;
        if(f!=null) {
            //response.sendError(200,'Done');
            DomAnalysisXml d = new DomAnalysisXml();
            def ff=f.getOriginalFilename().substring(f.getOriginalFilename().indexOf("."));
            if (ff!=".xml"){
                dd1="支持xml文件上传!";
            }else{
                int flag1=d.analysisXml(f.getInputStream());
                if (flag1==1){
                    dd1="数据已存在！"
                }else if (flag1==2){
                    dd1="文件内容不对！    "
                }else{
                    dd1="文件上传成功！"
                }
               }
             }else {
            dd1="请选择上传文件！"
        }
        render dd1
    }

    def upload1 ={
        def f = request.getFile("myFile")
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");
        DomAnalysisXml d = new DomAnalysisXml();
        def dd;
        if(f!=null) {
            //response.sendError(200,'Done');
            def ff=f.getOriginalFilename().substring(f.getOriginalFilename().indexOf("."));
            if (ff!=".xml"){
               dd="支持xml文件上传!";
            }else{
            int flag=d.analysisXml(f.getInputStream());
            if (flag==1){
                dd="数据已存在！"
            }else if (flag==2){
                dd="文件内容不对！"
            }else{
                dd="文件上传成功！"
            }
            }
        }
        else {
            dd="请选择上传文件！"
        }
        render dd
    }


}
