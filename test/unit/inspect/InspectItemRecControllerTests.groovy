package inspect



import org.junit.*
import grails.test.mixin.*

@TestFor(InspectItemRecController)
@Mock(InspectItemRec)
class InspectItemRecControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/inspectItemRec/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.inspectItemRecInstanceList.size() == 0
        assert model.inspectItemRecInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.inspectItemRecInstance != null
    }

    void testSave() {
        controller.save()

        assert model.inspectItemRecInstance != null
        assert view == '/inspectItemRec/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/inspectItemRec/show/1'
        assert controller.flash.message != null
        assert InspectItemRec.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/inspectItemRec/list'

        populateValidParams(params)
        def inspectItemRec = new InspectItemRec(params)

        assert inspectItemRec.save() != null

        params.id = inspectItemRec.id

        def model = controller.show()

        assert model.inspectItemRecInstance == inspectItemRec
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/inspectItemRec/list'

        populateValidParams(params)
        def inspectItemRec = new InspectItemRec(params)

        assert inspectItemRec.save() != null

        params.id = inspectItemRec.id

        def model = controller.edit()

        assert model.inspectItemRecInstance == inspectItemRec
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/inspectItemRec/list'

        response.reset()

        populateValidParams(params)
        def inspectItemRec = new InspectItemRec(params)

        assert inspectItemRec.save() != null

        // test invalid parameters in update
        params.id = inspectItemRec.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/inspectItemRec/edit"
        assert model.inspectItemRecInstance != null

        inspectItemRec.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/inspectItemRec/show/$inspectItemRec.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        inspectItemRec.clearErrors()

        populateValidParams(params)
        params.id = inspectItemRec.id
        params.version = -1
        controller.update()

        assert view == "/inspectItemRec/edit"
        assert model.inspectItemRecInstance != null
        assert model.inspectItemRecInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/inspectItemRec/list'

        response.reset()

        populateValidParams(params)
        def inspectItemRec = new InspectItemRec(params)

        assert inspectItemRec.save() != null
        assert InspectItemRec.count() == 1

        params.id = inspectItemRec.id

        controller.delete()

        assert InspectItemRec.count() == 0
        assert InspectItemRec.get(inspectItemRec.id) == null
        assert response.redirectedUrl == '/inspectItemRec/list'
    }
}
