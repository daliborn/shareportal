package info.share.portal.domain;

import javax.validation.ConstraintViolationException;

import org.junit.Test;
import org.springframework.roo.addon.test.RooIntegrationTest;

@RooIntegrationTest(entity = Task.class)
public class TaskIntegrationTest {

	@Test
	public void testMarkerMethod() {
	}

	@Test(expected = ConstraintViolationException.class)
	public void testInvalidCourse() {
		Task task = new Task();
		task.persist();
	}
}
