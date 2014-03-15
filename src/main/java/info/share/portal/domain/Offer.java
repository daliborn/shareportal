package info.share.portal.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Past;
import org.springframework.format.annotation.DateTimeFormat;
import javax.persistence.ManyToOne;
import info.share.portal.domain.security.ShareUser;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Offer {

    /**
     */
    @NotNull
    private String description;

    /**
     */
    @NotNull
    private BigDecimal price;

    /**
     */
    @Past
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date createDate;

    /**
     */
    @ManyToOne
    private Task task;

    /**
     */
    @ManyToOne
    private ShareUser shareuser;
}
