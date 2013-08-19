package inspect



import org.junit.*
import grails.test.mixin.*

@TestFor(InspectTableController)
@Mock(InspectTable)
class InspectTableControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/inspectTable/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.inspectTableInstanceList.size() == 0
        assert model.inspectTableInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.inspectTableInstance != null
    }

    void testSave() {
        controller.save()

        assert model.inspectTableInstance != null
        assert view == '/inspectTable/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/inspectTable/show/1'
        assert controller.flash.message != null
        assert InspectTable.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/inspectTable/list'

        populateValidParams(params)
        def inspectTable = new InspectTable(params)

        assert inspectTable.save() != null

        params.id = inspectTable.id

        def model = controller.show()

        assert model.inspectTableInstance == inspectTable
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/inspectTable/list'

        populateValidParams(params)
        def inspectTable = new InspectTable(params)

        assert inspectTable.save() != null

        params.id = inspectTable.id

        def model = controller.edit()

        assert model.inspectTableInstance == inspectTable
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/inspectTable/list'

        response.reset()

        populateValidParams(params)
        def inspectTable = new InspectTable(params)

        assert inspectTable.save() != null

        // test invalid parameters in update
        params.id = inspectTable.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/inspectTable/edit"
        assert model.inspectTableInstance != null

        inspectTable.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/inspectTable/show/$inspectTable.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        inspectTable.clearErrors()

        populateValidParams(params)
        params.id = inspectTable.id
        params.version = -1
        controller.update()

        assert view == "/inspectTable/edit"
        assert model.inspectTableInstance != null
        assert model.inspectTableInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/inspectTable/list'

        response.reset()

        populateValidParams(params)
        def inspectTable = new InspectTable(params)

        assert inspectTable.save() != null
        assert InspectTable.count() == 1

        params.id = inspectTable.id

        controller.delete()

        assert InspectTable.count() == 0
        assert InspectTable.get(inspectTable.id) == null
        assert response.redirectedUrl == '/inspectTable/list'
    }
}
