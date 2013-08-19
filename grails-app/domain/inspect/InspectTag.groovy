package inspect

class InspectTag {
        String name
       String description
        String numbers
        Date createtime
        static  hasMany = [items:InspectItem,tagrfid:InspectTagRfId,itemrecord:InspectItemRecord]
    static constraints = {
    }
}
