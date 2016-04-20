package org.eclipse.xtend.web.devenv

import org.eclipse.xtext.web.server.model.IWebResourceSetProvider
import org.eclipse.xtext.web.server.IServiceContext
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor
import com.google.inject.Inject
import com.google.inject.Provider
import org.eclipse.emf.ecore.resource.ResourceSet
import org.apache.commons.io.FileUtils
import org.eclipse.emf.common.util.URI

@FinalFieldsConstructor
class WebDevEnvResourceSetProvider implements IWebResourceSetProvider {
    
    val Project project
    
    @Inject Provider<ResourceSet> newResourceSetProvider;
    var ResourceSet theResourceSet; // TODO later expiring Cache Map with several RS, to provide multi project support
    
    override get(String resourceId, IServiceContext serviceContext) {
        if (theResourceSet == null) {
            theResourceSet = newResourceSetProvider.get
            loadAllFiles(project, theResourceSet)
        }
        theResourceSet
    }
    
    def loadAllFiles(Project project, ResourceSet resourceSet) {
        val xtendFiles = FileUtils.listFiles(project.sourceDirectory, Project.xtendExtensions, true)
        for (xtendFile : xtendFiles) {
        	val uri = URI.createFileURI(xtendFile.absolutePath) // URI.createURI(xtendFile.toURI().toString())
        	resourceSet.getResource(uri, true)
        }
    }
    
}