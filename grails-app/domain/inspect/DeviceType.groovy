package inspect

class DeviceType {
       String typename;
       String typenumber;
       String description;
       static hasMany = [devices:Device]
    static constraints = {
    }
}
