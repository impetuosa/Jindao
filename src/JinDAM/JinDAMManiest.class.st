"
As detailed in [https://inria.hal.science/hal-02966146v1](https://inria.hal.science/hal-02966146v1), 
Microsoft Access does not have an official format to export code. 

Moreover, we can access structural information through the usage of the COM interface (implemented by the Jindao project[https://github.com/impetuosa/jindao](https://github.com/impetuosa/jindao)), and to access behavioural information through the syntactical analysis of the textual part of the code (implemented by the VBParser [https://github.com/impetuosa/VBParser](https://github.com/impetuosa/VBParser)).

However there are many things that are still complex when conducting the analysis of a Microsoft Access project. 
"
Class {
	#name : #JinDAMManiest,
	#superclass : #PackageManifest,
	#category : #'JinDAM-Manifest'
}
