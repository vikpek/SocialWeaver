// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package at.ac.uibk.qe.sowe;

import at.ac.uibk.qe.sowe.SocialElement;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect SocialElement_Roo_Jpa_Entity {
    
    declare @type: SocialElement: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long SocialElement.id;
    
    @Version
    @Column(name = "version")
    private Integer SocialElement.version;
    
    public Long SocialElement.getId() {
        return this.id;
    }
    
    public void SocialElement.setId(Long id) {
        this.id = id;
    }
    
    public Integer SocialElement.getVersion() {
        return this.version;
    }
    
    public void SocialElement.setVersion(Integer version) {
        this.version = version;
    }
    
}
