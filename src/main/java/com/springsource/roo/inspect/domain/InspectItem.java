package com.springsource.roo.inspect.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.Column;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class InspectItem {

    /**
     */
    @Column(unique = true)
    private String name;

    /**
     */
    private String description;

    /**
     */
    private String itemvalue;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date createtime;

    /**
     */
    private String numbers;

    /**
     */
    @ManyToOne
    private InspectTable inspecttable;

    /**
     */
    @ManyToOne
    private InspectTag tag;
}
