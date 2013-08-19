package inspect



import org.junit.*
import grails.test.mixin.*

@TestFor(InspectTagController)
@Mock(InspectTag)
class InspectTagControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/inspectTag/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.inspectTagInstanceList.size() == 0
        assert model.inspectTagInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.inspectTagInstance != null
    }

    void testSave() {
        controller.save()

        assert model.inspectTagInstance != null
        assert view == '/inspectTag/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/inspectTag/show/1'
        assert controller.flash.message != null
        assert InspectTag.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/inspectTag/list'

        populateValidParams(params)
        def inspectTag = new InspectTag(params)

        assert inspectTag.save() != null

        params.id = inspectTag.id

        def model = controller.show()

        assert model.inspectTagInstance == inspectTag
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/inspectTag/list'

        populateValidParams(params)
        def inspectTag = new InspectTag(params)

        assert inspectTag.save() != null

        params.id = inspectTag.id

        def model = controller.edit()

        assert model.inspectTagInstance == inspectTag
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/inspectTag/list'

        response.reset()

        populateValidParams(params)
        def inspectTag = new InspectTag(params)

        assert inspectTag.save() != null

        // test invalid parameters in update
        params.id = inspectTag.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/inspectTag/edit"
        assert model.inspectTagInstance != null

        inspectTag.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/inspectTag/show/$inspectTag.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        inspectTag.clearErrors()

        populateValidParams(params)
        params.id = inspectTag.id
        params.version = -1
        controller.update()

        assert view == "/inspectTag/edit"
        assert model.inspectTagInstance != null
        assert model.inspectTagInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/inspectTag/list'

        response.reset()

        populateValidParams(params)
        def inspectTag = new InspectTag(params)

        assert inspectTag.save() != null
        assert InspectTag.count() == 1

        params.id = inspectTag.id

        controller.delete()

        assert InspectTag.count() == 0
        assert InspectTag.get(inspectTag.id) == null
        assert response.redirectedUrl == '/inspectTag/list'
    }
}
