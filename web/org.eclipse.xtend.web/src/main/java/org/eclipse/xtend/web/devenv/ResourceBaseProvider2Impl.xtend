package org.eclipse.xtend.web.devenv

import java.io.File
import java.io.IOException
import org.apache.commons.io.FileUtils
import org.eclipse.xtext.web.server.persistence.ResourceBaseProviderImpl

class ResourceBaseProvider2Impl extends ResourceBaseProviderImpl implements IResourceBaseProvider2 {
    
    protected val File resourceBase
    val String[] extensions = #[ "xtend" ]
    
    new(String resourceBase) throws IOException {
        super(resourceBase)
        this.resourceBase = new File(resourceBase)
        if (!this.resourceBase.exists)
            this.resourceBase.mkdirs
        if (!this.resourceBase.isDirectory)
            throw new IllegalArgumentException("Not a directory: " + this.resourceBase)
    }
    
    override getResourceIDs() {
        FileUtils.listFiles(resourceBase, extensions, true).map[resourceBase.toPath.relativize(it.toPath).toString ]
    }
    
}