package inspect

class InspectTable {
          String tname
          Date createtime
          Roles trole
       static hasMany = [item:InspectItem,tablerecord:InspectTableRecord,itemrecord:InspectItemRecord]
    static constraints = {
    }
}
