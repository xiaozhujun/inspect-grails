package inspect



import org.junit.*
import grails.test.mixin.*

@TestFor(InspectTagRfIdController)
@Mock(InspectTagRfId)
class InspectTagRfIdControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/inspectTagRfId/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.inspectTagRfIdInstanceList.size() == 0
        assert model.inspectTagRfIdInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.inspectTagRfIdInstance != null
    }

    void testSave() {
        controller.save()

        assert model.inspectTagRfIdInstance != null
        assert view == '/inspectTagRfId/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/inspectTagRfId/show/1'
        assert controller.flash.message != null
        assert InspectTagRfId.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/inspectTagRfId/list'

        populateValidParams(params)
        def inspectTagRfId = new InspectTagRfId(params)

        assert inspectTagRfId.save() != null

        params.id = inspectTagRfId.id

        def model = controller.show()

        assert model.inspectTagRfIdInstance == inspectTagRfId
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/inspectTagRfId/list'

        populateValidParams(params)
        def inspectTagRfId = new InspectTagRfId(params)

        assert inspectTagRfId.save() != null

        params.id = inspectTagRfId.id

        def model = controller.edit()

        assert model.inspectTagRfIdInstance == inspectTagRfId
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/inspectTagRfId/list'

        response.reset()

        populateValidParams(params)
        def inspectTagRfId = new InspectTagRfId(params)

        assert inspectTagRfId.save() != null

        // test invalid parameters in update
        params.id = inspectTagRfId.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/inspectTagRfId/edit"
        assert model.inspectTagRfIdInstance != null

        inspectTagRfId.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/inspectTagRfId/show/$inspectTagRfId.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        inspectTagRfId.clearErrors()

        populateValidParams(params)
        params.id = inspectTagRfId.id
        params.version = -1
        controller.update()

        assert view == "/inspectTagRfId/edit"
        assert model.inspectTagRfIdInstance != null
        assert model.inspectTagRfIdInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/inspectTagRfId/list'

        response.reset()

        populateValidParams(params)
        def inspectTagRfId = new InspectTagRfId(params)

        assert inspectTagRfId.save() != null
        assert InspectTagRfId.count() == 1

        params.id = inspectTagRfId.id

        controller.delete()

        assert InspectTagRfId.count() == 0
        assert InspectTagRfId.get(inspectTagRfId.id) == null
        assert response.redirectedUrl == '/inspectTagRfId/list'
    }
}
