package org.eclipse.xtend.web.devenv

import org.eclipse.xtend.lib.annotations.Data
import java.io.File

@Data class Project {
    
    static public val String[] xtendExtensions = #[ "xtend" ]
    
    File baseDir
    String sourceDir
    String sourceDirLimited
    
    def getLimitedSourceDirectory() {
        new File(baseDir, sourceDir + "/" + sourceDirLimited)
    }

    def getSourceDirectory() {
        new File(baseDir, sourceDir)
    }
}