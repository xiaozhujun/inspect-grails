package inspect

import org.springframework.dao.DataIntegrityViolationException

class InspectTagController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [inspectTagInstanceList: InspectTag.list(params), inspectTagInstanceTotal: InspectTag.count()]
    }

    def create() {
        [inspectTagInstance: new InspectTag(params)]
    }

    def save() {
        def inspectTagInstance = new InspectTag(params)
        if (!inspectTagInstance.save(flush: true)) {
            render(view: "create", model: [inspectTagInstance: inspectTagInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'inspectTag.label', default: 'InspectTag'), inspectTagInstance.id])
        redirect(action: "show", id: inspectTagInstance.id)
    }

    def show(Long id) {
        def inspectTagInstance = InspectTag.get(id)
        if (!inspectTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectTag.label', default: 'InspectTag'), id])
            redirect(action: "list")
            return
        }

        [inspectTagInstance: inspectTagInstance]
    }

    def edit(Long id) {
        def inspectTagInstance = InspectTag.get(id)
        if (!inspectTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectTag.label', default: 'InspectTag'), id])
            redirect(action: "list")
            return
        }

        [inspectTagInstance: inspectTagInstance]
    }

    def update(Long id, Long version) {
        def inspectTagInstance = InspectTag.get(id)
        if (!inspectTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectTag.label', default: 'InspectTag'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (inspectTagInstance.version > version) {
                inspectTagInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'inspectTag.label', default: 'InspectTag')] as Object[],
                          "Another user has updated this InspectTag while you were editing")
                render(view: "edit", model: [inspectTagInstance: inspectTagInstance])
                return
            }
        }

        inspectTagInstance.properties = params

        if (!inspectTagInstance.save(flush: true)) {
            render(view: "edit", model: [inspectTagInstance: inspectTagInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'inspectTag.label', default: 'InspectTag'), inspectTagInstance.id])
        redirect(action: "show", id: inspectTagInstance.id)
    }

    def delete(Long id) {
        def inspectTagInstance = InspectTag.get(id)
        if (!inspectTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectTag.label', default: 'InspectTag'), id])
            redirect(action: "list")
            return
        }

        try {
            inspectTagInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'inspectTag.label', default: 'InspectTag'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'inspectTag.label', default: 'InspectTag'), id])
            redirect(action: "show", id: id)
        }
    }
}
