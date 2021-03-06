// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package info.share.portal.domain.security;

import info.share.portal.domain.security.SecurityRole;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect SecurityRole_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager SecurityRole.entityManager;
    
    public static final List<String> SecurityRole.fieldNames4OrderClauseFilter = java.util.Arrays.asList("authority");
    
    public static final EntityManager SecurityRole.entityManager() {
        EntityManager em = new SecurityRole().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long SecurityRole.countSecurityRoles() {
        return entityManager().createQuery("SELECT COUNT(o) FROM SecurityRole o", Long.class).getSingleResult();
    }
    
    public static List<SecurityRole> SecurityRole.findAllSecurityRoles() {
        return entityManager().createQuery("SELECT o FROM SecurityRole o", SecurityRole.class).getResultList();
    }
    
    public static List<SecurityRole> SecurityRole.findAllSecurityRoles(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM SecurityRole o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, SecurityRole.class).getResultList();
    }
    
    public static SecurityRole SecurityRole.findSecurityRole(Long id) {
        if (id == null) return null;
        return entityManager().find(SecurityRole.class, id);
    }
    
    public static List<SecurityRole> SecurityRole.findSecurityRoleEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM SecurityRole o", SecurityRole.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<SecurityRole> SecurityRole.findSecurityRoleEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM SecurityRole o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, SecurityRole.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void SecurityRole.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void SecurityRole.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            SecurityRole attached = SecurityRole.findSecurityRole(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void SecurityRole.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void SecurityRole.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public SecurityRole SecurityRole.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        SecurityRole merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
