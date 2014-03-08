package info.share.portal.domain.security;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;

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
}