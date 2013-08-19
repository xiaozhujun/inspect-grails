package inspect

import org.springframework.dao.DataIntegrityViolationException

class RolesController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [rolesInstanceList: Roles.list(params), rolesInstanceTotal: Roles.count()]
    }

    def create() {
        [rolesInstance: new Roles(params)]
    }

    def save() {
        def rolesInstance = new Roles(params)
        if (!rolesInstance.save(flush: true)) {
            render(view: "create", model: [rolesInstance: rolesInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'roles.label', default: 'Roles'), rolesInstance.id])
        redirect(action: "show", id: rolesInstance.id)
    }

    def show(Long id) {
        def rolesInstance = Roles.get(id)
        if (!rolesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'roles.label', default: 'Roles'), id])
            redirect(action: "list")
            return
        }

        [rolesInstance: rolesInstance]
    }

    def edit(Long id) {
        def rolesInstance = Roles.get(id)
        if (!rolesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'roles.label', default: 'Roles'), id])
            redirect(action: "list")
            return
        }

        [rolesInstance: rolesInstance]
    }

    def update(Long id, Long version) {
        def rolesInstance = Roles.get(id)
        if (!rolesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'roles.label', default: 'Roles'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (rolesInstance.version > version) {
                rolesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'roles.label', default: 'Roles')] as Object[],
                          "Another user has updated this Roles while you were editing")
                render(view: "edit", model: [rolesInstance: rolesInstance])
                return
            }
        }

        rolesInstance.properties = params

        if (!rolesInstance.save(flush: true)) {
            render(view: "edit", model: [rolesInstance: rolesInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'roles.label', default: 'Roles'), rolesInstance.id])
        redirect(action: "show", id: rolesInstance.id)
    }

    def delete(Long id) {
        def rolesInstance = Roles.get(id)
        if (!rolesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'roles.label', default: 'Roles'), id])
            redirect(action: "list")
            return
        }

        try {
            rolesInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'roles.label', default: 'Roles'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'roles.label', default: 'Roles'), id])
            redirect(action: "show", id: id)
        }
    }
}
