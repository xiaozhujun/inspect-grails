package inspect

class InspectItemRecord {
           Date createtime
           static belongsTo = [inspecttable:InspectTable,tag:InspectTag,item:InspectItem,ivalue:TValue,inspecttablerec:InspectTableRecord,worker:Users,dnumber:Device]
    static constraints = {
    }
}
