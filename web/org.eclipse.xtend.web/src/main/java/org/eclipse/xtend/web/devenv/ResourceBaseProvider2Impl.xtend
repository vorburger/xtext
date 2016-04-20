package org.eclipse.xtend.web.devenv

import java.io.File
import java.io.IOException
import org.apache.commons.io.FileUtils
import org.eclipse.xtext.web.server.persistence.ResourceBaseProviderImpl

class ResourceBaseProvider2Impl extends ResourceBaseProviderImpl implements IResourceBaseProvider2 {
    
    protected val File resourceBase
    
    new(Project project) throws IOException {
        this(project.limitedSourceDirectory)
    }
    
    new(File resourceBase) throws IOException {
        super(resourceBase.toString)
        this.resourceBase = resourceBase
        if (!this.resourceBase.exists)
            this.resourceBase.mkdirs
        if (!this.resourceBase.isDirectory)
            throw new IllegalArgumentException("Not a directory: " + this.resourceBase)
    }
    
    override getResourceIDs() {
        FileUtils.listFiles(resourceBase, Project.xtendExtensions, true).map[resourceBase.toPath.relativize(it.toPath).toString ]
    }
    
}