// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.poznan.igr.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;
import pl.poznan.igr.domain.ImportSession;

privileged aspect ImportSession_Roo_Jpa_Entity {
    
    declare @type: ImportSession: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long ImportSession.id;
    
    @Version
    @Column(name = "version")
    private Integer ImportSession.version;
    
    public ImportSession.new() {
        super();
    }

    public Long ImportSession.getId() {
        return this.id;
    }
    
    public void ImportSession.setId(Long id) {
        this.id = id;
    }
    
    public Integer ImportSession.getVersion() {
        return this.version;
    }
    
    public void ImportSession.setVersion(Integer version) {
        this.version = version;
    }
    
}
