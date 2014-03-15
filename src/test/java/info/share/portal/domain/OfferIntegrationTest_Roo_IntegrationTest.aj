// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package info.share.portal.domain;

import info.share.portal.domain.Offer;
import info.share.portal.domain.OfferDataOnDemand;
import info.share.portal.domain.OfferIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect OfferIntegrationTest_Roo_IntegrationTest {
    
    declare @type: OfferIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: OfferIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: OfferIntegrationTest: @Transactional;
    
    @Autowired
    OfferDataOnDemand OfferIntegrationTest.dod;
    
    @Test
    public void OfferIntegrationTest.testCountOffers() {
        Assert.assertNotNull("Data on demand for 'Offer' failed to initialize correctly", dod.getRandomOffer());
        long count = Offer.countOffers();
        Assert.assertTrue("Counter for 'Offer' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void OfferIntegrationTest.testFindOffer() {
        Offer obj = dod.getRandomOffer();
        Assert.assertNotNull("Data on demand for 'Offer' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Offer' failed to provide an identifier", id);
        obj = Offer.findOffer(id);
        Assert.assertNotNull("Find method for 'Offer' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Offer' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void OfferIntegrationTest.testFindAllOffers() {
        Assert.assertNotNull("Data on demand for 'Offer' failed to initialize correctly", dod.getRandomOffer());
        long count = Offer.countOffers();
        Assert.assertTrue("Too expensive to perform a find all test for 'Offer', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Offer> result = Offer.findAllOffers();
        Assert.assertNotNull("Find all method for 'Offer' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Offer' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void OfferIntegrationTest.testFindOfferEntries() {
        Assert.assertNotNull("Data on demand for 'Offer' failed to initialize correctly", dod.getRandomOffer());
        long count = Offer.countOffers();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Offer> result = Offer.findOfferEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Offer' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Offer' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void OfferIntegrationTest.testFlush() {
        Offer obj = dod.getRandomOffer();
        Assert.assertNotNull("Data on demand for 'Offer' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Offer' failed to provide an identifier", id);
        obj = Offer.findOffer(id);
        Assert.assertNotNull("Find method for 'Offer' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyOffer(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Offer' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void OfferIntegrationTest.testMergeUpdate() {
        Offer obj = dod.getRandomOffer();
        Assert.assertNotNull("Data on demand for 'Offer' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Offer' failed to provide an identifier", id);
        obj = Offer.findOffer(id);
        boolean modified =  dod.modifyOffer(obj);
        Integer currentVersion = obj.getVersion();
        Offer merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Offer' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void OfferIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Offer' failed to initialize correctly", dod.getRandomOffer());
        Offer obj = dod.getNewTransientOffer(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Offer' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Offer' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'Offer' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void OfferIntegrationTest.testRemove() {
        Offer obj = dod.getRandomOffer();
        Assert.assertNotNull("Data on demand for 'Offer' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Offer' failed to provide an identifier", id);
        obj = Offer.findOffer(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Offer' with identifier '" + id + "'", Offer.findOffer(id));
    }
    
}
