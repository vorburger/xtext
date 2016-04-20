package org.eclipse.xtend.web.devenv

import org.eclipse.xtext.service.AbstractGenericModule
import org.eclipse.xtext.web.server.persistence.IResourceBaseProvider

class WebDevEnvModule extends AbstractGenericModule {

    val String basePath
    val ResourceBaseProvider2Impl resourceBaseProvider2Impl
    
    new (String basePath) {
        this.basePath = basePath
        resourceBaseProvider2Impl = new ResourceBaseProvider2Impl(basePath)
    }
    
    def IResourceBaseProvider bindIResourceBaseProvider() {
        resourceBaseProvider2Impl
    }

    def IResourceBaseProvider2 bindIResourceBaseProvider2() {
        resourceBaseProvider2Impl
    }

}
