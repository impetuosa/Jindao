# JinNamespaces - Internal API
## JinNSSDKLibraryBuilder
This builder is in charge of installing names that are not available in the respective language libraries.
For doing so, it installs mainly Aliases and primitive type names.
The names deifned in this class are the only names that are not extracted from the source code and library analysis. 

### Properties
namespace
owner

### Methods
#### JinNSSDKLibraryBuilder>>globals
All globals defined artificially to properly represent the VBA language

#### JinNSSDKLibraryBuilder>>aliasTypes
All aliases defined artificially to properly represent the VBA language

#### JinNSSDKLibraryBuilder>>primitiveTypes
All primitive types defined artificially to properly represent the VBA language



## JinSharedCollection
The namespace calculation is architecturized to be done concurrently, as it requires many IO operations. 
For this we provide this shared collection, which manages the concurrent writing and reading of elements. 
Please note that any iteration of the elements of the collection happens over a copy of the internal collection, for what it isdiscouraged to work with indexes.
 


### Properties
mutex
collection

### Methods
#### JinSharedCollection>>collect: aBlock
SAFELY applies collect: to the collection

#### JinSharedCollection>>add: anObject
SAFELY add element to the collection

#### JinSharedCollection>>unsafeCopyCollection
UNSAFELY copies the internal collection directly

#### JinSharedCollection>>unsafeSelect: aFullBlockClosure
UNSAFELY applies select: to the internal collection directly

#### JinSharedCollection>>do: aBlock
SAFELY applies do: to the collection

#### JinSharedCollection>>anySatisfy: aBlock
SAFELY applies anySatisfy: to the collection

#### JinSharedCollection>>select: aBlock
SAFELY applies select: to the collection

#### JinSharedCollection>>copyCollection
SAFELY copy the collection. Used internally for most of the collection API

#### JinSharedCollection>>allSatisfy: aBlock
SAFELY applies allSatisfy: to the collection

#### JinSharedCollection>>flatCollect: aFullBlockClosure
UNSAFE applies flatCollect directly to the internal collection



