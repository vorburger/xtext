/*******************************************************************************
 * Copyright (c) 2014 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package org.eclipse.xtext.formatting2;

import java.util.List;

/**
 * <p>
 * Use this interface to invoke a formatter.
 * </p>
 * 
 * <p>
 * An Xtext language should have an implementation for this interface bound in its runtime module.
 * </p>
 * 
 * @see org.eclipse.xtext.formatting2 The package org.eclipse.xtext.formatting2 for an introduction to formatting
 * @see AbstractFormatter2 The base class {@code AbstractFormatter2} to implement your own formatter.
 * @see FormatterRequest The class {@code FormatterRequest} to specify what and how sould be formatted.
 * @see TextReplacements#apply(CharSequence, Iterable) {@�ode Textplacements#apply} to apply replacements to a
 *      CharSequence or String.
 * 
 * @author Moritz Eysholdt - Initial contribution and API
 * @since 2.8
 */
public interface IFormatter2 {

	/**
	 * Execute the formatter.
	 */
	List<ITextReplacement> format(FormatterRequest request);

}
