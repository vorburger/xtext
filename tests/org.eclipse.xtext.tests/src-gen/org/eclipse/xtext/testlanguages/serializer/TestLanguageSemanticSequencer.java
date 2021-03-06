/*
 * generated by Xtext
 */
package org.eclipse.xtext.testlanguages.serializer;

import com.google.inject.Inject;
import com.google.inject.Provider;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.serializer.acceptor.ISemanticSequenceAcceptor;
import org.eclipse.xtext.serializer.acceptor.SequenceFeeder;
import org.eclipse.xtext.serializer.diagnostic.ISemanticSequencerDiagnosticProvider;
import org.eclipse.xtext.serializer.diagnostic.ISerializationDiagnostic.Acceptor;
import org.eclipse.xtext.serializer.sequencer.AbstractDelegatingSemanticSequencer;
import org.eclipse.xtext.serializer.sequencer.GenericSequencer;
import org.eclipse.xtext.serializer.sequencer.ISemanticNodeProvider.INodesForEObjectProvider;
import org.eclipse.xtext.serializer.sequencer.ISemanticSequencer;
import org.eclipse.xtext.serializer.sequencer.ITransientValueService;
import org.eclipse.xtext.serializer.sequencer.ITransientValueService.ValueTransient;
import org.eclipse.xtext.testlanguages.services.TestLanguageGrammarAccess;
import org.eclipse.xtext.testlanguages.testLang.ChoiceElement;
import org.eclipse.xtext.testlanguages.testLang.Model;
import org.eclipse.xtext.testlanguages.testLang.ReducibleComposite;
import org.eclipse.xtext.testlanguages.testLang.TerminalElement;
import org.eclipse.xtext.testlanguages.testLang.TestLangPackage;

@SuppressWarnings("all")
public class TestLanguageSemanticSequencer extends AbstractDelegatingSemanticSequencer {

	@Inject
	private TestLanguageGrammarAccess grammarAccess;
	
	@Override
	public void createSequence(EObject context, EObject semanticObject) {
		if(semanticObject.eClass().getEPackage() == TestLangPackage.eINSTANCE) switch(semanticObject.eClass().getClassifierID()) {
			case TestLangPackage.CHOICE_ELEMENT:
				sequence_ChoiceRule(context, (ChoiceElement) semanticObject); 
				return; 
			case TestLangPackage.MODEL:
				sequence_EntryRule(context, (Model) semanticObject); 
				return; 
			case TestLangPackage.REDUCIBLE_COMPOSITE:
				sequence_ReducibleRule(context, (ReducibleComposite) semanticObject); 
				return; 
			case TestLangPackage.TERMINAL_ELEMENT:
				sequence_TerminalRule(context, (TerminalElement) semanticObject); 
				return; 
			}
		if (errorAcceptor != null) errorAcceptor.accept(diagnosticProvider.createInvalidContextOrTypeDiagnostic(semanticObject, context));
	}
	
	/**
	 * Constraint:
	 *     (optionalKeyword?='optional'? name=ID)
	 */
	protected void sequence_ChoiceRule(EObject context, ChoiceElement semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     multiFeature+=AbstractRule*
	 */
	protected void sequence_EntryRule(EObject context, Model semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     (actionFeature+=ReducibleRule_ReducibleComposite_2_0 actionFeature+=TerminalRule)
	 */
	protected void sequence_ReducibleRule(EObject context, ReducibleComposite semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     stringFeature=STRING
	 */
	protected void sequence_TerminalRule(EObject context, TerminalElement semanticObject) {
		if(errorAcceptor != null) {
			if(transientValues.isValueTransient(semanticObject, TestLangPackage.Literals.TERMINAL_ELEMENT__STRING_FEATURE) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, TestLangPackage.Literals.TERMINAL_ELEMENT__STRING_FEATURE));
		}
		INodesForEObjectProvider nodes = createNodeProvider(semanticObject);
		SequenceFeeder feeder = createSequencerFeeder(semanticObject, nodes);
		feeder.accept(grammarAccess.getTerminalRuleAccess().getStringFeatureSTRINGTerminalRuleCall_0(), semanticObject.getStringFeature());
		feeder.finish();
	}
}
