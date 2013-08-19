package inspect

import org.springframework.dao.DataIntegrityViolationException

class InspectTableRecordController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [inspectTableRecordInstanceList: InspectTableRecord.list(params), inspectTableRecordInstanceTotal: InspectTableRecord.count()]
    }

    def create() {
        [inspectTableRecordInstance: new InspectTableRecord(params)]
    }

    def save() {
        def inspectTableRecordInstance = new InspectTableRecord(params)
        if (!inspectTableRecordInstance.save(flush: true)) {
            render(view: "create", model: [inspectTableRecordInstance: inspectTableRecordInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'inspectTableRecord.label', default: 'InspectTableRecord'), inspectTableRecordInstance.id])
        redirect(action: "show", id: inspectTableRecordInstance.id)
    }

    def show(Long id) {
        def inspectTableRecordInstance = InspectTableRecord.get(id)
        if (!inspectTableRecordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectTableRecord.label', default: 'InspectTableRecord'), id])
            redirect(action: "list")
            return
        }

        [inspectTableRecordInstance: inspectTableRecordInstance]
    }

    def edit(Long id) {
        def inspectTableRecordInstance = InspectTableRecord.get(id)
        if (!inspectTableRecordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectTableRecord.label', default: 'InspectTableRecord'), id])
            redirect(action: "list")
            return
        }

        [inspectTableRecordInstance: inspectTableRecordInstance]
    }

    def update(Long id, Long version) {
        def inspectTableRecordInstance = InspectTableRecord.get(id)
        if (!inspectTableRecordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectTableRecord.label', default: 'InspectTableRecord'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (inspectTableRecordInstance.version > version) {
                inspectTableRecordInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'inspectTableRecord.label', default: 'InspectTableRecord')] as Object[],
                          "Another user has updated this InspectTableRecord while you were editing")
                render(view: "edit", model: [inspectTableRecordInstance: inspectTableRecordInstance])
                return
            }
        }

        inspectTableRecordInstance.properties = params

        if (!inspectTableRecordInstance.save(flush: true)) {
            render(view: "edit", model: [inspectTableRecordInstance: inspectTableRecordInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'inspectTableRecord.label', default: 'InspectTableRecord'), inspectTableRecordInstance.id])
        redirect(action: "show", id: inspectTableRecordInstance.id)
    }

    def delete(Long id) {
        def inspectTableRecordInstance = InspectTableRecord.get(id)
        if (!inspectTableRecordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectTableRecord.label', default: 'InspectTableRecord'), id])
            redirect(action: "list")
            return
        }

        try {
            inspectTableRecordInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'inspectTableRecord.label', default: 'InspectTableRecord'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'inspectTableRecord.label', default: 'InspectTableRecord'), id])
            redirect(action: "show", id: id)
        }
    }
}
