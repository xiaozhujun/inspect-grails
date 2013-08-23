package inspect

import com.springsource.roo.inspect.dao.DBImpl
import model.PageInspectTable
import org.springframework.dao.DataIntegrityViolationException

class UsersController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    DBImpl d=new DBImpl();
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [usersInstanceList: Users.list(params), usersInstanceTotal: Users.count()]
    }
    def adminlist(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [usersInstanceList: Users.list(params), usersInstanceTotal: Users.count()]
    }
    def create() {

        List<PageInspectTable> plist=d.getRole();
        [usersInstance: new Users(params),plist:plist,ptable:PageInspectTable]
    }
    def admincreate() {
       // System.out.print("hhh")
        DBImpl d=new DBImpl();
        List<PageInspectTable> plist=d.getRole();
        render (view:"admincreate",model:[usersInstance: new Users(params),plist:plist,ptable:PageInspectTable])
    }
    def save() {
        def usersInstance = new Users(params)
        if (!usersInstance.save(flush: true)) {
            render(view: "create", model: [usersInstance: usersInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'users.label', default: 'Users'), usersInstance.id])

       redirect(action: "show", id: usersInstance.id)

    }
    def adminsave() {
        def usersInstance = new Users(params)
        if (!usersInstance.save(flush: true)) {
            render(view: "admincreate", model: [usersInstance: usersInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'users.label', default: 'Users'), usersInstance.id])
        redirect(action: "adminshow", id: usersInstance.id)
    }

    def show(Long id) {
        def usersInstance = Users.get(id)
        if (!usersInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'users.label', default: 'Users'), id])
            redirect(action: "list")
            return
        }
        String rolename=d.getRolename(Integer.parseInt(usersInstance.uroleId.toString()));
        [usersInstance: usersInstance,rolename:rolename]
    }
    def adminshow(Long id) {
        def usersInstance = Users.get(id)
        if (!usersInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'users.label', default: 'Users'), id])
            redirect(action: "adminlist")
            return
        }
        String rolename=d.getRolename(Integer.parseInt(usersInstance.uroleId.toString()));
        [usersInstance: usersInstance,rolename:rolename]
    }

    def edit(Long id) {
        def usersInstance = Users.get(id)
        if (!usersInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'users.label', default: 'Users'), id])
            redirect(action: "list")
            return
        }
        List<PageInspectTable> plist=d.getRole();
        [usersInstance: usersInstance,plist:plist]
    }
    def adminedit(Long id) {

        def usersInstance = Users.get(id)
        if (!usersInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'users.label', default: 'Users'), id])
            redirect(action: "adminlist")
            return
        }
        List<PageInspectTable> plist=d.getRole();
        render(view:"adminedit",model:[usersInstance: usersInstance,plist:plist])
    }

    def update(Long id, Long version) {
        def usersInstance = Users.get(id)
        if (!usersInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'users.label', default: 'Users'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (usersInstance.version > version) {
                usersInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'users.label', default: 'Users')] as Object[],
                          "Another user has updated this Users while you were editing")
                render(view: "edit", model: [usersInstance: usersInstance])
                return
            }
        }

        usersInstance.properties = params

        if (!usersInstance.save(flush: true)) {
            render(view: "edit", model: [usersInstance: usersInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'users.label', default: 'Users'), usersInstance.id])
        redirect(action: "show", id: usersInstance.id)
    }
    def adminupdate(Long id, Long version) {
        def usersInstance = Users.get(id)
        if (!usersInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'users.label', default: 'Users'), id])
            redirect(action: "adminlist")
            return
        }

        if (version != null) {
            if (usersInstance.version > version) {
                usersInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'users.label', default: 'Users')] as Object[],
                        "Another user has updated this Users while you were editing")
                render(view: "adminedit", model: [usersInstance: usersInstance])
                return
            }
        }

        usersInstance.properties = params

        if (!usersInstance.save(flush: true)) {
            render(view: "adminedit", model: [usersInstance: usersInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'users.label', default: 'Users'), usersInstance.id])
        redirect(action: "adminshow", id: usersInstance.id)
    }
    def delete(Long id) {
        def usersInstance = Users.get(id)
        if (!usersInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'users.label', default: 'Users'), id])
            redirect(action: "list")
            return
        }

        try {
            usersInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'users.label', default: 'Users'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'users.label', default: 'Users'), id])
            redirect(action: "show", id: id)
        }
    }
    def admindelete(Long id) {
        System.out.print("admindelete")
        def usersInstance = Users.get(id)
        if (!usersInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'users.label', default: 'Users'), id])
            redirect(action: "adminlist")
            return
        }

        try {
            usersInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'users.label', default: 'Users'), id])
            redirect(action: "adminlist")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'users.label', default: 'Users'), id])
            redirect(action: "adminshow", id: id)
        }
    }
}
