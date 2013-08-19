package inspect

class InspectTableRecord {
      Date createtime
      int faultcount
      static belongsTo = [inspecttable:InspectTable,worker:Users]
      static hasMany = [itemrecord:InspectItemRecord]
      static constraints = {
    }
}
