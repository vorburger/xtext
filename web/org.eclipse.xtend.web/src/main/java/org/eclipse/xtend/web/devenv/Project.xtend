package org.eclipse.xtend.web.devenv

import org.eclipse.xtend.lib.annotations.Data
import java.io.File

@Data class Project {
    
    File baseDir
    String sourceDir
    String sourceDirLimited

}