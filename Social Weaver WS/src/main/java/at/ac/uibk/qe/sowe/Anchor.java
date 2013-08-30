package at.ac.uibk.qe.sowe;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.OneToMany;
import javax.persistence.TypedQuery;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson
public class Anchor {

    private static final long HASH_VAL = 7;

    @Column(name = "oid", unique = true)
    private long oid;

    @Column(name = "url")
    private String url;

    @Column(name = "binaryPayload")
    private byte[] binaryPayload;

    private String payload;

    @Column(name = "lastModifiedTimestamp")
    private long lastModifiedTimestamp;

    @OneToMany(cascade = CascadeType.ALL)
    private Set<SocialElement> socialElement = new HashSet<SocialElement>();


    public static List<at.ac.uibk.qe.sowe.Anchor> findAllAnchorsWithNewerTimestamp(long ts) {
        TypedQuery<Anchor> query = entityManager().createQuery("SELECT o FROM Anchor o WHERE o.lastModifiedTimestamp > :ts", Anchor.class);
        query.setParameter("ts", ts);
        return query.getResultList();
    }

    public void resetLastModifiedTimestamp() {
        lastModifiedTimestamp = new Date().getTime();
    }

    public void setGeneratedOid() {
        oid = oidGenerator();
    }

    private long oidGenerator() {
        long hash = HASH_VAL;
        String relStr = generateOidRelevantString();
        for (int i = 0; i < relStr.length(); i++) {
            hash = hash * 31 + relStr.charAt(i);
        }
        return hash;
    }

    @Transactional
    public void persist() {
        if (this.entityManager == null) {
            this.entityManager = entityManager();
        }
        this.setGeneratedOid();
        this.resetLastModifiedTimestamp();
        this.entityManager.persist(this);
    }

    private String generateOidRelevantString() {
        return new String(binaryPayload);
    }
}
