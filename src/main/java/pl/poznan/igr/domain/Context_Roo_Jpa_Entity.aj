// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.poznan.igr.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;
import pl.poznan.igr.domain.Context;

privileged aspect Context_Roo_Jpa_Entity {
    
    declare @type: Context: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Context.id;
    
    @Version
    @Column(name = "version")
    private Integer Context.version;
    
    public Context.new() {
        super();
    }

    public Long Context.getId() {
        return this.id;
    }
    
    public void Context.setId(Long id) {
        this.id = id;
    }
    
    public Integer Context.getVersion() {
        return this.version;
    }
    
    public void Context.setVersion(Integer version) {
        this.version = version;
    }
    
}
