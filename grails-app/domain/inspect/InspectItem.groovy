package inspect

class InspectItem {
      String name
      String description
      Date createtime
      String numbers
      String isInput
      String unit
      static belongsTo = [tag:InspectTag,inspecttable:InspectTable]
      static hasMany = [tvalues:TValue,itemrecord:InspectItemRecord]
    static constraints = {
    }
}
