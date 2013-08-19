package inspect



import org.junit.*
import grails.test.mixin.*

@TestFor(InspectItemRecordController)
@Mock(InspectItemRecord)
class InspectItemRecordControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/inspectItemRecord/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.inspectItemRecordInstanceList.size() == 0
        assert model.inspectItemRecordInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.inspectItemRecordInstance != null
    }

    void testSave() {
        controller.save()

        assert model.inspectItemRecordInstance != null
        assert view == '/inspectItemRecord/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/inspectItemRecord/show/1'
        assert controller.flash.message != null
        assert InspectItemRecord.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/inspectItemRecord/list'

        populateValidParams(params)
        def inspectItemRecord = new InspectItemRecord(params)

        assert inspectItemRecord.save() != null

        params.id = inspectItemRecord.id

        def model = controller.show()

        assert model.inspectItemRecordInstance == inspectItemRecord
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/inspectItemRecord/list'

        populateValidParams(params)
        def inspectItemRecord = new InspectItemRecord(params)

        assert inspectItemRecord.save() != null

        params.id = inspectItemRecord.id

        def model = controller.edit()

        assert model.inspectItemRecordInstance == inspectItemRecord
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/inspectItemRecord/list'

        response.reset()

        populateValidParams(params)
        def inspectItemRecord = new InspectItemRecord(params)

        assert inspectItemRecord.save() != null

        // test invalid parameters in update
        params.id = inspectItemRecord.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/inspectItemRecord/edit"
        assert model.inspectItemRecordInstance != null

        inspectItemRecord.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/inspectItemRecord/show/$inspectItemRecord.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        inspectItemRecord.clearErrors()

        populateValidParams(params)
        params.id = inspectItemRecord.id
        params.version = -1
        controller.update()

        assert view == "/inspectItemRecord/edit"
        assert model.inspectItemRecordInstance != null
        assert model.inspectItemRecordInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/inspectItemRecord/list'

        response.reset()

        populateValidParams(params)
        def inspectItemRecord = new InspectItemRecord(params)

        assert inspectItemRecord.save() != null
        assert InspectItemRecord.count() == 1

        params.id = inspectItemRecord.id

        controller.delete()

        assert InspectItemRecord.count() == 0
        assert InspectItemRecord.get(inspectItemRecord.id) == null
        assert response.redirectedUrl == '/inspectItemRecord/list'
    }
}
