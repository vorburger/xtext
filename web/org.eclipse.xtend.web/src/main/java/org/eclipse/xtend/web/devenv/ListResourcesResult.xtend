package org.eclipse.xtend.web.devenv

import org.eclipse.xtend.lib.annotations.Data
import org.eclipse.xtext.web.server.IServiceResult
import java.util.List

@Data
class ListResourcesResult implements IServiceResult {

    List<String> resouceIDs
    
}
