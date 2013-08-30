// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package at.ac.uibk.qe.sowe;

import at.ac.uibk.qe.sowe.Anchor;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Anchor_Roo_Json {
    
    public String Anchor.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static Anchor Anchor.fromJsonToAnchor(String json) {
        return new JSONDeserializer<Anchor>().use(null, Anchor.class).deserialize(json);
    }
    
    public static String Anchor.toJsonArray(Collection<Anchor> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<Anchor> Anchor.fromJsonArrayToAnchors(String json) {
        return new JSONDeserializer<List<Anchor>>().use(null, ArrayList.class).use("values", Anchor.class).deserialize(json);
    }
    
}
