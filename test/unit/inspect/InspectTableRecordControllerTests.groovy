package inspect



import org.junit.*
import grails.test.mixin.*

@TestFor(InspectTableRecordController)
@Mock(InspectTableRecord)
class InspectTableRecordControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/inspectTableRecord/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.inspectTableRecordInstanceList.size() == 0
        assert model.inspectTableRecordInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.inspectTableRecordInstance != null
    }

    void testSave() {
        controller.save()

        assert model.inspectTableRecordInstance != null
        assert view == '/inspectTableRecord/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/inspectTableRecord/show/1'
        assert controller.flash.message != null
        assert InspectTableRecord.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/inspectTableRecord/list'

        populateValidParams(params)
        def inspectTableRecord = new InspectTableRecord(params)

        assert inspectTableRecord.save() != null

        params.id = inspectTableRecord.id

        def model = controller.show()

        assert model.inspectTableRecordInstance == inspectTableRecord
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/inspectTableRecord/list'

        populateValidParams(params)
        def inspectTableRecord = new InspectTableRecord(params)

        assert inspectTableRecord.save() != null

        params.id = inspectTableRecord.id

        def model = controller.edit()

        assert model.inspectTableRecordInstance == inspectTableRecord
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/inspectTableRecord/list'

        response.reset()

        populateValidParams(params)
        def inspectTableRecord = new InspectTableRecord(params)

        assert inspectTableRecord.save() != null

        // test invalid parameters in update
        params.id = inspectTableRecord.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/inspectTableRecord/edit"
        assert model.inspectTableRecordInstance != null

        inspectTableRecord.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/inspectTableRecord/show/$inspectTableRecord.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        inspectTableRecord.clearErrors()

        populateValidParams(params)
        params.id = inspectTableRecord.id
        params.version = -1
        controller.update()

        assert view == "/inspectTableRecord/edit"
        assert model.inspectTableRecordInstance != null
        assert model.inspectTableRecordInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/inspectTableRecord/list'

        response.reset()

        populateValidParams(params)
        def inspectTableRecord = new InspectTableRecord(params)

        assert inspectTableRecord.save() != null
        assert InspectTableRecord.count() == 1

        params.id = inspectTableRecord.id

        controller.delete()

        assert InspectTableRecord.count() == 0
        assert InspectTableRecord.get(inspectTableRecord.id) == null
        assert response.redirectedUrl == '/inspectTableRecord/list'
    }
}
