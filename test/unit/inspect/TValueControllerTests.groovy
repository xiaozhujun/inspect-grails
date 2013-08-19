package inspect



import org.junit.*
import grails.test.mixin.*

@TestFor(TValueController)
@Mock(TValue)
class TValueControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/TValue/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.TValueInstanceList.size() == 0
        assert model.TValueInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.TValueInstance != null
    }

    void testSave() {
        controller.save()

        assert model.TValueInstance != null
        assert view == '/TValue/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/TValue/show/1'
        assert controller.flash.message != null
        assert TValue.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/TValue/list'

        populateValidParams(params)
        def TValue = new TValue(params)

        assert TValue.save() != null

        params.id = TValue.id

        def model = controller.show()

        assert model.TValueInstance == TValue
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/TValue/list'

        populateValidParams(params)
        def TValue = new TValue(params)

        assert TValue.save() != null

        params.id = TValue.id

        def model = controller.edit()

        assert model.TValueInstance == TValue
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/TValue/list'

        response.reset()

        populateValidParams(params)
        def TValue = new TValue(params)

        assert TValue.save() != null

        // test invalid parameters in update
        params.id = TValue.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/TValue/edit"
        assert model.TValueInstance != null

        TValue.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/TValue/show/$TValue.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        TValue.clearErrors()

        populateValidParams(params)
        params.id = TValue.id
        params.version = -1
        controller.update()

        assert view == "/TValue/edit"
        assert model.TValueInstance != null
        assert model.TValueInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/TValue/list'

        response.reset()

        populateValidParams(params)
        def TValue = new TValue(params)

        assert TValue.save() != null
        assert TValue.count() == 1

        params.id = TValue.id

        controller.delete()

        assert TValue.count() == 0
        assert TValue.get(TValue.id) == null
        assert response.redirectedUrl == '/TValue/list'
    }
}
