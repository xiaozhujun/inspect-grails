package com.springsource.roo.inspect.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class DeviceInspectRec {

    /**
     */
    private String rvalue;

    /**
     */
    @ManyToOne
    private InspectItem item;

    /**
     */
    @ManyToOne
    private Device device;
}
