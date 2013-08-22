package inspect

import org.springframework.dao.DataIntegrityViolationException

class DeviceTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [deviceTypeInstanceList: DeviceType.list(params), deviceTypeInstanceTotal: DeviceType.count()]
    }

    def create() {
        [deviceTypeInstance: new DeviceType(params)]
    }

    def save() {
        def deviceTypeInstance = new DeviceType(params)
        if (!deviceTypeInstance.save(flush: true)) {
            render(view: "create", model: [deviceTypeInstance: deviceTypeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'deviceType.label', default: 'DeviceType'), deviceTypeInstance.id])
        redirect(action: "show", id: deviceTypeInstance.id)
    }

    def show(Long id) {
        def deviceTypeInstance = DeviceType.get(id)
        if (!deviceTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'deviceType.label', default: 'DeviceType'), id])
            redirect(action: "list")
            return
        }

        [deviceTypeInstance: deviceTypeInstance]
    }

    def edit(Long id) {
        def deviceTypeInstance = DeviceType.get(id)
        if (!deviceTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'deviceType.label', default: 'DeviceType'), id])
            redirect(action: "list")
            return
        }

        [deviceTypeInstance: deviceTypeInstance]
    }

    def update(Long id, Long version) {
        def deviceTypeInstance = DeviceType.get(id)
        if (!deviceTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'deviceType.label', default: 'DeviceType'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (deviceTypeInstance.version > version) {
                deviceTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'deviceType.label', default: 'DeviceType')] as Object[],
                          "Another user has updated this DeviceType while you were editing")
                render(view: "edit", model: [deviceTypeInstance: deviceTypeInstance])
                return
            }
        }

        deviceTypeInstance.properties = params

        if (!deviceTypeInstance.save(flush: true)) {
            render(view: "edit", model: [deviceTypeInstance: deviceTypeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'deviceType.label', default: 'DeviceType'), deviceTypeInstance.id])
        redirect(action: "show", id: deviceTypeInstance.id)
    }

    def delete(Long id) {
        def deviceTypeInstance = DeviceType.get(id)
        if (!deviceTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'deviceType.label', default: 'DeviceType'), id])
            redirect(action: "list")
            return
        }

        try {
            deviceTypeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'deviceType.label', default: 'DeviceType'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'deviceType.label', default: 'DeviceType'), id])
            redirect(action: "show", id: id)
        }
    }
}
