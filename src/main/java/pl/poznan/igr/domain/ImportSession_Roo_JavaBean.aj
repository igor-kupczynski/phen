// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.poznan.igr.domain;

import java.util.Date;
import pl.poznan.igr.domain.BlobFile;
import pl.poznan.igr.domain.Context;
import pl.poznan.igr.domain.ImportSession;

privileged aspect ImportSession_Roo_JavaBean {
    
    public Date ImportSession.getCreationDate() {
        return this.creationDate;
    }
    
    public void ImportSession.setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }
    
    public Context ImportSession.getContext() {
        return this.context;
    }
    
    public void ImportSession.setContext(Context context) {
        this.context = context;
    }
    
    public BlobFile ImportSession.getBlobFile() {
        return this.blobFile;
    }
    
    public void ImportSession.setBlobFile(BlobFile blobFile) {
        this.blobFile = blobFile;
    }
    
}
