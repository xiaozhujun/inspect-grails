package inspect



import org.junit.*
import grails.test.mixin.*

@TestFor(RolesController)
@Mock(Roles)
class RolesControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/roles/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.rolesInstanceList.size() == 0
        assert model.rolesInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.rolesInstance != null
    }

    void testSave() {
        controller.save()

        assert model.rolesInstance != null
        assert view == '/roles/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/roles/show/1'
        assert controller.flash.message != null
        assert Roles.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/roles/list'

        populateValidParams(params)
        def roles = new Roles(params)

        assert roles.save() != null

        params.id = roles.id

        def model = controller.show()

        assert model.rolesInstance == roles
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/roles/list'

        populateValidParams(params)
        def roles = new Roles(params)

        assert roles.save() != null

        params.id = roles.id

        def model = controller.edit()

        assert model.rolesInstance == roles
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/roles/list'

        response.reset()

        populateValidParams(params)
        def roles = new Roles(params)

        assert roles.save() != null

        // test invalid parameters in update
        params.id = roles.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/roles/edit"
        assert model.rolesInstance != null

        roles.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/roles/show/$roles.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        roles.clearErrors()

        populateValidParams(params)
        params.id = roles.id
        params.version = -1
        controller.update()

        assert view == "/roles/edit"
        assert model.rolesInstance != null
        assert model.rolesInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/roles/list'

        response.reset()

        populateValidParams(params)
        def roles = new Roles(params)

        assert roles.save() != null
        assert Roles.count() == 1

        params.id = roles.id

        controller.delete()

        assert Roles.count() == 0
        assert Roles.get(roles.id) == null
        assert response.redirectedUrl == '/roles/list'
    }
}
