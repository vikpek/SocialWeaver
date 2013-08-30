package at.ac.uibk.qe.sowe;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.springframework.mock.staticmock.MockStaticEntityMethods;

@RunWith(JUnit4.class)
@MockStaticEntityMethods
public class AnchorTest {

    @Test
    public void testMethod() {
        int expectedCount = 13;
        Anchor.countAnchors();
    }
}
