// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package info.share.portal.domain.security;

import info.share.portal.domain.enums.EnumRole;
import info.share.portal.domain.security.SecurityRole;

privileged aspect SecurityRole_Roo_JavaBean {
    
    public EnumRole SecurityRole.getAuthority() {
        return this.authority;
    }
    
    public void SecurityRole.setAuthority(EnumRole authority) {
        this.authority = authority;
    }
    
}
