package inspect



import org.junit.*
import grails.test.mixin.*

@TestFor(DeviceTypeController)
@Mock(DeviceType)
class DeviceTypeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/deviceType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.deviceTypeInstanceList.size() == 0
        assert model.deviceTypeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.deviceTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.deviceTypeInstance != null
        assert view == '/deviceType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/deviceType/show/1'
        assert controller.flash.message != null
        assert DeviceType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/deviceType/list'

        populateValidParams(params)
        def deviceType = new DeviceType(params)

        assert deviceType.save() != null

        params.id = deviceType.id

        def model = controller.show()

        assert model.deviceTypeInstance == deviceType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/deviceType/list'

        populateValidParams(params)
        def deviceType = new DeviceType(params)

        assert deviceType.save() != null

        params.id = deviceType.id

        def model = controller.edit()

        assert model.deviceTypeInstance == deviceType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/deviceType/list'

        response.reset()

        populateValidParams(params)
        def deviceType = new DeviceType(params)

        assert deviceType.save() != null

        // test invalid parameters in update
        params.id = deviceType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/deviceType/edit"
        assert model.deviceTypeInstance != null

        deviceType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/deviceType/show/$deviceType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        deviceType.clearErrors()

        populateValidParams(params)
        params.id = deviceType.id
        params.version = -1
        controller.update()

        assert view == "/deviceType/edit"
        assert model.deviceTypeInstance != null
        assert model.deviceTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/deviceType/list'

        response.reset()

        populateValidParams(params)
        def deviceType = new DeviceType(params)

        assert deviceType.save() != null
        assert DeviceType.count() == 1

        params.id = deviceType.id

        controller.delete()

        assert DeviceType.count() == 0
        assert DeviceType.get(deviceType.id) == null
        assert response.redirectedUrl == '/deviceType/list'
    }
}
