package inspect

class Device {
      String devname
      String numbers
      String description
      static hasMany = [tagrfid:InspectTagRfId,itemrecord:InspectItemRecord]
    static belongsTo=[type:DeviceType]
    static constraints = {
    }
}
