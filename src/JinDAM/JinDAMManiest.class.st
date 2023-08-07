"
As detailed in [https://inria.hal.science/hal-02966146v1](https://inria.hal.science/hal-02966146v1), 
Microsoft Access does not have an official format to export code. 

Moreover, we can access structural information through the usage of the COM interface (implemented by the Jindao project[https://github.com/impetuosa/jindao](https://github.com/impetuosa/jindao)), and to access behavioural information through the syntactical analysis of the textual part of the code (implemented by the VBParser [https://github.com/impetuosa/VBParser](https://github.com/impetuosa/VBParser)).

However there are many things that are still complex when conducting the analysis of a Microsoft Access project. 

This DataAccessModel (DAM) extension merges the information obtained through Jindao and VBParser. To merge the different elements obtained from Jinda and VBParser we uses the Symbol table defined by the Namespaces.

The DAM model is basically a transition model, which is used to produce Alce models (An Access FAMIX model) and Moxing-Access, a model for conducting software migration. 

As DAM is used to extract different models, it is coded to taking account different levels of detail. 




"
Class {
	#name : #JinDAMManiest,
	#superclass : #PackageManifest,
	#category : #'JinDAM-Manifest'
}
