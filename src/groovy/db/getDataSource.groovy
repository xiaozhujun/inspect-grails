package db

import org.codehaus.groovy.grails.commons.ConfigurationHolder

/**
 * Created with IntelliJ IDEA.
 * User: ThinkPad
 * Date: 13-10-22
 * Time: 下午9:59
 * To change this template use File | Settings | File Templates.
 */
class getDataSource {
    static String geturl(){
        ConfigurationHolder.config.urlParameter
    }
}
