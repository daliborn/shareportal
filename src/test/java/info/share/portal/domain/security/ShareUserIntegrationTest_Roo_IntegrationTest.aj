// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package info.share.portal.domain.security;

import info.share.portal.domain.security.ShareUser;
import info.share.portal.domain.security.ShareUserDataOnDemand;
import info.share.portal.domain.security.ShareUserIntegrationTest;
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

privileged aspect ShareUserIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ShareUserIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ShareUserIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ShareUserIntegrationTest: @Transactional;
    
    @Autowired
    ShareUserDataOnDemand ShareUserIntegrationTest.dod;
    
    @Test
    public void ShareUserIntegrationTest.testCountShareUsers() {
        Assert.assertNotNull("Data on demand for 'ShareUser' failed to initialize correctly", dod.getRandomShareUser());
        long count = ShareUser.countShareUsers();
        Assert.assertTrue("Counter for 'ShareUser' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ShareUserIntegrationTest.testFindShareUser() {
        ShareUser obj = dod.getRandomShareUser();
        Assert.assertNotNull("Data on demand for 'ShareUser' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ShareUser' failed to provide an identifier", id);
        obj = ShareUser.findShareUser(id);
        Assert.assertNotNull("Find method for 'ShareUser' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'ShareUser' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ShareUserIntegrationTest.testFindAllShareUsers() {
        Assert.assertNotNull("Data on demand for 'ShareUser' failed to initialize correctly", dod.getRandomShareUser());
        long count = ShareUser.countShareUsers();
        Assert.assertTrue("Too expensive to perform a find all test for 'ShareUser', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<ShareUser> result = ShareUser.findAllShareUsers();
        Assert.assertNotNull("Find all method for 'ShareUser' illegally returned null", result);
        Assert.assertTrue("Find all method for 'ShareUser' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ShareUserIntegrationTest.testFindShareUserEntries() {
        Assert.assertNotNull("Data on demand for 'ShareUser' failed to initialize correctly", dod.getRandomShareUser());
        long count = ShareUser.countShareUsers();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<ShareUser> result = ShareUser.findShareUserEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'ShareUser' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'ShareUser' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ShareUserIntegrationTest.testFlush() {
        ShareUser obj = dod.getRandomShareUser();
        Assert.assertNotNull("Data on demand for 'ShareUser' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ShareUser' failed to provide an identifier", id);
        obj = ShareUser.findShareUser(id);
        Assert.assertNotNull("Find method for 'ShareUser' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyShareUser(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'ShareUser' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ShareUserIntegrationTest.testMergeUpdate() {
        ShareUser obj = dod.getRandomShareUser();
        Assert.assertNotNull("Data on demand for 'ShareUser' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ShareUser' failed to provide an identifier", id);
        obj = ShareUser.findShareUser(id);
        boolean modified =  dod.modifyShareUser(obj);
        Integer currentVersion = obj.getVersion();
        ShareUser merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'ShareUser' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ShareUserIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'ShareUser' failed to initialize correctly", dod.getRandomShareUser());
        ShareUser obj = dod.getNewTransientShareUser(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'ShareUser' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'ShareUser' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'ShareUser' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ShareUserIntegrationTest.testRemove() {
        ShareUser obj = dod.getRandomShareUser();
        Assert.assertNotNull("Data on demand for 'ShareUser' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ShareUser' failed to provide an identifier", id);
        obj = ShareUser.findShareUser(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'ShareUser' with identifier '" + id + "'", ShareUser.findShareUser(id));
    }
    
}