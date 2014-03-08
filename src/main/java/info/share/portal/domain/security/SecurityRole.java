package info.share.portal.domain.security;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import info.share.portal.domain.enums.EnumRole;
import javax.persistence.Enumerated;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class SecurityRole {

    /**
     */
    @NotNull
    @Enumerated
    private EnumRole authority;
}
