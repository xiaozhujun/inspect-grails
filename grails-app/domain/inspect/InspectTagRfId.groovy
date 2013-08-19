package inspect

class InspectTagRfId {
      String name
      String description
      Date createtime
      String numbers
      static belongsTo = [tagcag:InspectTag,device:Device]
    static constraints = {
    }
}
