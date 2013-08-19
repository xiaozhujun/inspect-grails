package inspect



import org.junit.*
import grails.test.mixin.*

@TestFor(InspectItemController)
@Mock(InspectItem)
class InspectItemControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/inspectItem/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.inspectItemInstanceList.size() == 0
        assert model.inspectItemInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.inspectItemInstance != null
    }

    void testSave() {
        controller.save()

        assert model.inspectItemInstance != null
        assert view == '/inspectItem/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/inspectItem/show/1'
        assert controller.flash.message != null
        assert InspectItem.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/inspectItem/list'

        populateValidParams(params)
        def inspectItem = new InspectItem(params)

        assert inspectItem.save() != null

        params.id = inspectItem.id

        def model = controller.show()

        assert model.inspectItemInstance == inspectItem
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/inspectItem/list'

        populateValidParams(params)
        def inspectItem = new InspectItem(params)

        assert inspectItem.save() != null

        params.id = inspectItem.id

        def model = controller.edit()

        assert model.inspectItemInstance == inspectItem
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/inspectItem/list'

        response.reset()

        populateValidParams(params)
        def inspectItem = new InspectItem(params)

        assert inspectItem.save() != null

        // test invalid parameters in update
        params.id = inspectItem.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/inspectItem/edit"
        assert model.inspectItemInstance != null

        inspectItem.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/inspectItem/show/$inspectItem.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        inspectItem.clearErrors()

        populateValidParams(params)
        params.id = inspectItem.id
        params.version = -1
        controller.update()

        assert view == "/inspectItem/edit"
        assert model.inspectItemInstance != null
        assert model.inspectItemInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/inspectItem/list'

        response.reset()

        populateValidParams(params)
        def inspectItem = new InspectItem(params)

        assert inspectItem.save() != null
        assert InspectItem.count() == 1

        params.id = inspectItem.id

        controller.delete()

        assert InspectItem.count() == 0
        assert InspectItem.get(inspectItem.id) == null
        assert response.redirectedUrl == '/inspectItem/list'
    }
}
