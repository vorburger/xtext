/*******************************************************************************
 * Copyright (c) 2010-2015 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package org.eclipse.xtend.web

import com.google.inject.Guice
import com.google.inject.Injector
import com.google.inject.Provider
import com.google.inject.util.Modules
import java.util.concurrent.ExecutorService
import org.eclipse.xtend.core.XtendRuntimeModule
import org.eclipse.xtend.core.XtendStandaloneSetup
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor
import org.eclipse.xtend.web.devenv.WebDevEnvModule
import org.eclipse.xtend.web.devenv.Project
import java.io.File

/**
 * Initialization support for running Xtext languages in web applications.
 */
@FinalFieldsConstructor class XtendWebSetup extends XtendStandaloneSetup {
	
	val Provider<ExecutorService> executorServiceProvider;
	
	override Injector createInjector() {
		val runtimeModule = new XtendRuntimeModule()
		val webModule = new XtendWebModule(executorServiceProvider)
     val webDevEnvModule = webDevEnvModule()
		return Guice.createInjector(Modules.combine(Modules.override(runtimeModule).with(webModule)), webDevEnvModule)
	}

	def protected webDevEnvModule() {
	    val p = new Project(new File("/home/vorburger/dev/Minecraft/SwissKnightMinecraft/SpongePowered/MyFirstSpongePlugIn"), "src/main/java", "ch/vorburger/minecraft/michaelpapa7")
	    // val p = ExamplesLibrary.exampleProject
      new WebDevEnvModule(p)
	}

}
