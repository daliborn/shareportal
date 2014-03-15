// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package info.share.portal.domain;

import info.share.portal.domain.Offer;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Offer_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Offer.entityManager;
    
    public static final List<String> Offer.fieldNames4OrderClauseFilter = java.util.Arrays.asList("description", "price", "createDate");
    
    public static final EntityManager Offer.entityManager() {
        EntityManager em = new Offer().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Offer.countOffers() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Offer o", Long.class).getSingleResult();
    }
    
    public static List<Offer> Offer.findAllOffers() {
        return entityManager().createQuery("SELECT o FROM Offer o", Offer.class).getResultList();
    }
    
    public static List<Offer> Offer.findAllOffers(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Offer o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Offer.class).getResultList();
    }
    
    public static Offer Offer.findOffer(Long id) {
        if (id == null) return null;
        return entityManager().find(Offer.class, id);
    }
    
    public static List<Offer> Offer.findOfferEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Offer o", Offer.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Offer> Offer.findOfferEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Offer o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Offer.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Offer.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Offer.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Offer attached = Offer.findOffer(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Offer.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Offer.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Offer Offer.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Offer merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
