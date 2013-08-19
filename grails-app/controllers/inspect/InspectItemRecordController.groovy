package inspect

import org.springframework.dao.DataIntegrityViolationException

class InspectItemRecordController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [inspectItemRecordInstanceList: InspectItemRecord.list(params), inspectItemRecordInstanceTotal: InspectItemRecord.count()]
    }

    def create() {
        [inspectItemRecordInstance: new InspectItemRecord(params)]
    }

    def save() {
        def inspectItemRecordInstance = new InspectItemRecord(params)
        if (!inspectItemRecordInstance.save(flush: true)) {
            render(view: "create", model: [inspectItemRecordInstance: inspectItemRecordInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'inspectItemRecord.label', default: 'InspectItemRecord'), inspectItemRecordInstance.id])
        redirect(action: "show", id: inspectItemRecordInstance.id)
    }

    def show(Long id) {
        def inspectItemRecordInstance = InspectItemRecord.get(id)
        if (!inspectItemRecordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectItemRecord.label', default: 'InspectItemRecord'), id])
            redirect(action: "list")
            return
        }

        [inspectItemRecordInstance: inspectItemRecordInstance]
    }

    def edit(Long id) {
        def inspectItemRecordInstance = InspectItemRecord.get(id)
        if (!inspectItemRecordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectItemRecord.label', default: 'InspectItemRecord'), id])
            redirect(action: "list")
            return
        }

        [inspectItemRecordInstance: inspectItemRecordInstance]
    }

    def update(Long id, Long version) {
        def inspectItemRecordInstance = InspectItemRecord.get(id)
        if (!inspectItemRecordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectItemRecord.label', default: 'InspectItemRecord'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (inspectItemRecordInstance.version > version) {
                inspectItemRecordInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'inspectItemRecord.label', default: 'InspectItemRecord')] as Object[],
                          "Another user has updated this InspectItemRecord while you were editing")
                render(view: "edit", model: [inspectItemRecordInstance: inspectItemRecordInstance])
                return
            }
        }

        inspectItemRecordInstance.properties = params

        if (!inspectItemRecordInstance.save(flush: true)) {
            render(view: "edit", model: [inspectItemRecordInstance: inspectItemRecordInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'inspectItemRecord.label', default: 'InspectItemRecord'), inspectItemRecordInstance.id])
        redirect(action: "show", id: inspectItemRecordInstance.id)
    }

    def delete(Long id) {
        def inspectItemRecordInstance = InspectItemRecord.get(id)
        if (!inspectItemRecordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspectItemRecord.label', default: 'InspectItemRecord'), id])
            redirect(action: "list")
            return
        }

        try {
            inspectItemRecordInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'inspectItemRecord.label', default: 'InspectItemRecord'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'inspectItemRecord.label', default: 'InspectItemRecord'), id])
            redirect(action: "show", id: id)
        }
    }
}
