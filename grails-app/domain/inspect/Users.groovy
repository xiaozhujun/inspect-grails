package inspect

class Users {
       String username
       String userpwd
       String usersex
       int userage
       String useraddress
       String hascard
       static belongsTo = [urole:Roles]
       static hasMany = [tablerecord:InspectTableRecord,itemrecord:InspectItemRecord]
    static constraints = {
    }
}
