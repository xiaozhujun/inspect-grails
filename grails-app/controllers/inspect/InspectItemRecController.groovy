package inspect

import org.springframework.dao.DataIntegrityViolationException

class InspectItemRecController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [inspectItemRecInstanceList: InspectItemRec.list(params), inspectItemRecInstanceTotal: InspectItemRec.count()]
    }

    def create() {
        [inspectItemRecInstance: new InspectItemRec(params)]
    }

    def save() {
        def inspectItemRecInstance = new InspectItemRec(params)
        if (!inspectItemRecInstance.save(flush: true)) {
            render(view: "create", model: [inspectItemRecInstance: inspectItemRecInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'inspectItemRec.label', default: 'InspectItemRec'), inspectItemRecInstance.id])
        redirect(action: "show", id: inspectItemRecInstance.id)
    }

    def show(Long id) {
        def inspectItemRecInstance = InspectItemRec.get(id)
        if (!inspectItemRecInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectItemRec.label', default: 'InspectItemRec'), id])
            redirect(action: "list")
            return
        }

        [inspectItemRecInstance: inspectItemRecInstance]
    }

    def edit(Long id) {
        def inspectItemRecInstance = InspectItemRec.get(id)
        if (!inspectItemRecInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectItemRec.label', default: 'InspectItemRec'), id])
            redirect(action: "list")
            return
        }

        [inspectItemRecInstance: inspectItemRecInstance]
    }

    def update(Long id, Long version) {
        def inspectItemRecInstance = InspectItemRec.get(id)
        if (!inspectItemRecInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectItemRec.label', default: 'InspectItemRec'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (inspectItemRecInstance.version > version) {
                inspectItemRecInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'inspectItemRec.label', default: 'InspectItemRec')] as Object[],
                          "Another user has updated this InspectItemRec while you were editing")
                render(view: "edit", model: [inspectItemRecInstance: inspectItemRecInstance])
                return
            }
        }

        inspectItemRecInstance.properties = params

        if (!inspectItemRecInstance.save(flush: true)) {
            render(view: "edit", model: [inspectItemRecInstance: inspectItemRecInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'inspectItemRec.label', default: 'InspectItemRec'), inspectItemRecInstance.id])
        redirect(action: "show", id: inspectItemRecInstance.id)
    }

    def delete(Long id) {
        def inspectItemRecInstance = InspectItemRec.get(id)
        if (!inspectItemRecInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectItemRec.label', default: 'InspectItemRec'), id])
            redirect(action: "list")
            return
        }

        try {
            inspectItemRecInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'inspectItemRec.label', default: 'InspectItemRec'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'inspectItemRec.label', default: 'InspectItemRec'), id])
            redirect(action: "show", id: id)
        }
    }
}
