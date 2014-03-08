// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package info.share.portal.domain.security;

import info.share.portal.domain.enums.EnumRole;
import info.share.portal.domain.security.SecurityRole;
import info.share.portal.domain.security.SecurityRoleDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect SecurityRoleDataOnDemand_Roo_DataOnDemand {
    
    declare @type: SecurityRoleDataOnDemand: @Component;
    
    private Random SecurityRoleDataOnDemand.rnd = new SecureRandom();
    
    private List<SecurityRole> SecurityRoleDataOnDemand.data;
    
    public SecurityRole SecurityRoleDataOnDemand.getNewTransientSecurityRole(int index) {
        SecurityRole obj = new SecurityRole();
        setAuthority(obj, index);
        return obj;
    }
    
    public void SecurityRoleDataOnDemand.setAuthority(SecurityRole obj, int index) {
        EnumRole authority = EnumRole.class.getEnumConstants()[0];
        obj.setAuthority(authority);
    }
    
    public SecurityRole SecurityRoleDataOnDemand.getSpecificSecurityRole(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        SecurityRole obj = data.get(index);
        Long id = obj.getId();
        return SecurityRole.findSecurityRole(id);
    }
    
    public SecurityRole SecurityRoleDataOnDemand.getRandomSecurityRole() {
        init();
        SecurityRole obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return SecurityRole.findSecurityRole(id);
    }
    
    public boolean SecurityRoleDataOnDemand.modifySecurityRole(SecurityRole obj) {
        return false;
    }
    
    public void SecurityRoleDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = SecurityRole.findSecurityRoleEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'SecurityRole' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<SecurityRole>();
        for (int i = 0; i < 10; i++) {
            SecurityRole obj = getNewTransientSecurityRole(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
