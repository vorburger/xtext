package org.eclipse.xtext.parser.terminalrules.idea.lang;

import javax.swing.Icon;

import com.intellij.openapi.fileTypes.LanguageFileType;
import org.jetbrains.annotations.NonNls;

public final class Bug297105TestLanguageFileType extends LanguageFileType {

	public static final Bug297105TestLanguageFileType INSTANCE = new Bug297105TestLanguageFileType();
	
	@NonNls 
	public static final String DEFAULT_EXTENSION = "bug297105testlanguage";

	private Bug297105TestLanguageFileType() {
		super(Bug297105TestLanguageLanguage.INSTANCE);
	}

	public String getDefaultExtension() {
		return DEFAULT_EXTENSION;
	}

	public String getDescription() {
		return "Bug297105TestLanguage files";
	}

	public Icon getIcon() {
		return null;
	}

	public String getName() {
		return "Bug297105TestLanguage";
	}

}
