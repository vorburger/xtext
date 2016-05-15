package org.eclipse.xtend.web.devenv

import ch.vorburger.hotea.util.EclipseClasspathFileReader
import com.google.inject.Inject
import com.google.inject.Provider
import java.io.File
import java.net.URL
import java.net.URLClassLoader
import java.nio.file.Path
import java.util.List
import org.apache.commons.io.FileUtils
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor
import org.eclipse.xtext.web.server.IServiceContext
import org.eclipse.xtext.web.server.model.IWebResourceSetProvider
import java.util.ArrayList
import org.eclipse.xtext.resource.XtextResourceSet

@FinalFieldsConstructor
class WebDevEnvResourceSetProvider implements IWebResourceSetProvider {
    
    // NOTE Xtext already seems to cache, as we can see that IWebResourceSetProvider.get is called only once, and not for each request.
    // So a Cache in the HTTP session (via serviceContext.session) does not appear to be needed.  If it was, see commented out code. 
    // val static SESSION_CACHE_KEY = WebDevEnvResourceSetProvider.name  
    
    val Project project
    
    @Inject Provider<ResourceSet> newResourceSetProvider;
    var ResourceSet resourceSet; // TODO later expiring Cache Map with several RS, to provide multi project support
    
    override get(String resourceId, IServiceContext serviceContext) {
        if (resourceSet == null) {
//            serviceContext.session.get(SESSION_CACHE_KEY, [
            resourceSet = newResourceSetProvider.get
            val theXtextResourceSet = resourceSet as XtextResourceSet
            theXtextResourceSet.classpathURIContext = projectClassLoader
            loadAllXtendFiles(project, resourceSet)
//            theResourceSet
//            ])
        }
        resourceSet
    }
    
    protected def loadAllXtendFiles(Project project, ResourceSet resourceSet) {
        val xtendFiles = FileUtils.listFiles(project.sourceDirectory, Project.xtendExtensions, true)
        for (xtendFile : xtendFiles) {
        	val uri = URI.createFileURI(xtendFile.absolutePath) // URI.createURI(xtendFile.toURI().toString())
        	resourceSet.getResource(uri, true)
        }
    }

    protected def URLClassLoader getProjectClassLoader() {
        val dotClasspathFile = new File(project.baseDir, ".classpath").toPath
        val paths = new EclipseClasspathFileReader(dotClasspathFile).paths
        val URL[] urls = getURLs(paths)
        val parentClassLoader = String.classLoader // NOT the one of e.g. this class, as we of course do not want the WebApp's classes to be available on the sample project's classpath!
        new URLClassLoader(urls, parentClassLoader)
    }

    //  Code to convert list of Path to URL copy/pasted from HotClassLoaderImpl
    protected def URL[] getURLs(List<Path> paths) {
        val urls = new ArrayList<URL>(paths.size())
        for (var int i = 0; i < paths.size(); i++) {
            urls.add(paths.get(i).toUri().toURL())
        }
        return urls
    }
    
}