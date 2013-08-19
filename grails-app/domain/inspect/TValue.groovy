package inspect

class TValue {
        String tvalue
        static hasMany = [item:InspectItem,itemrecord:InspectItemRecord]
        static belongsTo = [InspectItem]
    static constraints = {
    }
}
