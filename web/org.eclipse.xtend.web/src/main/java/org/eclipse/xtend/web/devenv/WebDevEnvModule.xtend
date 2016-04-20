package org.eclipse.xtend.web.devenv

import org.eclipse.xtext.service.AbstractGenericModule
import org.eclipse.xtext.web.server.persistence.IResourceBaseProvider
import org.eclipse.xtext.web.server.model.IWebResourceSetProvider

class WebDevEnvModule extends AbstractGenericModule {

    val Project project
    val ResourceBaseProvider2Impl resourceBaseProvider2Impl
    
    new (Project project) {
        this.project = project
        resourceBaseProvider2Impl = new ResourceBaseProvider2Impl(project)
    }
    
    def IWebResourceSetProvider bindIWebResourceSetProvider() {
        new WebDevEnvResourceSetProvider(project)
    }
    
    def IResourceBaseProvider bindIResourceBaseProvider() {
        resourceBaseProvider2Impl
    }

    def IResourceBaseProvider2 bindIResourceBaseProvider2() {
        resourceBaseProvider2Impl
    }

}
