package inspect

import org.springframework.dao.DataIntegrityViolationException

class InspectItemController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [inspectItemInstanceList: InspectItem.list(params), inspectItemInstanceTotal: InspectItem.count()]
    }

    def create() {
        [inspectItemInstance: new InspectItem(params)]
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

        [inspectItemInstance: inspectItemInstance]
    }

    def edit(Long id) {
        def inspectItemInstance = InspectItem.get(id)
        if (!inspectItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectItem.label', default: 'InspectItem'), id])
            redirect(action: "list")
            return
        }

        [inspectItemInstance: inspectItemInstance]
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
