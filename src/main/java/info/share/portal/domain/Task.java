package info.share.portal.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import javax.validation.constraints.Min;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import info.share.portal.domain.enums.Category;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import info.share.portal.domain.enums.Status;
import info.share.portal.domain.security.ShareUser;
import javax.persistence.ManyToOne;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Task {

    /**
     */
    @NotNull
    private String description;

    /**
     */
    @Min(0L)
    private BigDecimal startPrice;

    /**
     */
    @NotNull
    private String name;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    @Column(name = "creationDate", columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    private Date creationDate;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date updateDate;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date taskStartDate;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date taskEndDate;

    /**
     */
    @Enumerated(EnumType.STRING)
    private Category category;

    /**
     */
    @Enumerated(EnumType.STRING)
    private Status status;

    /**
     */
    @ManyToOne
    private ShareUser shareUser;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "task")
    private Set<Offer> offers = new HashSet<Offer>();
}
