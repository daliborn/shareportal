// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package info.share.portal.domain.security;

import info.share.portal.domain.security.ShareUser;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ShareUser_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ShareUser.entityManager;
    
    public static final List<String> ShareUser.fieldNames4OrderClauseFilter = java.util.Arrays.asList("username", "password", "enabled", "offers");
    
    public static final EntityManager ShareUser.entityManager() {
        EntityManager em = new ShareUser().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ShareUser.countShareUsers() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ShareUser o", Long.class).getSingleResult();
    }
    
    public static List<ShareUser> ShareUser.findAllShareUsers() {
        return entityManager().createQuery("SELECT o FROM ShareUser o", ShareUser.class).getResultList();
    }
    
    public static List<ShareUser> ShareUser.findAllShareUsers(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM ShareUser o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, ShareUser.class).getResultList();
    }
    
    public static ShareUser ShareUser.findShareUser(Long id) {
        if (id == null) return null;
        return entityManager().find(ShareUser.class, id);
    }
    
    public static List<ShareUser> ShareUser.findShareUserEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ShareUser o", ShareUser.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<ShareUser> ShareUser.findShareUserEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM ShareUser o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, ShareUser.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ShareUser.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ShareUser.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ShareUser attached = ShareUser.findShareUser(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ShareUser.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ShareUser.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ShareUser ShareUser.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ShareUser merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
