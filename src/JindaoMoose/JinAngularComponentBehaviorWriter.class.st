Class {
	#name : #JinAngularComponentBehaviorWriter,
	#superclass : #Object,
	#instVars : [
		'typescriptWriter',
		'behavior'
	],
	#category : #JindaoMoose
}

{ #category : #accessing }
JinAngularComponentBehaviorWriter >> behavior [
	^ behavior
]

{ #category : #visiting }
JinAngularComponentBehaviorWriter >> visitCSNPage: aJinCasinoPage [

	behavior := JinTypescriptClass new.
	behavior name: aJinCasinoPage name.
	behavior implements: { 
			(JinTypescriptTypeReference new
				 name: #OnInit;
				 yourself).
			(JinTypescriptTypeReference new
				 name: #OnDestroy;
				 yourself) }.
	behavior decorator: JinTypescriptDecorator new.
	behavior decorator name: 'Component'.
	behavior decorator attributes at: #selector put: aJinCasinoPage name.
	behavior decorator attributes
		at: #template
		put: './' , aJinCasinoPage name , '.component.html'.
	behavior addMethod: (JinTypescriptMethod new
			 selector: 'ngOnInit';
			 setOwnerClass: behavior;
			 type: (JinTypescriptTypeReference new
					  name: #void;
					  yourself)).
	behavior addMethod: (JinTypescriptMethod new
			 selector: 'ngOnDestroy';
			 setOwnerClass: behavior;
			 type: (JinTypescriptTypeReference new
					  name: #void;
					  yourself)).
	behavior := JinAngularProtoComponentBehavior new
		            angularModel: behavior;
		            yourself
]

{ #category : #writing }
JinAngularComponentBehaviorWriter >> writeBehaviorFor: aJinCasinoPage into: component [

	self assert: typescriptWriter isNil.
	typescriptWriter := JinTypescriptWriter new .
	aJinCasinoPage accept: self.
	component behavior: self behavior.
]
