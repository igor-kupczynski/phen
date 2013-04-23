// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.poznan.igr.domain;

import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import pl.poznan.igr.domain.StatsSession;
import pl.poznan.igr.domain.StatsSessionDataOnDemand;
import pl.poznan.igr.domain.StatsSessionIntegrationTest;

privileged aspect StatsSessionIntegrationTest_Roo_IntegrationTest {
    
    declare @type: StatsSessionIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: StatsSessionIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: StatsSessionIntegrationTest: @Transactional;
    
    @Autowired
    StatsSessionDataOnDemand StatsSessionIntegrationTest.dod;
    
    @Test
    public void StatsSessionIntegrationTest.testCountStatsSessions() {
        Assert.assertNotNull("Data on demand for 'StatsSession' failed to initialize correctly", dod.getRandomStatsSession());
        long count = StatsSession.countStatsSessions();
        Assert.assertTrue("Counter for 'StatsSession' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void StatsSessionIntegrationTest.testFindStatsSession() {
        StatsSession obj = dod.getRandomStatsSession();
        Assert.assertNotNull("Data on demand for 'StatsSession' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'StatsSession' failed to provide an identifier", id);
        obj = StatsSession.findStatsSession(id);
        Assert.assertNotNull("Find method for 'StatsSession' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'StatsSession' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void StatsSessionIntegrationTest.testFindAllStatsSessions() {
        Assert.assertNotNull("Data on demand for 'StatsSession' failed to initialize correctly", dod.getRandomStatsSession());
        long count = StatsSession.countStatsSessions();
        Assert.assertTrue("Too expensive to perform a find all test for 'StatsSession', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<StatsSession> result = StatsSession.findAllStatsSessions();
        Assert.assertNotNull("Find all method for 'StatsSession' illegally returned null", result);
        Assert.assertTrue("Find all method for 'StatsSession' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void StatsSessionIntegrationTest.testFindStatsSessionEntries() {
        Assert.assertNotNull("Data on demand for 'StatsSession' failed to initialize correctly", dod.getRandomStatsSession());
        long count = StatsSession.countStatsSessions();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<StatsSession> result = StatsSession.findStatsSessionEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'StatsSession' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'StatsSession' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void StatsSessionIntegrationTest.testFlush() {
        StatsSession obj = dod.getRandomStatsSession();
        Assert.assertNotNull("Data on demand for 'StatsSession' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'StatsSession' failed to provide an identifier", id);
        obj = StatsSession.findStatsSession(id);
        Assert.assertNotNull("Find method for 'StatsSession' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyStatsSession(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'StatsSession' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void StatsSessionIntegrationTest.testMergeUpdate() {
        StatsSession obj = dod.getRandomStatsSession();
        Assert.assertNotNull("Data on demand for 'StatsSession' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'StatsSession' failed to provide an identifier", id);
        obj = StatsSession.findStatsSession(id);
        boolean modified =  dod.modifyStatsSession(obj);
        Integer currentVersion = obj.getVersion();
        StatsSession merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'StatsSession' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void StatsSessionIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'StatsSession' failed to initialize correctly", dod.getRandomStatsSession());
        StatsSession obj = dod.getNewTransientStatsSession(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'StatsSession' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'StatsSession' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'StatsSession' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void StatsSessionIntegrationTest.testRemove() {
        StatsSession obj = dod.getRandomStatsSession();
        Assert.assertNotNull("Data on demand for 'StatsSession' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'StatsSession' failed to provide an identifier", id);
        obj = StatsSession.findStatsSession(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'StatsSession' with identifier '" + id + "'", StatsSession.findStatsSession(id));
    }
    
}
