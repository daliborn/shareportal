package info.share.portal.domain.security;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import info.share.portal.domain.Offer;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class ShareUser {

    /**
     */
    @NotNull
    private String username;

    /**
     */
    @NotNull
    private String password;

    /**
     */
    @NotNull
    private Boolean enabled;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
    private Set<Offer> offers = new HashSet<Offer>();
}
