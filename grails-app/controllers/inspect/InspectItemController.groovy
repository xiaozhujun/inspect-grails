package inspect

import com.springsource.roo.inspect.dao.DBImpl
import model.PageInspectTable
import org.springframework.dao.DataIntegrityViolationException

class InspectItemController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    DBImpl d=new DBImpl();
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [inspectItemInstanceList: InspectItem.list(params), inspectItemInstanceTotal: InspectItem.count()]
    }

    def create() {
         List<PageInspectTable> tlist=d.getTableName()
         List<PageInspectTable> taglist=d.getTagName()
         List<PageInspectTable> valuelist=d.getTvalue()
        [inspectItemInstance: new InspectItem(params),tlist:tlist,taglist:taglist,valuelist:valuelist]
    }

    def save() {
        def inspectItemInstance = new InspectItem(params)
        if (!inspectItemInstance.save(flush: true)) {
            render(view: "create", model: [inspectItemInstance: inspectItemInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'inspectItem.label', default: 'InspectItem'), inspectItemInstance.id])
        redirect(action: "show", id: inspectItemInstance.id)
    }

    def show(Long id) {
        def inspectItemInstance = InspectItem.get(id)
        if (!inspectItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectItem.label', default: 'InspectItem'), id])
            redirect(action: "list")
            return
        }
         String tname=d.getTableById(Integer.parseInt(inspectItemInstance.inspecttableId.toString()))
         String tagname=d.getTagNameById(Integer.parseInt(inspectItemInstance.tagId.toString()))
         String[] tvalues=inspectItemInstance.tvalues;
        List<PageInspectTable> valuelist=new ArrayList<PageInspectTable>();
        PageInspectTable p=null;
       for(int i=0;i<tvalues.length;i++){
           int vid=Integer.parseInt(tvalues[i].toString().substring(17))
           p=new PageInspectTable()
           p.setVid(vid)
           String tvalue=d.getValueById(vid);
           p.setTvalue(tvalue)
           valuelist.add(p)
        }
           Iterator it=valuelist.iterator()
         while(it.hasNext()){
             p=(PageInspectTable)it.next()
             System.out.print(p.getVid())
             System.out.print(p.getTvalue())
         }
        [inspectItemInstance: inspectItemInstance,tname:tname,tagname:tagname,valuelist: valuelist]
    }

    def edit(Long id) {
        def inspectItemInstance = InspectItem.get(id)
        if (!inspectItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectItem.label', default: 'InspectItem'), id])
            redirect(action: "list")
            return
        }
        List<PageInspectTable> tlist=d.getTableName()
        List<PageInspectTable> taglist=d.getTagName()
        List<PageInspectTable> valuelist=d.getTvalue()
        [inspectItemInstance: inspectItemInstance,tlist:tlist,taglist:taglist,valuelist:valuelist]
    }

    def update(Long id, Long version) {
        def inspectItemInstance = InspectItem.get(id)
        if (!inspectItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectItem.label', default: 'InspectItem'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (inspectItemInstance.version > version) {
                inspectItemInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'inspectItem.label', default: 'InspectItem')] as Object[],
                          "Another user has updated this InspectItem while you were editing")
                render(view: "edit", model: [inspectItemInstance: inspectItemInstance])
                return
            }
        }

        inspectItemInstance.properties = params

        if (!inspectItemInstance.save(flush: true)) {
            render(view: "edit", model: [inspectItemInstance: inspectItemInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'inspectItem.label', default: 'InspectItem'), inspectItemInstance.id])
        redirect(action: "show", id: inspectItemInstance.id)
    }

    def delete(Long id) {
        def inspectItemInstance = InspectItem.get(id)
        if (!inspectItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectItem.label', default: 'InspectItem'), id])
            redirect(action: "list")
            return
        }

        try {
            inspectItemInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'inspectItem.label', default: 'InspectItem'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'inspectItem.label', default: 'InspectItem'), id])
            redirect(action: "show", id: id)
        }
    }
}
