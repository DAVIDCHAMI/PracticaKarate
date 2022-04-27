package conduit;

import com.intuit.karate.junit5.Karate;

class counduitTest {
    
    @Karate.Test
    Karate testTags() {
        return Karate.run().relativeTo(getClass());
    }    

}

