# Jindao - Internal API
## JinModelObject
I represent a first citizen element. 
I have the feature of being loadable, i put together many faces of the same concept (ex JinForm+JinFormBody+JinVBeForm)

### Properties
description
body
project

### Methods
#### JinModelObject>>closeAndSave
Closes and save this first class citizen

#### JinModelObject>>load
Opens the first class citizen object in edition mode in the context of the Microsoft Access environment. 

#### JinModelObject>>save
Saves any modification of a firstclass citizen 

#### JinModelObject>>exportToFolder: aFolder
export as text into a given folder 

#### JinModelObject>>close
Closes this first class citizen



## JinCollection
Microsoft Access uses two kind of collections, one where the accessing to specific properties is done through property access, and a second one where is done through method activation. 
A JinCollection  and JinMethodBasedCollection are a proxy to a remote COM collection.  The first one accesses information as properties the second as method activation. 
Collections are configured with a collection handle and a factory which has the responsibility of creating proxies to the accessed entities within the collection .
The hierarchy of the collection provides slightly different behaviours: 
* JinCollection/JinMethodBasedCollection
This collection is fully virtual. It does not consume much memory. It guarantees that the accessed elements are allways *fresh* as there are allways obtained through the Microsoft Access running instances. 
	
* JinCachedCollection/JinCachedMethodCollection
This collection lazily caches the remote handles of each of the contained elements. 
This caching reduces the systematic access to the instances, however it requires to be refreshed time to time in order to ensure that the collection is trully representing the real collection.
* JinCachedEntityCollection/JinCachedEntityMethodCollection
This collection lazily caches the remote handles of each of the contained elements, and the created element
This caching reduces the systematic access to the instances and the systematic creation of entity objects. This enables to have a better degree of identity for the user of the collection. 
However it requires to be refreshed time to time in order to ensure that the collection is trully representing the real collection.

To create a new instances we encourage to use the class methods:
```
JinCollection>>newDefault 
JinCollection>>newDefaultForMethod 
```

Using this helpers eases the modification of the system consistently. 


### Properties
handle
factory
base

### Methods
#### JinCollection>>detect: aBlock
Evaluate aBlock with each of the receiver's elements as the argument.
Answer the first element for which aBlock evaluates to true.

#### JinCollection>>detect: aBlock ifFound: foundBlock ifNone: exceptionBlock
Evaluate aBlock with each of the receiver's elements as the argument.
If some element evaluates aBlock to true, then cull this element into
foundBlock and answer the result of this evaluation.
If none evaluate to true, then evaluate exceptionBlock

#### JinCollection>>select: aBlock
Evaluate aBlock with each of the receiver's elements as the argument. Collect into a new collection like the receiver, only those elements for which aBlock evaluates to true. Answer the new collection.

#### JinCollection>>first
Answer the first element of the receiver

#### JinCollection>>detect: aBlock ifFound: foundBlock
Evaluate aBlock with each of the receiver's elements as the argument.
If some element evaluates aBlock to true, then cull this element into
foundBlock.
If no element matches the criteria then do nothing.
Always returns self to avoid misuse and a potential isNil check on the sender.

#### JinCollection>>at: anIndex
Accesses the Microsoft Access instance and obtain a handle in a given anIndex. With this handle, it delegates to the factory to create an instance which wrapps the handle.

#### JinCollection>>size
Answer how many elements the receiver contains.

#### JinCollection>>select: selectBock thenDo: aBlock
	Utility method to improve readability.
Do not create the intermediate collection.

#### JinCollection>>groupedBy: aBlock
Answer a dictionary whose keys are the result of evaluating aBlock for all my elements, and the value for each key is the selection of my elements that evaluated to that key. Uses species.

#### JinCollection>>second
Answer the second element of the receiver

#### JinCollection>>do: aBlock
Evaluate aBlock with each of the receiver's elements as the argument.
This is the general foreach method, but for most standard needs there is often a more specific and simpler method.

#### JinCollection>>detect: aBlock ifNone: exceptionBlock
Evaluate aBlock with each of the receiver's elements as the argument.
Answer the first element for which aBlock evaluates to true. If none
evaluate to true, then evaluate the argument, exceptionBlock.

#### JinCollection>>reject: rejectBlock thenDo: aBlock
	Utility method to improve readability.
Do not create the intermediate collection.

#### JinCollection>>flatCollect: aBlock
Evaluate aBlock for each of the receiver's elements and answer the
list of all resulting values flatten one level. Assumes that aBlock returns some kind
of collection for each element. Equivalent to the lisp's mapcan

#### JinCollection>>base: aBase
Defines the accessing base of the collection. Often 0 or 1.

#### JinCollection>>collect: aBlock
Evaluate aBlock with each of the receiver's elements as the argument.  
Collect the resulting values into a collection like the receiver. Answer  
the new collection.


### Class Methods
#### JinCollection class>>newDefault 
Creates default class instance of collection based on property access

#### JinCollection class>>newDefaultForMethod 
Creates default class instance of collection based on method access 



## JinRemoteObjectClassGeneratorFactory
i am a factory that generates classes on demand. 

### Properties
defaultHierarchyClass
scope
nameResolver
buildingClass
packageName

### Methods
#### JinRemoteObjectClassGeneratorFactory>>classFor: aControl
Returns a class to instantiate to represent a given remote handle. If none is found, it delegates to a builder to create a Pharo Class able to hold the given handle, and to be after visit separately.



## JinRemoteObjectMappedClassFactory
This factory creates instances of a class that maps with the remote object to represent.
This factory checks a mappable classes all the subclasses of a given class (defaultHierarchyClass). 


### Properties
defaultHierarchyClass
scope
nameResolver

### Methods
#### JinRemoteObjectMappedClassFactory>>classFor: aRemoteObject ifNone: aBlock
Check in between all the subclasses of the defaultHierarchyClass if anyone is able to contain aRemoteObject handle.

#### JinRemoteObjectMappedClassFactory>>nameResolver: aBlock
Sets a block able to extract TYPE name out of a handle. The name is after used to query for possible matching classes by name



## JinRemoteObjectSingleClassFactory
I am a factory that returns allways instances of a given class. 

### Methods
#### JinRemoteObjectSingleClassFactory>>classFor: aControl ifNone: aBlock
It allways return the defaultHiearchyClass of this object. This factory yields always instances of the *same* class 



## JinRemotesFactory
A remote object factory creates instances of our model based on some guidelines. 
This different factories are configured resolve the class to create based on a naming convention for mapping. 

I am an abstract factory that gives general guidelines on the creation of an object mapping a remote object 

### Properties
defaultHierarchyClass
scope

### Methods
#### JinRemotesFactory>>classFor: aControl
Returns a class to instantiate to represent a given remote handle. If none is found, it returns the defaultHierarchyClass with which this object has been configured.

#### JinRemotesFactory>>defaultHierarchyClass: aClass
Sets the class that has been used to create new instances when required.



