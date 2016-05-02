package org.eclipse.xtend.web.devenv

import org.eclipse.xtext.web.server.model.IWebResourceSetProvider
import org.eclipse.xtext.web.server.IServiceContext
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor
import com.google.inject.Inject
import com.google.inject.Provider
import org.eclipse.emf.ecore.resource.ResourceSet
import org.apache.commons.io.FileUtils
import org.eclipse.emf.common.util.URI
import java.net.URLClassLoader
import java.io.File
import java.net.URL
import org.eclipse.xtext.resource.XtextResourceSet

@FinalFieldsConstructor
class WebDevEnvResourceSetProvider implements IWebResourceSetProvider {
    
    // TODO Test refs should already work for classes from the web app, like this one 
    // TODO Cache session needed, or not? is IWebResourceSetProvider.get called for each request?

    // NOTE No need for something like e.g. in org.eclipse.emf.mwe.utils.StandaloneSetup.setScanClassPath(boolean) here..
    
//    val static SESSION_CACHE_KEY = WebDevEnvResourceSetProvider.name  
    
    val Project project
    
    @Inject Provider<ResourceSet> newResourceSetProvider;
    var ResourceSet theResourceSet; // TODO later expiring Cache Map with several RS, to provide multi project support
    
    override get(String resourceId, IServiceContext serviceContext) {
        if (theResourceSet == null) {
            println("No ResourceSet, creating a new one now..")
//            serviceContext.session.get(SESSION_CACHE_KEY, [
            theResourceSet = newResourceSetProvider.get
            loadAllFiles(project, theResourceSet)
            // TODO (theResourceSet as XtextResourceSet).classpathURIContext = projectClassLoader
//            theResourceSet
//            ])
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

    def URLClassLoader getProjectClassLoader() {
        val dotClasspathFile = new File(project.baseDir, ".classpath").toPath
        // val paths = new EclipseClasspathFileReader(dotClasspathFile).paths
        // TODO factor out the code to convert list of Path to URL from HotClassLoaderImpl into a Util so we can use it here
        val URL[] urls = null
        val parentClassLoader = String.classLoader // NOT the one of e.g. this class, as we of course do not want the WebApp's classes to be available on the sample project's classpath!
        new URLClassLoader(urls, parentClassLoader)
    }
}