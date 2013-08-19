package inspect

import org.springframework.dao.DataIntegrityViolationException

class TValueController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [TValueInstanceList: TValue.list(params), TValueInstanceTotal: TValue.count()]
    }

    def create() {
        [TValueInstance: new TValue(params)]
    }

    def save() {
        def TValueInstance = new TValue(params)
        if (!TValueInstance.save(flush: true)) {
            render(view: "create", model: [TValueInstance: TValueInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'TValue.label', default: 'TValue'), TValueInstance.id])
        redirect(action: "show", id: TValueInstance.id)
    }

    def show(Long id) {
        def TValueInstance = TValue.get(id)
        if (!TValueInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'TValue.label', default: 'TValue'), id])
            redirect(action: "list")
            return
        }

        [TValueInstance: TValueInstance]
    }

    def edit(Long id) {
        def TValueInstance = TValue.get(id)
        if (!TValueInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'TValue.label', default: 'TValue'), id])
            redirect(action: "list")
            return
        }

        [TValueInstance: TValueInstance]
    }

    def update(Long id, Long version) {
        def TValueInstance = TValue.get(id)
        if (!TValueInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'TValue.label', default: 'TValue'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (TValueInstance.version > version) {
                TValueInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'TValue.label', default: 'TValue')] as Object[],
                          "Another user has updated this TValue while you were editing")
                render(view: "edit", model: [TValueInstance: TValueInstance])
                return
            }
        }

        TValueInstance.properties = params

        if (!TValueInstance.save(flush: true)) {
            render(view: "edit", model: [TValueInstance: TValueInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'TValue.label', default: 'TValue'), TValueInstance.id])
        redirect(action: "show", id: TValueInstance.id)
    }

    def delete(Long id) {
        def TValueInstance = TValue.get(id)
        if (!TValueInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'TValue.label', default: 'TValue'), id])
            redirect(action: "list")
            return
        }

        try {
            TValueInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'TValue.label', default: 'TValue'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'TValue.label', default: 'TValue'), id])
            redirect(action: "show", id: id)
        }
    }
}
