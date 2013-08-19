package inspect

class Roles {
       String rolename
       Date createtime
       static hasMany = [users:Users]
    static constraints = {
    }
}
