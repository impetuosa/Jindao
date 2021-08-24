Class {
	#name : #JinDAMSDKLibraryBuilder,
	#superclass : #Object,
	#instVars : [
		'model',
		'created',
		'importer'
	],
	#category : #'JinDAM-Importer-Helpers'
}

{ #category : #'as yet unclassified' }
JinDAMSDKLibraryBuilder class >> forModel: aModel [

	^ self new
		  model: aModel;
		  yourself
]

{ #category : #'as yet unclassified' }
JinDAMSDKLibraryBuilder class >> forModel: aJinDAMModel importer: aJinDAMDispatchingImporter [

	^ self new
		  model: aJinDAMModel;
		  importer: aJinDAMDispatchingImporter;
		  yourself
]

{ #category : #'sdk functions math' }
JinDAMSDKLibraryBuilder >> abs [
	^ self
		  functionNamed: #Abs
		  returns: self variant
		  parametersFromString: 'number required variant'
]

{ #category : #building }
JinDAMSDKLibraryBuilder >> aliasTypes [

	^ { 
		  self float.
		  self int32.
		  self int16.
		  self int.
		  self ubyte.
		  self winVariant.
		  self bstring.
		  self dispatchInstance.
		  self bool.
		  self userDefined.
		  self uint.
		  self uint32.
		  self uint16.
		  self currentDb.
		  self err.
		  self voidAlias.

		  self winWideString }
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> array [
	^ self
		  functionNamed: #Array
		  returns: self variant
		  parametersFromString: 'arglist Optional: Variant'
]

{ #category : #'sdk functions conversion' }
JinDAMSDKLibraryBuilder >> asc [
	^ self
		  functionNamed: #Asc
		  returns: self integer
		  parametersFromString: 'expr required string'
]

{ #category : #'sdk functions math' }
JinDAMSDKLibraryBuilder >> atn [
	^ self
		  functionNamed: #Atn
		  returns: self double
		  parametersFromString: 'number required variant'
]

{ #category : #alias }
JinDAMSDKLibraryBuilder >> bool [

	^ self newAlias: #BOOL to: self boolean
]

{ #category : #'primitive types' }
JinDAMSDKLibraryBuilder >> boolean [

	^ self primitiveTypeNamed: #Boolean
]

{ #category : #alias }
JinDAMSDKLibraryBuilder >> bstring [

	^ self newAlias: #BSTRString to: self string
]

{ #category : #building }
JinDAMSDKLibraryBuilder >> build [
	| library |

	library := self instantiate: JinDAMLibrary.
	library name:#'VBALang'.
	self primitiveTypes do: [ :t | library addType: t ].
	self aliasTypes do: [ :t | library addType: t ].
	self sdkClasses do: [ :t | library addType: t ].
	self globals do: [ :g | library addGlobal: g ].
"	self functionsOrSubs do: [ :f | library addInvocable: f ].
	self globals do: [ :g | g addGlobal: g ]."
	^ library 
]

{ #category : #'primitive types' }
JinDAMSDKLibraryBuilder >> byte [
	^ self primitiveTypeNamed: #Byte
		
	
]

{ #category : #'sdk functions conversion' }
JinDAMSDKLibraryBuilder >> cVErr [
	^ self
		  functionNamed: #CVErr
		  returns: self variant
		  parametersFromString: 'errornumber required integer'
]

{ #category : #'enum constants' }
JinDAMSDKLibraryBuilder >> calendar [

	^ self
		  enumNamed: #calendar
		  definedWith:
'vbCalGreg 	0 	Indicates that the Gregorian calendar is used.
vbCalHijri 	1 	Indicates that the Hijri calendar is used.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> callByName [
	^ self
		  functionNamed: #CallByName
		  returns: self variant
		  parametersFromString: 'object 	Required: Variant (Object). The name of the object on which the function will be executed.
procname 	Required: Variant (String). A string expression containing the name of a property or method of the object.
calltype 	Required: callType . A constant of type vbCallType representing the type of procedure being called.
args() 	Optional: Variant (Array).'
]

{ #category : #'enum constants' }
JinDAMSDKLibraryBuilder >> callType [
		^ self
		  enumNamed: #callType
		  definedWith:'vbMethod 	1 	Indicates that a method has been invoked.
vbGet 	2 	Indicates a Property Get procedure.
vbLet 	4 	Indicates a Property Let procedure.
vbSet 	8 	Indicates a Property Set procedure.' 	

]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> choose [
	^ self
		  functionNamed: #Choose
		  returns: self variant
		  parametersFromString: 'index 	Required. Numeric expression or field that results in a value between 1 and the number of available choices.
choice 	Required. Variant expression containing one of the possible choices.'
]

{ #category : #'sdk functions conversion' }
JinDAMSDKLibraryBuilder >> chr [
	^ self
		  functionNamed: #Chr
		  returns: self string
		  parametersFromString: 'expr required long'

]

{ #category : #'sdk functions conversion' }
JinDAMSDKLibraryBuilder >> chrB [
	^ self
		  functionNamed: #ChrB
		  returns: self string
		  parametersFromString: 'expr required long'

]

{ #category : #'sdk functions conversion' }
JinDAMSDKLibraryBuilder >> chrW [
	^ self
		  functionNamed: #ChrW
		  returns: self string
		  parametersFromString: 'expr required long'

]

{ #category : #'enum constants' }
JinDAMSDKLibraryBuilder >> color [
		^ self
		  enumNamed: #color
		  definedWith:'vbBlack 	0x0 	Black
vbRed 	0xFF 	Red
vbGreen 	0xFF00 	Green
vbYellow 	0xFFFF 	Yellow
vbBlue 	0xFF0000 	Blue
vbMagenta 	0xFF00FF 	Magenta
vbCyan 	0xFFFF00 	Cyan
vbWhite 	0xFFFFFF 	White' 	

]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> command [
	^ self
		  functionNamed: #Command
		  returns: self string
		  parametersFromString: ''
]

{ #category : #'enum constants' }
JinDAMSDKLibraryBuilder >> comparison [
		^ self
		  enumNamed: #comparison
		  definedWith:'vbUseCompareOption 	-1 	Performs a comparison by using the setting of the Option Compare statement.
vbBinaryCompare 	0 	Performs a binary comparison.
vbTextCompare 	1 	Performs a textual comparison.
vbDatabaseCompare 	2 	For Microsoft Access (Windows only), performs a comparison based on information contained in your database.' 	

]

{ #category : #'sdk functions math' }
JinDAMSDKLibraryBuilder >> cos [
	^ self
		  functionNamed: #Cos
		  returns: self double
		  parametersFromString: 'number required variant'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> createObject [
	^ self
		  functionNamed: #CreateObject
		  returns: self variant
		  parametersFromString: 'class 	Required; String  The application name and class of the object to create.
servername 	Optional; String The name of the network server where the object will be created. If servername is an empty string (""), the local machine is used.
'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> curDir [
	^ self
		  functionNamed: #CurDir
		  returns: self string
		  parametersFromString: 'drive optional string'
]

{ #category : #'primitive types' }
JinDAMSDKLibraryBuilder >> currency [
	^ self primitiveTypeNamed: #Currency
		
	
]

{ #category : #alias }
JinDAMSDKLibraryBuilder >> currentDb [

	^ self newAlias: #CurrentDB toName: self database.
]

{ #category : #alias }
JinDAMSDKLibraryBuilder >> database [

	^ #'Database'
]

{ #category : #'primitive types' }
JinDAMSDKLibraryBuilder >> date [
	^ self primitiveTypeNamed: #Date
		
	
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> dateAdd [
	^ self
		  functionNamed: #DateAdd
		  returns: self variant
		  parametersFromString: 'interval 	Required. String expression that is the interval of time you want to add.
number 	Required. Numeric expression that is the number of intervals you want to add. It can be positive (to get dates in the future) or negative (to get dates in the past).
date 	Required. Date (Date) or literal representing the date to which the interval is added.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> dateDiff [
	^ self
		  functionNamed: #DateDiff
		  returns: self variant
		  parametersFromString: 
'interval 	Required String expression that is the interval of time you use to calculate the difference between date1 and date2.
date1 	Required Date (Date). Two dates you want to use in the calculation.
date2 	Required Date (Date). Two dates you want to use in the calculation.
firstdayofweek 	Optional. dateEnum A constant that specifies the first day of the week. If not specified, Sunday is assumed.
firstweekofyear 	Optional. dateEnum A constant that specifies the first week of the year. If not specified, the first week is assumed to be the week in which January 1 occurs.'
]

{ #category : #'enum constants' }
JinDAMSDKLibraryBuilder >> dateEnum [
		^ self
		  enumNamed: #date
		  definedWith:
'vbUseSystem 	0 	Use NLS API setting.
vbSunday 	1 	Sunday (default)
vbMonday 	2 	Monday
vbTuesday 	3 	Tuesday
vbWednesday 	4 	Wednesday
vbThursday 	5 	Thursday
vbFriday 	6 	Friday
vbSaturday 	7 	Saturday
VbUseSystemDayOfWeek 	0 	Use the day of the week specified in your system settings for the first day of the week.
VbFirstJan1 	1 	Start with week in which January 1 occurs (default).
vbFirstFourDays 	2 	Start with the first week that has at least four days in the new year.
vbFirstFullWeek 	3 	Start with the first full week of the year.' 	

]

{ #category : #'enum constants' }
JinDAMSDKLibraryBuilder >> dateFormat [
		^ self
		  enumNamed: #dateFormat
		  definedWith:
'vbGeneralDate 	0 	Display a date and/or time. For real numbers, display a date and time. If there is no fractional part, display only a date. If there is no integer part, display time only. Date and time display is determined by your system settings.
vbLongDate 	1 	Display a date by using the long date format specified in your computers regional settings.
vbShortDate 	2 	Display a date by using the short date format specified in your computers regional settings.
vbLongTime 	3 	Display a time by using the long time format specified in your computers regional settings.
vbShortTime 	4 	Display a time by using the short time format specified in your computers regional settings.' 	

]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> dateFunction [
	^ self
		  functionNamed: #Date
		  returns: self variant
		  parametersFromString: ''
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> datePart [
	^ self
		  functionNamed: #DatePart
		  returns: self variant
		  parametersFromString: 'interval 	Required. String expression that is the interval of time you want to return.
date 	Required. Date (Date) value that you want to evaluate.
firstdayofweek 	Optional dateEnum  A constant that specifies the first day of the week. If not specified, Sunday is assumed.
firstweekofyear 	Optional dateEnum A constant that specifies the first week of the year. If not specified, the first week is assumed to be the week in which January 1 occurs.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> dateSerial [
	^ self
		  functionNamed: #DateSerial
		  returns: self date
		  parametersFromString: 'year 	Required; Integer. Number between 100 and 9999, inclusive, or a numeric expression.
month 	Required; Integer. Any numeric expression.
day 	Required; Integer. Any numeric expression.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> dateValue [
	^ self
		  functionNamed: #DateValue
		  returns: self date
		  parametersFromString: 'stringDate required string'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> day [
	^ self
		  functionNamed: #Day
		  returns: self integer
		  parametersFromString: 'inputDate required variant'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> ddb [
	^ self
		  functionNamed: #DDB
		  returns: self double
		  parametersFromString: 'cost 	Required. Double specifying the initial cost of the asset.
salvage 	Required. Double specifying the value of the asset at the end of its useful life.
life 	Required. Double specifying the length of useful life of the asset.
period 	Required. Double specifying the period for which asset depreciation is calculated.
factor 	Optional. Variant specifying the rate at which the balance declines. If omitted, 2 (double-declining method) is assumed.'
]

{ #category : #'sdk classes' }
JinDAMSDKLibraryBuilder >> debugClass [

	| class assert print |
	class := self sdkClassNamed: #Debug.
	assert := self
		          subProcedureNamed: #Assert
		          parametersFromString:
			          'object 	Required. Always the Debug object.
boolean 	Required. An expression that evaluates to either True or False.'.
	print := self
		         subProcedureNamed: #Print
		         parametersFromString:
			         'object 	Optional. An object expression that evaluates to an object in the Applies To list.
outputlist 	Optional. Expression or list of expressions to print. If omitted, a blank line is printed.
'.
	class addInvocable: assert.
	class addInvocable: print.
	^ class
]

{ #category : #'primitive types' }
JinDAMSDKLibraryBuilder >> decimal [
	^ self primitiveTypeNamed: #Decimal
		
	
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> dir [
	^ self
		  functionNamed: #Dir
		  returns: self string
		  parametersFromString: 'pathname 	Optional. String expression that specifies a file name; may include directory or folder, and drive. A zero-length string ("") is returned if pathname is not found.
attributes 	Optional. Constant or numeric expression, whose sum specifies file attributes. If omitted, returns files that match pathname but have no attributes.'
]

{ #category : #'enum constants' }
JinDAMSDKLibraryBuilder >> dirGetAttrSetAttrPermissions [
		^ self
		  enumNamed: #dirGetAttrSetAttrPermissions
		  definedWith:'vbNormal 	0 	Normal (default for Dir and SetAttr)
vbReadOnly 	1 	Read-only
vbHidden 	2 	Hidden
vbSystem 	4 	System file
vbVolume 	8 	Volume label
vbDirectory 	16 	Directory or folder
vbArchive 	32 	File has changed since last backup
vbAlias 	64 	On the Macintosh, identifier is an alias' 	

]

{ #category : #alias }
JinDAMSDKLibraryBuilder >> dispatchInstance [

	^ self newAlias: #COMDispatchInterface to: self object
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> doEvents [
	^ self
		  functionNamed: #DoEvents
		  returns: self integer
		  parametersFromString: ''
]

{ #category : #'primitive types' }
JinDAMSDKLibraryBuilder >> double [
	^ self primitiveTypeNamed: #Double
		
	
]

{ #category : #'enum constants' }
JinDAMSDKLibraryBuilder >> driveType [
		^ self
		  enumNamed: #driveType
		  definedWith:'Unknown 	0 	Drive type can''t be determined.
Removable 	1 	Drive has removable media. This includes all floppy drives and many other varieties of storage devices.
Fixed 	2 	Drive has fixed (nonremovable) media. This includes all hard drives, including hard drives that are removable.
Remote 	3 	Network drives. This includes drives shared anywhere on a network.
CDROM 	4 	Drive is a CD-ROM. No distinction is made between read-only and read/write CD-ROM drives.
RAMDisk 	5 	Drive is a block of random access memory (RAM) on the local computer that behaves like a disk drive.' 	

]

{ #category : #building }
JinDAMSDKLibraryBuilder >> emptyObject [

	^ self newAttribute: #Empty typeName: 'NULL'
]

{ #category : #'enum constants' }
JinDAMSDKLibraryBuilder >> enumNamed: aName definedWith: aStringDefinition [

	| genname defLines enum stream value |
	genname := 'vb{1}' format: { aName capitalized }.

	^ created at: genname, 'EnumConstant' ifAbsent: [ 
		defLines := aStringDefinition lines collect: [ :l | 
			            l trimBoth copyReplaceAll: String tab with: '' ].
		enum := self instantiate: JinDAMEnum.
		enum name: genname. 
		defLines do: [ :l | 
			value := self instantiate: JinDAMEnumValue.
			value enum: enum.
			stream := l readStream.
			value name: (stream upToAll: ' ') trimBoth.
			value value: (stream upToAll: ' ') trimBoth ].
		enum ]
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> environ [
	^ self
		  functionNamed: #Environ
		  returns: self string
		  parametersFromString: 'envstring 	Optional. String expression containing the name of an environment variable.
number 	Optional. Numeric expression corresponding to the numeric order of the environment string in the environment-string table. The number argument can be any numeric expression, but is rounded to a whole number before it is evaluated.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> eof [
	^ self
		  functionNamed: #EOF
		  returns: self boolean
		  parametersFromString: 'filenumber required integer'
]

{ #category : #alias }
JinDAMSDKLibraryBuilder >> err [

	^ self newAlias: #Err toName: self errObject.
]

{ #category : #alias }
JinDAMSDKLibraryBuilder >> errObject [

	^ #'ErrObject'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> errorFunction [
	^ self
		  functionNamed: #Error
		  returns: self variant
		  parametersFromString: ''
]

{ #category : #'sdk functions math' }
JinDAMSDKLibraryBuilder >> exp [
	^ self
		  functionNamed: #Exp
		  returns: self double
		  parametersFromString: 'number required variant'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> fileAttr [
	^ self
		  functionNamed: #FileAttr
		  returns: self long
		  parametersFromString: 'filenumber 	Required; Integer. Any valid file number.
returntype 	Required; Integer. Number indicating the type of information to return. Specify 1 to return a value indicating the file mode. On 16-bit systems only, specify 2 to retrieve an operating system file handle. Returntype 2 is not supported in 32-bit systems and causes an error.'
]

{ #category : #'enum constants' }
JinDAMSDKLibraryBuilder >> fileAttribute [
		^ self
		  enumNamed: #fileAttribute
		  definedWith:'Normal 	0 	Normal file. No attributes are set.
ReadOnly 	1 	Read-only file. Attribute is read/write.
Hidden 	2 	Hidden file. Attribute is read/write.
System 	4 	System file. Attribute is read/write.
Volume 	8 	Disk drive volume label. Attribute is read-only.
Directory 	16 	Folder or directory. Attribute is read-only.
Archive 	32 	File has changed since last backup. Attribute is read/write.
Alias 	64 	Link or shortcut. Attribute is read-only.
Compressed 	128 	Compressed file. Attribute is read-only.' 	

]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> fileDateTime [
	^ self
		  functionNamed: #FileDateTime
		  returns: self date
		  parametersFromString: 'pathname required string'
]

{ #category : #'enum constants' }
JinDAMSDKLibraryBuilder >> fileInputOutput [
		^ self
		  enumNamed: #fileInputOutput
		  definedWith:'ForReading 	1 	Open a file for reading only. You can''t write to this file.
ForWriting 	2 	Open a file for writing. If a file with the same name exists, its previous contents are overwritten.
ForAppending 	8 	Open a file and write to the end of the file.' 	

]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> fileLen [
	^ self
		  functionNamed: #FileLen
		  returns: self long
		  parametersFromString: 'pathname required string'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> filter [
	^ self
		  functionNamed: #Filter
		  returns: self variant
		  parametersFromString: 'sourcearray 	Required. Variant One-dimensional array of strings to be searched.
match 	Required. String to search for.
include 	Optional. Boolean value indicating whether to return substrings that include or exclude match. If include is True, Filter returns the subset of the array that contains match as a substring. If include is False, Filter returns the subset of the array that does not contain match as a substring.
compare 	Optional. comparison  value indicating the kind of string comparison to use. See Settings section for values.'
]

{ #category : #'sdk functions math' }
JinDAMSDKLibraryBuilder >> fix [
	^ self
		  functionNamed: #Fix
		  returns: self variant
		  parametersFromString: 'number required double'
]

{ #category : #alias }
JinDAMSDKLibraryBuilder >> float [

	^ self newAlias: #float to: self double
]

{ #category : #'enum constants' }
JinDAMSDKLibraryBuilder >> form [
		^ self
		  enumNamed: #form
		  definedWith:'vbModeless 	0 	UserForm is modeless.
vbModal 	1 	UserForm is modal (default).' 	

]

{ #category : #'sdk functions conversion' }
JinDAMSDKLibraryBuilder >> format [
	^ self
		  functionNamed: #Format
		  returns: self string
		  parametersFromString: 'Expression 	Required. String Variant Any valid expression.
Format 	Optional. A valid named or user-defined format expression.
FirstDayOfWeek 	Optional. DateEnum  A constant that specifies the first day of the week.
FirstWeekOfYear 	Optional. DateEnum A constant that specifies the first week of the year.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> formatCurrency [
	^ self
		  functionNamed: #FormatCurrency
		  returns: self currency
		  parametersFromString: 'Expression 	Required. variant Expression to be formatted.
NumDigitsAfterDecimal 	Optional. Integer value indicating how many places to the right of the decimal are displayed. Default value is -1, which indicates that the computer''s regional settings are used.
IncludeLeadingDigit 	Optional. Tristate constant that indicates whether or not a leading zero is displayed for fractional values. See Settings section for values.
UseParensForNegativeNumbers 	Optional. Tristate constant that indicates whether or not to place negative values within parentheses. See Settings section for values.
GroupDigits 	Optional. Tristate constant that indicates whether or not numbers are grouped by using the group delimiter specified in the computer''s regional settings. See Settings section for values.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> formatDateTime [
	^ self
		  functionNamed: #FormatDateTime
		  returns: self variant
		  parametersFromString: 'Date 	Required. variant Date expression to be formatted.
NamedFormat 	Optional. DateFormat value that indicates the date/time format used. If omitted, vbGeneralDate is used.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> formatNumber [
	^ self
		  functionNamed: #FormatNumber
		  returns: self variant
		  parametersFromString: 'Expression 	Required. Variant Expression to be formatted.
NumDigitsAfterDecimal 	Optional. Integer Numeric value indicating how many places to the right of the decimal are displayed. Default value is -1, which indicates that the computer''s regional settings are used.
IncludeLeadingDigit 	Optional. Tristate constant that indicates whether or not a leading zero is displayed for fractional values. See Settings section for values.
UseParensForNegativeNumbers 	Optional. Tristate constant that indicates whether or not to place negative values within parentheses. See Settings section for values.
GroupDigits 	Optional. Tristate constant that indicates whether or not numbers are grouped by using the group delimiter specified in the computer''s regional settings. See Settings section for values.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> formatPercent [
	^ self
		  functionNamed: #FormatPercent
		  returns: self variant
		  parametersFromString: 'Expression 	Required. Variant Expression to be formatted.
NumDigitsAfterDecimal 	Optional. Integer Numeric value indicating how many places to the right of the decimal are displayed. Default value is -1, which indicates that the computer''s regional settings are used.
IncludeLeadingDigit 	Optional. Tristate constant that indicates whether or not a leading zero is displayed for fractional values. See Settings section for values.
UseParensForNegativeNumbers 	Optional. Tristate constant that indicates whether or not to place negative values within parentheses. See Settings section for values.
GroupDigits 	Optional. Tristate constant that indicates whether or not numbers are grouped by using the group delimiter specified in the computer''s regional settings. See Settings section for values.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> freeFile [
	^ self
		  functionNamed: #FreeFile
		  returns: self integer
		  parametersFromString: 'rangenumber optional integer'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> functionNamed: aName returns: aType parametersFromString: aStringDefinition [
	| func param defLines stream type |
	^ created
		at: aName , 'function'
		ifAbsentPut: [ func := self instantiate: JinDAMFunction.
			func type: aType.
			func typeName:( self typeNameReference: aType name).
			func selector: aName.
			defLines := aStringDefinition lines
				collect:
					[ :l | l trimBoth copyReplaceAll: String tab with: '' ].
			defLines
				do: [ :l | 
					|typeName | 
					param := self instantiate: JinDAMParameter.
					func addParameter: param.
					stream := l readStream.
					param name: (stream upToAll: ' ') trimBoth.
					param
						isOptional: (self isOptionalOrNot: (stream upToAll: ' ') trimBoth).
					typeName := (stream upToAll: ' ') trimBoth.
					type := self typeNamed: typeName.
					param type: type.
					param typeName:( self typeNameReference: typeName). ].
			func ]
]

{ #category : #building }
JinDAMSDKLibraryBuilder >> functionsOrSubs [

	^ self typeConversionSdkFunctions , self mathSdkFunctions
	  , self sdkFunctions , self sdkStatements
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> fv [
	^ self
		  functionNamed: #FV
		  returns: self double
		  parametersFromString: 'rate 	Required. Double specifying interest rate per period. For example, if you get a car loan at an annual percentage rate (APR) of 10 percent and make monthly payments, the rate per period is 0.1/12, or 0.0083.
nper 	Required. Integer specifying total number of payment periods in the annuity. For example, if you make monthly payments on a four-year car loan, your loan has a total of 4 * 12 (or 48) payment periods.
pmt 	Required. Double specifying payment to be made each period. Payments usually contain principal and interest that doesn''t change over the life of the annuity.
pv 	Optional. Variant specifying present value (or lump sum) of a series of future payments. For example, when you borrow money to buy a car, the loan amount is the present value to the lender of the monthly car payments you will make. If omitted, 0 is assumed.
type 	Optional. Variant specifying when payments are due. Use 0 if payments are due at the end of the payment period, or use 1 if payments are due at the beginning of the period. If omitted, 0 is assumed.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> getAllSettings [
	^ self
		  functionNamed: #GetAllSettings
		  returns: self variant
		  parametersFromString: 'appname 	Required. String expression containing the name of the application or project whose key settings are requested. On the Macintosh, this is the filename of the initialization file in the Preferences folder in the System folder.
section 	Required. String expression containing the name of the section whose key settings are requested. GetAllSettings returns a Variant whose contents is a two-dimensional array of strings containing all the key settings in the specified section and their corresponding values.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> getAttr [
	^ self
		  functionNamed: #GetAttr
		  returns: self dirGetAttrSetAttrPermissions
		  parametersFromString: 'pathname required string'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> getObject [
	^ self
		  functionNamed: #GetObject
		  returns: self variant
		  parametersFromString: 'pathname 	Optional; Variant (String). The full path and name of the file containing the object to retrieve. If pathname is omitted, class is required.
class 	Optional; Variant (String). A string representing the class of the object.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> getSetting [
	^ self
		  functionNamed: #GetSetting
		  returns: self variant
		  parametersFromString: 'appname 	Required. String expression containing the name of the application or project whose key setting is requested. On the Macintosh, this is the filename of the initialization file in the Preferences folder in the System folder.
section 	Required. String expression containing the name of the section where the key setting is found.
key 	Required. String expression containing the name of the key setting to return.
default 	Optional. Expression containing the value to return if no value is set in the key setting. If omitted, default is assumed to be a zero-length string ("").'
]

{ #category : #building }
JinDAMSDKLibraryBuilder >> globals [
	"Yet to define"
	^ { 
		
		  self nullObject.
		  self nothingObject.
		  self emptyObject.
	"	 self errObject.
		  self errorObject "
	}
]

{ #category : #'sdk functions conversion' }
JinDAMSDKLibraryBuilder >> hex [
	^ self
		  functionNamed: #Hex
		  returns: self string
		  parametersFromString: 'num required longLong'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> hour [
	^ self
		  functionNamed: #Hour
		  returns: self integer
		  parametersFromString: 'time required variant'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> iIf [
	^ self
		  functionNamed: #IIf
		  returns: self variant
		  parametersFromString: 'expr 	Required. Boolean Expression that you want to evaluate.
truepart 	Required. Variant Value or expression returned if expr is True.
falsepart 	Required. Variant Value or expression returned if expr is False.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> iMEStatus [
	^ self
		  functionNamed: #IMEStatus
		  returns: self imeStatus
		  parametersFromString: ''
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> iPmt [
	^ self
		  functionNamed: #IPmt
		  returns: self double
		  parametersFromString: 'rate 	Required. Double specifying interest rate per period. For example, if you get a car loan at an annual percentage rate (APR) of 10 percent and make monthly payments, the rate per period is 0.1/12, or 0.0083.
per 	Required. Double specifying payment period in the range 1 through nper.
nper 	Required. Double specifying total number of payment periods in the annuity. For example, if you make monthly payments on a four-year car loan, your loan has a total of 4 * 12 (or 48) payment periods.
pv 	Required. Double specifying present value, or value today, of a series of future payments or receipts. For example, when you borrow money to buy a car, the loan amount is the present value to the lender of the monthly car payments you will make.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> iRR [
	^ self
		  functionNamed: #IRR
		  returns: self double
		  parametersFromString: 'values() 	Required. Variant Array of Double specifying cash flow values. The array must contain at least one negative value (a payment) and one positive value (a receipt).
guess 	Optional. Variant specifying value that you estimate will be returned by IRR. If omitted, guess is 0.1 (10 percent).'
]

{ #category : #'enum constants' }
JinDAMSDKLibraryBuilder >> imeStatus [
		^ self
		  enumNamed: #imeStatus
		  definedWith:'vbIMEModeNoControl 	0 	Don''t control IME (default)
vbIMEModeOn 	1 	IME on
vbIMEModeOff 	2 	IME off
vbIMEModeDisable 	3 	IME disabled
vbIMEModeHiragana 	4 	Full-width Hiragana mode
vbIMEModeKatakana 	5 	Full-width Katakana mode
vbIMEModeKatakanaHalf 	6 	Half-width Katakana mode
vbIMEModeAlphaFull 	7 	Full-width Alphanumeric mode
vbIMEModeAlpha 	8 	Half-width Alphanumeric mode
vbIMEModeHangulFull 	9 	Full-width Hangul mode
vbIMEModeHangul 	10 	Half-width Hangul mode' 	

]

{ #category : #accessing }
JinDAMSDKLibraryBuilder >> importer: aJinDAMDispatchingImporter [

	importer := aJinDAMDispatchingImporter
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> inStr [
	^ self
		  functionNamed: #InStr
		  returns: self long
		  parametersFromString: 'start 	Optional. Numeric expression that sets the starting position for each search. If omitted, search begins at the first character position. If start contains Null, an error occurs. The start argument is required if compare is specified.
string1 	Required. String expression being searched.
string2 	Required. String expression sought.
compare 	Optional. Comparison Specifies the type of string comparison. If compare is Null, an error occurs. If compare is omitted, the Option Compare setting determines the type of comparison. Specify a valid LCID (LocaleID) to use locale-specific rules in the comparison.
'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> inStrRev [
	^ self
		  functionNamed: #InStrRev
		  returns: self long
		  parametersFromString: 'stringcheck 	Required. String expression being searched.
stringmatch 	Required. String expression being searched for.
start 	Optional. Numeric expression that sets the starting position for each search. If omitted, -1 is used, which means that the search begins at the last character position. If start contains Null, an error occurs.
compare 	Optional. Comparison Numeric value indicating the kind of comparison to use when evaluating substrings. If omitted, a binary comparison is performed. See the Settings section for values.'
]

{ #category : #building }
JinDAMSDKLibraryBuilder >> initialize [ 
	super initialize. 
	created := Dictionary new. 
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> input [
	^ self
		  functionNamed: #Input
		  returns: self string
		  parametersFromString: 'number 	Required. Any valid numeric expression specifying the number of characters to return.
filenumber 	Required. Any valid file number.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> inputBox [
	^ self
		  functionNamed: #InputBox
		  returns: self string
		  parametersFromString: 'prompt 	Required. String expression displayed as the message in the dialog box. The maximum length of prompt is approximately 1024 characters, depending on the width of the characters used. If prompt consists of more than one line, you can separate the lines by using a carriage return character (Chr(13)), a linefeed character (Chr(10)), or carriage return-linefeed character combination ((Chr(13) & (Chr(10)) between each line.
title 	Optional. String expression displayed in the title bar of the dialog box. If you omit title, the application name is placed in the title bar.
default 	Optional. String expression displayed in the text box as the default response if no other input is provided. If you omit default, the text box is displayed empty.
xpos 	Optional. Numeric expression that specifies, in twips, the horizontal distance of the left edge of the dialog box from the left edge of the screen. If xpos is omitted, the dialog box is horizontally centered.
ypos 	Optional. Numeric expression that specifies, in twips, the vertical distance of the upper edge of the dialog box from the top of the screen. If ypos is omitted, the dialog box is vertically positioned approximately one-third of the way down the screen.
helpfile 	Optional. String expression that identifies the Help file to use to provide context-sensitive Help for the dialog box. If helpfile is provided, context must also be provided.
context 	Optional. Numeric expression that is the Help context number assigned to the appropriate Help topic by the Help author. If context is provided, helpfile must also be provided.'
]

{ #category : #building }
JinDAMSDKLibraryBuilder >> instantiate: aClass [
 	^ model instantiate: aClass
]

{ #category : #alias }
JinDAMSDKLibraryBuilder >> int [

	^ self newAlias: #int to: self integer
]

{ #category : #alias }
JinDAMSDKLibraryBuilder >> int16 [

	^ self newAlias: #int16 to: self integer
]

{ #category : #alias }
JinDAMSDKLibraryBuilder >> int32 [

	^ self newAlias: #int32 to: self integer
]

{ #category : #'primitive types' }
JinDAMSDKLibraryBuilder >> integer [
	^ self primitiveTypeNamed: #Integer
		
	
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> isArrayFunction [
	^ self
		  functionNamed: #IsArray
		  returns: self boolean
		  parametersFromString: 'varname required variant'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> isDate [
	^ self
		  functionNamed: #IsDate
		  returns: self boolean
		  parametersFromString: 'expr required variant'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> isEmpty [
	^ self
		  functionNamed: #IsEmpty
		  returns: self boolean
		  parametersFromString: 'expr required variant'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> isErrorFunction [
	^ self
		  functionNamed: #IsError
		  returns: self boolean 
		  parametersFromString: 'expr required variant'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> isMissing [
	^ self
		  functionNamed: #IsMissing
		  returns: self boolean
		  parametersFromString: 'expr required variant'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> isNull [
	^ self
		  functionNamed: #IsNull
		  returns: self boolean
		  parametersFromString: 'expr required variant'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> isNumeric [
	^ self
		  functionNamed: #IsNumeric
		  returns: self boolean
		  parametersFromString: 'expr required variant'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> isObject [
	^ self
		  functionNamed: #IsObject
		  returns: self boolean
		  parametersFromString: 'expr required variant'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> isOptionalOrNot: aString [

	(aString asLowercase beginsWith: 'required') ifTrue: [ ^ false ].
	(aString asLowercase beginsWith: 'optional') ifTrue: [ ^ true ].
	self error: 'Unexpected token'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> join [
	^ self
		  functionNamed: #Join
		  returns: self string
		  parametersFromString: 'sourcearray 	Required. Variant One-dimensional array containing substrings to be joined.
delimiter 	Optional. String character used to separate the substrings in the returned string. If omitted, the space character (" ") is used. If delimiter is a zero-length string (""), all items in the list are concatenated with no delimiters.'
]

{ #category : #'enum constants' }
JinDAMSDKLibraryBuilder >> keyCode [
		^ self
		  enumNamed: #keyCode
		  definedWith:'vbKeyLButton 	0x1 	Left mouse button
vbKeyRButton 	0x2 	Right mouse button
vbKeyCancel 	0x3 	CANCEL key
vbKeyMButton 	0x4 	Middle mouse button
vbKeyBack 	0x8 	BACKSPACE key
vbKeyTab 	0x9 	TAB key
vbKeyClear 	0xC 	CLEAR key
vbKeyReturn 	0xD 	ENTER key
vbKeyShift 	0x10 	SHIFT key
vbKeyControl 	0x11 	CTRL key
vbKeyMenu 	0x12 	MENU key
vbKeyPause 	0x13 	PAUSE key
vbKeyCapital 	0x14 	CAPS LOCK key
vbKeyEscape 	0x1B 	ESC key
vbKeySpace 	0x20 	SPACEBAR key
vbKeyPageUp 	0x21 	PAGE UP key
vbKeyPageDown 	0x22 	PAGE DOWN key
vbKeyEnd 	0x23 	END key
vbKeyHome 	0x24 	HOME key
vbKeyLeft 	0x25 	LEFT ARROW key
vbKeyUp 	0x26 	UP ARROW key
vbKeyRight 	0x27 	RIGHT ARROW key
vbKeyDown 	0x28 	DOWN ARROW key
vbKeySelect 	0x29 	SELECT key
vbKeyPrint 	0x2A 	PRINT SCREEN key
vbKeyExecute 	0x2B 	EXECUTE key
vbKeySnapshot 	0x2C 	SNAPSHOT key
vbKeyInsert 	0x2D 	INSERT key
vbKeyDelete 	0x2E 	DELETE key
vbKeyHelp 	0x2F 	HELP key
vbKeyNumlock 	0x90 	NUM LOCK key
vbKeyA 	65 	A key
vbKeyB 	66 	B key
vbKeyC 	67 	C key
vbKeyD 	68 	D key
vbKeyE 	69 	E key
vbKeyF 	70 	F key
vbKeyG 	71 	G key
vbKeyH 	72 	H key
vbKeyI 	73 	I key
vbKeyJ 	74 	J key
vbKeyK 	75 	K key
vbKeyL 	76 	L key
vbKeyM 	77 	M key
vbKeyN 	78 	N key
vbKeyO 	79 	O key
vbKeyP 	80 	P key
vbKeyQ 	81 	Q key
vbKeyR 	82 	R key
vbKeyS 	83 	S key
vbKeyT 	84 	T key
vbKeyU 	85 	U key
vbKeyV 	86 	V key
vbKeyW 	87 	W key
vbKeyX 	88 	X key
vbKeyY 	89 	Y key
vbKeyZ 	90 	Z key
vbKey0 	48 	0 key
vbKey1 	49 	1 key
vbKey2 	50 	2 key
vbKey3 	51 	3 key
vbKey4 	52 	4 key
vbKey5 	53 	5 key
vbKey6 	54 	6 key
vbKey7 	55 	7 key
vbKey8 	56 	8 key
vbKey9 	57 	9 key
vbKeyNumpad0 	0x60 	0 key
vbKeyNumpad1 	0x61 	1 key
vbKeyNumpad2 	0x62 	2 key
vbKeyNumpad3 	0x63 	3 key
vbKeyNumpad4 	0x64 	4 key
vbKeyNumpad5 	0x65 	5 key
vbKeyNumpad6 	0x66 	6 key
vbKeyNumpad7 	0x67 	7 key
vbKeyNumpad8 	0x68 	8 key
vbKeyNumpad9 	0x69 	9 key
vbKeyMultiply 	0x6A 	MULTIPLICATION SIGN (*) key
vbKeyAdd 	0x6B 	PLUS SIGN (+) key
vbKeySeparator 	0x6C 	ENTER key
vbKeySubtract 	0x6D 	MINUS SIGN (-) key
vbKeyDecimal 	0x6E 	DECIMAL POINT (.) key
vbKeyDivide 	0x6F 	DIVISION SIGN (/) key
vbKeyF1 	0x70 	F1 key
vbKeyF2 	0x71 	F2 key
vbKeyF3 	0x72 	F3 key
vbKeyF4 	0x73 	F4 key
vbKeyF5 	0x74 	F5 key
vbKeyF6 	0x75 	F6 key
vbKeyF7 	0x76 	F7 key
vbKeyF8 	0x77 	F8 key
vbKeyF9 	0x78 	F9 key
vbKeyF10 	0x79 	F10 key
vbKeyF11 	0x7A 	F11 key
vbKeyF12 	0x7B 	F12 key
vbKeyF13 	0x7C 	F13 key
vbKeyF14 	0x7D 	F14 key
vbKeyF15 	0x7E 	F15 key
vbKeyF16 	0x7F 	F16 key' 

]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> lBound [
	^ self
		  functionNamed: #LBound
		  returns: self long
		  parametersFromString: 'arrayname 	Required. Variant Name of the array variable; follows standard variable naming conventions.
dimension 	Optional; Variant (Long). Whole number indicating which dimension''s lower bound is returned. Use 1 for the first dimension, 2 for the second, and so on. If dimension is omitted, 1 is assumed.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> lCase [
	^ self
		  functionNamed: #LCase
		  returns: self string
		  parametersFromString: 'expr required string'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> lOF [
	^ self
		  functionNamed: #LOF
		  returns: self long
		  parametersFromString: 'fileno required integer'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> lTrim [
	^ self
		  functionNamed: #LTrim
		  returns: self string
		  parametersFromString: 'expr required string'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> left [
	^ self
		  functionNamed: #Left
		  returns: self string
		  parametersFromString: 'string 	Required. String expression from which the leftmost characters are returned. If string contains Null, Null is returned.
length 	Required; Long Variant (Long). Numeric expression indicating how many characters to return. If 0, a zero-length string ("") is returned. If greater than or equal to the number of characters in string, the entire string is returned.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> len [
	^ self
		  functionNamed: #Len
		  returns: self long
		  parametersFromString: 'expr required string'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> loc [
	^ self
		  functionNamed: #Loc
		  returns: self long
		  parametersFromString: 'fileno required integer'
]

{ #category : #'sdk functions math' }
JinDAMSDKLibraryBuilder >> log [
	^ self
		  functionNamed: #Log
		  returns: self double
		  parametersFromString: 'number required variant'
]

{ #category : #'primitive types' }
JinDAMSDKLibraryBuilder >> long [
	^ self primitiveTypeNamed: #Long
		
	
]

{ #category : #'primitive types' }
JinDAMSDKLibraryBuilder >> longLong [

	^ self primitiveTypeNamed: #LongLong
]

{ #category : #'primitive types' }
JinDAMSDKLibraryBuilder >> longPtr [
	^ self primitiveTypeNamed: #LongPtr
		
	
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> mIRR [
	^ self
		  functionNamed: #MIRR
		  returns: self double
		  parametersFromString: 'values() 	Required. Variant Array of Double specifying cash flow values. The array must contain at least one negative value (a payment) and one positive value (a receipt).
finance_rate 	Required. Double specifying interest rate paid as the cost of financing.
reinvest_rate 	Required. Double specifying interest rate received on gains from cash reinvestment.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> macID [
	^ self
		  functionNamed: #MacID
		  returns: self variant
		  parametersFromString: 'expr required string'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> macScript [
	^ self
		  functionNamed: #MacScript
		  returns: self variant
		  parametersFromString: 'expr required string'
]

{ #category : #'sdk functions math' }
JinDAMSDKLibraryBuilder >> mathSdkFunctions [

	^ { 
		  self abs.
		  self atn.
		  self cos.
		  self exp.
		  self int.
		  self fix.
		  self log.
		  self rnd.
		  self sgn.
		  self sin.
		  self sqr.
		  self tan }
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> mid [
	^ self
		  functionNamed: #Mid
		  returns: self string
		  parametersFromString: 'string 	Required. String expression from which characters are returned. If string contains Null, Null is returned.
start 	Required; Long. Character position in string at which the part to be taken begins. If start is greater than the number of characters in string, Mid returns a zero-length string ("").
length 	Optional; Long (Variant). Number of characters to return. If omitted or if there are fewer than length characters in the text (including the character at start), all characters from the start position to the end of the string are returned.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> minute [
	^ self
		  functionNamed: #Minute
		  returns: self integer
		  parametersFromString: 'expr required variant'
]

{ #category : #'enum constants' }
JinDAMSDKLibraryBuilder >> miscellaneous [
		^ self
		  enumNamed: #miscellaneous
		  definedWith:'vbCrLf 	Chr(13) + Chr(10) 	Carriage return-linefeed combination
vbCr 	Chr(13) 	Carriage return character
vbLf 	Chr(10) 	Linefeed character
vbNewLine 	Chr(13) + Chr(10) or, on the Macintosh, Chr(13) 	Platform-specific new line character; whichever is appropriate for current platform
vbNullChar 	Chr(0) 	Character having value 0
vbNullString 	String having value 0 	Not the same as a zero-length string (""); used for calling external procedures
vbObjectError 	-2147221504 	User-defined error numbers should be greater than this value. For example:

Err.Raise Number = vbObjectError + 1000
vbTab 	Chr(9) 	Tab character
vbBack 	Chr(8) 	Backspace character
vbFormFeed 	Chr(12) 	Not useful in Microsoft Windows or on the Macintosh
vbVerticalTab 	Chr(11) 	Not useful in Microsoft Windows or on the Macintosh' 	

]

{ #category : #'as yet unclassified' }
JinDAMSDKLibraryBuilder >> model: anAlcixModel [ 
	model := anAlcixModel
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> month [
	^ self
		  functionNamed: #Month
		  returns: self integer
		  parametersFromString: 'expr required variant'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> monthName [
	^ self
		  functionNamed: #MonthName
		  returns: self string
		  parametersFromString: 'month 	Required. The numeric designation of the month. For example, January is 1, February is 2, and so on.
abbreviate 	Optional. Boolean value that indicates if the month name is to be abbreviated. If omitted, the default is False, which means that the month name is not abbreviated.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> msgBox [
	^ self
		  functionNamed: #MsgBox
		  returns: self msgBoxEnum
		  parametersFromString: 
'prompt 	Required. String expression displayed as the message in the dialog box. The maximum length of prompt is approximately 1024 characters, depending on the width of the characters used. If prompt consists of more than one line, you can separate the lines by using a carriage return character (Chr(13)), a linefeed character (Chr(10)), or carriage return - linefeed character combination (Chr(13) & Chr(10)) between each line.
buttons 	Optional. msgBoxEnum Numeric expression that is the sum of values specifying the number and type of buttons to display, the icon style to use, the identity of the default button, and the modality of the message box. If omitted, the default value for buttons is 0.
title 	Optional. String expression displayed in the title bar of the dialog box. If you omit title, the application name is placed in the title bar.
helpfile 	Optional. String expression that identifies the Help file to use to provide context-sensitive Help for the dialog box. If helpfile is provided, context must also be provided.
context 	Optional. Variant Numeric expression that is the Help context number assigned to the appropriate Help topic by the Help author. If context is provided, helpfile must also be provided.'
]

{ #category : #'enum constants' }
JinDAMSDKLibraryBuilder >> msgBoxEnum [
		^ self
		  enumNamed: #msgBox
		  definedWith:'vbOKOnly 	0 	OK button only (default)
vbOKCancel 	1 	OK and Cancel buttons
vbAbortRetryIgnore 	2 	Abort, Retry, and Ignore buttons
vbYesNoCancel 	3 	Yes, No, and Cancel buttons
vbYesNo 	4 	Yes and No buttons
vbRetryCancel 	5 	Retry and Cancel buttons
vbYes 	6 	Yes button pressed
vbNo 	7 	No button pressed
vbCritical 	16 	Critical message
vbQuestion 	32 	Warning query
vbExclamation 	48 	Warning message
vbInformation 	64 	Information message
vbDefaultButton1 	0 	First button is default (default)
vbDefaultButton2 	256 	Second button is default
vbDefaultButton3 	512 	Third button is default
vbDefaultButton4 	768 	Fourth button is default
vbApplicationModal 	0 	Application modal message box (default)
vbSystemModal 	4096 	System modal message box
vbMsgBoxHelpButton 	16384 	Adds Help button to the message box
VbMsgBoxSetForeground 	65536 	Specifies the message box window as the foreground window
vbMsgBoxRight 	524288 	Text is right aligned
vbMsgBoxRtlReading 	1048576 	Specifies text should appear as right-to-left reading on Hebrew and Arabic systems
' 	

]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> nPV [
	^ self
		  functionNamed: #NPV
		  returns: self double
		  parametersFromString: 'rate 	Required. Double specifying discount rate over the length of the period, expressed as a decimal.
values() 	Required. Variant Array of Double specifying cash flow values. The array must contain at least one negative value (a payment) and one positive value (a receipt).'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> nPer [
	^ self
		  functionNamed: #NPer
		  returns: self double
		  parametersFromString: 'rate 	Required. Double specifying interest rate per period. For example, if you get a car loan at an annual percentage rate (APR) of 10 percent and make monthly payments, the rate per period is 0.1/12, or 0.0083.
pmt 	Required. Double specifying payment to be made each period. Payments usually contain principal and interest that doesn''t change over the life of the annuity.
pv 	Required. Double specifying present value, or value today, of a series of future payments or receipts. For example, when you borrow money to buy a car, the loan amount is the present value to the lender of the monthly car payments you will make.'
]

{ #category : #alias }
JinDAMSDKLibraryBuilder >> newAlias: aName to: aType [

	^ created at: aName , 'Alias' ifAbsentPut: [ 
		  | t |
		  t := self instantiate: JinDAMAlias.
		  t name: aName.
		  t typeReference: (self typeReferenceName: aType name type: aType context: t).
		  t ]
]

{ #category : #alias }
JinDAMSDKLibraryBuilder >> newAlias: aName toName: anOtherName [

	^ created at: aName , 'Alias' ifAbsentPut: [ 
		  | t |
		  t := self instantiate: JinDAMAlias.
		  t name: aName.
		  t typeReference: (self
				   typeReferenceName: anOtherName
				   typeSymbol: (importer currentNamespace findSymbol: anOtherName)
				   context: t).
		  t ]
]

{ #category : #building }
JinDAMSDKLibraryBuilder >> newAttribute: aName typeName: aTypeName [

	^ created at: aName , 'Attr' ifAbsentPut: [ 
		  | t |
		  t := self instantiate: JinDAMAttribute.
		  t visibility: #Public.
		  t name: aName.

		  t typeReference: (self
				   typeReferenceName: aTypeName
				   typeSymbol: (importer currentNamespace findSymbol: aTypeName)
				   context: t).

		  t ]
]

{ #category : #building }
JinDAMSDKLibraryBuilder >> nothingObject [

	^ self newAttribute: #Nothing typeName: 'NULL'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> now [
	^ self
		  functionNamed: #Now
		  returns: self date
		  parametersFromString: ''
]

{ #category : #building }
JinDAMSDKLibraryBuilder >> nullObject [

	^ self newAttribute: #Null typeName: 'NULL'
]

{ #category : #'primitive types' }
JinDAMSDKLibraryBuilder >> object [
	^ self primitiveTypeNamed: #Object
		
	
]

{ #category : #'sdk functions conversion' }
JinDAMSDKLibraryBuilder >> oct [

	^ self
		  functionNamed: #Oct
		  returns: self string
		  parametersFromString: 'num required longLong'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> pPmt [
	^ self
		  functionNamed: #PPmt
		  returns: self double
		  parametersFromString: 'rate 	Required. Double specifying interest rate per period. For example, if you get a car loan at an annual percentage rate (APR) of 10 percent and make monthly payments, the rate per period is 0.1/12, or 0.0083.
per 	Required. Integer specifying payment period in the range 1 through nper.
nper 	Required. Integer specifying total number of payment periods in the annuity. For example, if you make monthly payments on a four-year car loan, your loan has a total of 4 * 12 (or 48) payment periods.
pv 	Required. Double specifying present value, or value today, of a series of future payments or receipts. For example, when you borrow money to buy a car, the loan amount is the present value to the lender of the monthly car payments you will make.
fv 	Optional. Variant specifying future value or cash balance you want after you''ve made the final payment. For example, the future value of a loan is $0 because that''s its value after the final payment. However, if you want to save $50,000 over 18 years for your child''s education, $50,000 is the future value. If omitted, 0 is assumed.
type 	Optional. Variant specifying when payments are due. Use 0 if payments are due at the end of the payment period, or use 1 if payments are due at the beginning of the period. If omitted, 0 is assumed.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> pV [
	^ self
		  functionNamed: #PV
		  returns: self double
		  parametersFromString: 'rate 	Required. Double specifying interest rate per period. For example, if you get a car loan at an annual percentage rate (APR) of 10 percent and make monthly payments, the rate per period is 0.1/12, or 0.0083.
nper 	Required. Integer specifying total number of payment periods in the annuity. For example, if you make monthly payments on a four-year car loan, your loan has a total of 4 * 12 (or 48) payment periods.
pmt 	Required. Double specifying payment to be made each period. Payments usually contain principal and interest that doesn''t change over the life of the annuity.
fv 	Optional. Variant specifying future value or cash balance you want after you''ve made the final payment. For example, the future value of a loan is $0 because that''s its value after the final payment. However, if you want to save $50,000 over 18 years for your child''s education, $50,000 is the future value. If omitted, 0 is assumed.
type 	Optional. Variant specifying when payments are due. Use 0 if payments are due at the end of the payment period, or use 1 if payments are due at the beginning of the period. If omitted, 0 is assumed.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> partition [
	^ self
		  functionNamed: #Partition
		  returns: self string
		  parametersFromString: 'number Required. The number that you want to evaluate against the ranges.
start 	Required. The number that is the start of the overall range of numbers. The number can''t be less than 0.
stop 	Required. The number that is the end of the overall range of numbers. The number can''t be equal to or less than start.
interval 	Required. The number that is the difference between one range and the next. The number can''t be less than 1.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> pmt [
	^ self
		  functionNamed: #Pmt
		  returns: self double
		  parametersFromString: 'rate 	Required. Double specifying interest rate per period. For example, if you get a car loan at an annual percentage rate (APR) of 10 percent and make monthly payments, the rate per period is 0.1/12, or 0.0083.
nper 	Required. Integer specifying total number of payment periods in the annuity. For example, if you make monthly payments on a four-year car loan, your loan has a total of 4 * 12 (or 48) payment periods.
pv 	Required. Double specifying present value (or lump sum) that a series of payments to be paid in the future is worth now. For example, when you borrow money to buy a car, the loan amount is the present value to the lender of the monthly car payments you will make.
fv 	Optional. Variant specifying future value or cash balance you want after you''ve made the final payment. For example, the future value of a loan is $0 because that''s its value after the final payment. However, if you want to save $50,000 over 18 years for your child''s education, $50,000 is the future value. If omitted, 0 is assumed.
type 	Optional. Variant specifying when payments are due. Use 0 if payments are due at the end of the payment period, or use 1 if payments are due at the beginning of the period. If omitted, 0 is assumed.'
]

{ #category : #'primitive types' }
JinDAMSDKLibraryBuilder >> primitiveTypeNamed: aName [
	^ created at: aName, 'primitiveType' ifAbsentPut: [ 
		  | t |
		  t := self instantiate: JinDAMPrimitiveType.
		  t name: aName.
		  t ]
]

{ #category : #building }
JinDAMSDKLibraryBuilder >> primitiveTypes [

	^ { 
		self boolean.
		self byte.
		self currency.
		self date.
		self decimal.
		self double.
		self integer.
		self long.
		self longPtr.
		self longLong.
		self object. 
		self single.
		self string.
		self variant .
		self void 
	}
]

{ #category : #'enum constants' }
JinDAMSDKLibraryBuilder >> primitiveTypesEnum [
		^ self
		  enumNamed: #primitiveTypes
		  definedWith:'vbEmpty 	0 	Empty (uninitialized)
vbNull 	1 	Null (no valid data)
vbInteger 	2 	Integer
vbLong 	3 	Long integer
vbSingle 	4 	Single-precision floating-point number
vbDouble 	5 	Double-precision floating-point number
vbCurrency 	6 	Currency value
vbDate 	7 	Date value
vbString 	8 	String
vbObject 	9 	Object
vbError 	10 	Error value
vbBoolean 	11 	Boolean value
vbVariant 	12 	Variant (used only with arrays of variants)
vbDataObject 	13 	A data access object
vbDecimal 	14 	Decimal value
vbByte 	17 	Byte value
vbLongLong 	20 	LongLong integer (valid on 64-bit platforms only)
vbUserDefinedType 	36 	Variants that contain user-defined types
vbArray 	8192 	Array (always added to another constant when returned by this function)' 	

]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> qBColor [
	^ self
		  functionNamed: #QBColor
		  returns: self long
		  parametersFromString: 'color required integer'
]

{ #category : #'enum constants' }
JinDAMSDKLibraryBuilder >> queryClose [
		^ self
		  enumNamed: #queryClose
		  definedWith:'vbFormControlMenu 	0 	The user chose the Close command from the Control menu on the form.
vbFormCode 	1 	The Unload statement is invoked from code.
vbAppWindows 	2 	The current Microsoft Windows operating environment session is ending.
vbAppTaskManager 	3 	The Windows Task Manager is closing the application' 	

]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> rGB [
	^ self
		  functionNamed: #RGB
		  returns: self long
		  parametersFromString: 'red 	Required; Integer Variant (Integer). Number in the range 0–255, inclusive, that represents the red component of the color.
green 	Required; Integer Variant (Integer). Number in the range 0–255, inclusive, that represents the green component of the color.
blue 	Required; Integer Variant (Integer). Number in the range 0–255, inclusive, that represents the blue component of the color.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> rTrim [
	^ self
		  functionNamed: #RTrim
		  returns: self string
		  parametersFromString: 'expr required string'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> rate [
	^ self
		  functionNamed: #Rate
		  returns: self double
		  parametersFromString: 'nper 	Required. Double specifying total number of payment periods in the annuity. For example, if you make monthly payments on a four-year car loan, your loan has a total of 4 * 12 (or 48) payment periods.
pmt 	Required. Double specifying payment to be made each period. Payments usually contain principal and interest that doesn''t change over the life of the annuity.
pv 	Required. Double specifying present value, or value today, of a series of future payments or receipts. For example, when you borrow money to buy a car, the loan amount is the present value to the lender of the monthly car payments you will make.
fv 	Optional. Variant specifying future value or cash balance you want after you make the final payment. For example, the future value of a loan is $0 because that''s its value after the final payment. However, if you want to save $50,000 over 18 years for your child''s education, $50,000 is the future value. If omitted, 0 is assumed.
type 	Optional. Variant specifying a number indicating when payments are due. Use 0 if payments are due at the end of the payment period, or use 1 if payments are due at the beginning of the period. If omitted, 0 is assumed.
guess 	Optional. Variant specifying value you estimate will be returned by Rate. If omitted, guess is 0.1 (10 percent).'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> replace [
	^ self
		  functionNamed: #Replace
		  returns: self string
		  parametersFromString: 'expression 	Required. String expression containing substring to replace.
find 	Required. Substring being searched for.
replace 	Required. Replacement substring.
start 	Optional. Start position for the substring of expression to be searched and returned. If omitted, 1 is assumed.
count 	Optional. Number of substring substitutions to perform. If omitted, the default value is -1, which means, make all possible substitutions.
compare 	Optional. comparison Numeric value indicating the kind of comparison to use when evaluating substrings. See Settings section for values.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> right [
	^ self
		  functionNamed: #Right
		  returns: self string
		  parametersFromString: 'string 	Required. String expression from which the rightmost characters are returned. If string contains Null, Null is returned.
length 	Required; Long Variant (Long). Numeric expression indicating how many characters to return. If 0, a zero-length string ("") is returned. If greater than or equal to the number of characters in string, the entire string is returned.'
]

{ #category : #'sdk functions math' }
JinDAMSDKLibraryBuilder >> rnd [
	^ self
		  functionNamed: #Rnd
		  returns: self single
		  parametersFromString: 'number required variant'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> round [
	^ self
		  functionNamed: #Round
		  returns: self variant
		  parametersFromString: 'expression 	Required. Numeric expression being rounded.
numdecimalplaces 	Optional. Integer indicating how many places to the right of the decimal are included in the rounding. If omitted, integers are returned by the Round function.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> sLN [
	^ self
		  functionNamed: #SLN
		  returns: self double
		  parametersFromString: 'cost 	Required. Double specifying initial cost of the asset.
salvage 	Required. Double specifying value of the asset at the end of its useful life.
life 	Required. Double specifying length of the useful life of the asset.s'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> sYD [
	^ self
		  functionNamed: #SYD
		  returns: self double
		  parametersFromString: 'cost 	Required. Double specifying initial cost of the asset.
salvage 	Required. Double specifying value of the asset at the end of its useful life.
life 	Required. Double specifying length of the useful life of the asset.
period 	Required. Double specifying period for which asset depreciation is calculated.'
]

{ #category : #'sdk classes' }
JinDAMSDKLibraryBuilder >> sdkClassNamed: aName [

	^ created at: aName, 'classType' ifAbsentPut: [ 
		  | t |
		  t := self instantiate: JinDAMClass.
		  t name: aName.
		  t ]
]

{ #category : #building }
JinDAMSDKLibraryBuilder >> sdkClasses [

	^ { self debugClass }
]

{ #category : #building }
JinDAMSDKLibraryBuilder >> sdkEnums [
	^ { 
		self calendar . 
		self callType . 
		self color .
		self comparison .
		self dateEnum . 
		self dateFormat . 
		self dirGetAttrSetAttrPermissions . " Dir, GetAttr, and SetAttr constants "
		self driveType . 
		self fileAttribute .
		self fileInputOutput .
		self form . 
		self imeStatus .
		self keyCode .
		self miscellaneous .
		self msgBoxEnum .
		self queryClose . 
		self shellEnum .
		self specialFolder .
		self strConvEnum . 
		self systemColor . 
		self tristate 
		
	
	
	 }
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> sdkFunctions [

	^ { 
		  self array.
		  self callByName.
		  self choose.
		  self command.
		  self createObject.
		  self curDir.
		  self dateFunction.
		  self dateAdd.
		  self dateDiff.
		  self datePart.
		  self dateSerial.
		  self dateValue.
		  self day.
		  self ddb.
		  self dir.
		  self doEvents.
		  self environ.
		  self eof.
		  self errorFunction.
		  self fileAttr.
		  self fileDateTime.
		  self fileLen.
		  self filter.
		  self formatCurrency.
		  self formatDateTime.
		  self formatNumber.
		  self formatPercent.
		  self freeFile.
		  self fv.
		  self getAllSettings.
		  self getAttr.
		  self getObject.
		  self getSetting.
		  self hour.
		  self iIf.
		  self iMEStatus.
		  self input.
		  self inputBox.
		  self inStr.
		  self inStrRev.
		  self iPmt.
		  self iRR.
		  self isArrayFunction.
		  self isDate.
		  self isEmpty.
		  self isErrorFunction.
		  self isMissing.
		  self isNull.
		  self isNumeric.
		  self isObject.
		  self join.
		  self lBound.
		  self lCase.
		  self left.
		  self len.
		  self loc.
		  self lOF.
		  self lTrim.
		  self rTrim.
		  self trim.
		  self macID.
		  self macScript.
		  self mid.
		  self minute.
		  self mIRR.
		  self month.
		  self monthName.
		  self msgBox.
		  self now.
		  self nPer.
		  self nPV.
		  self partition.
		  self pmt.
		  self pPmt.
		  self pV.
		  self qBColor.
		  self rate.
		  self replace.
		  self rGB.
		  self right.
		  self round.
		  self second.
		  self seek.
		  self shell.
		  self sLN.
		  self space.
		  self spc.
		  self split.
		  self strComp.
		  self strConv.
		  self stringFunction.
		  self strReverse.
		  self switch.
		  self sYD.
		  self tab.
		  self time.
		  self timer.
		  self timeSerial.
		  self timeValue.
		  self typeName.
		  self uBound.
		  self uCase.
		  self varType.
		  self weekday.
		  self weekdayName.
		  self year }
]

{ #category : #'sdk statements' }
JinDAMSDKLibraryBuilder >> sdkStatements [
	"Still to define"
	^ {   }
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> second [
	^ self
		  functionNamed: #Second
		  returns: self integer
		  parametersFromString: 'expr required variant'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> seek [
	^ self
		  functionNamed: #Seek
		  returns: self long
		  parametersFromString: 'filenumber required integer'
]

{ #category : #'sdk functions math' }
JinDAMSDKLibraryBuilder >> sgn [
	^ self
		  functionNamed: #Sgn
		  returns: self integer
		  parametersFromString: 'number required variant'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> shell [
	^ self
		  functionNamed: #Shell
		  returns: self double
		  parametersFromString: 'pathname 	Required; String Variant (String). Name of the program to execute and any required arguments or command-line switches; may include directory or folder and drive. On the Macintosh, you can use the MacID function to specify an application''s signature instead of its name. The following example uses the signature for Microsoft Word: Shell MacID("MSWD")
windowstyle 	Optional. Integer Variant (Integer) corresponding to the style of the window in which the program is to be run. If windowstyle is omitted, the program is started minimized with focus. On the Macintosh (System 7.0 or later), windowstyle only determines whether or not the application gets the focus when it is run.'
]

{ #category : #'enum constants' }
JinDAMSDKLibraryBuilder >> shellEnum [
		^ self
		  enumNamed: #shell
		  definedWith:'vbHide 	0 	Window is hidden and focus is passed to the hidden window.
vbNormalFocus 	1 	Window has focus and is restored to its original size and position.
vbMinimizedFocus 	2 	Window is displayed as an icon with focus.
vbMaximizedFocus 	3 	Window is maximized with focus.
vbNormalNoFocus 	4 	Window is restored to its most recent size and position. The currently active window remains active.
vbMinimizedNoFocus 	6 	Window is displayed as an icon. The currently active window remains active.' 	

]

{ #category : #'sdk functions math' }
JinDAMSDKLibraryBuilder >> sin [
	^ self
		  functionNamed: #Sin
		  returns: self double
		  parametersFromString: 'number required variant'
]

{ #category : #'primitive types' }
JinDAMSDKLibraryBuilder >> single [
	^ self primitiveTypeNamed: #Single
		
	
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> space [
	^ self
		  functionNamed: #Space
		  returns: self string
		  parametersFromString: 'amount required integer'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> spc [
	^ self
		  functionNamed: #Spc
		  returns: self variant
		  parametersFromString: 'amount required integer'
]

{ #category : #'enum constants' }
JinDAMSDKLibraryBuilder >> specialFolder [
		^ self
		  enumNamed: #specialFolder
		  definedWith:'WindowsFolder 	0 	The Windows folder contains files installed by the Windows operating system.
SystemFolder 	1 	The System folder contains libraries, fonts, and device drivers.
TemporaryFolder 	2 	The Temp folder is used to store temporary files. Its path is found in the TMP environment variable.' 	

]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> split [
	^ self
		  functionNamed: #Split
		  returns: self variant
		  parametersFromString: 'expression 	Required. String expression containing substrings and delimiters. If expression is a zero-length string(""), Split returns an empty array, that is, an array with no elements and no data.
delimiter 	Optional. String character used to identify substring limits. If omitted, the space character (" ") is assumed to be the delimiter. If delimiter is a zero-length string, a single-element array containing the entire expression string is returned.
limit 	Optional. Integer of substrings to be returned; -1 indicates that all substrings are returned.
compare 	Optional. comparison Numeric value indicating the kind of comparison to use when evaluating substrings. See Settings section for values.'
]

{ #category : #'sdk functions math' }
JinDAMSDKLibraryBuilder >> sqr [
	^ self
		  functionNamed: #Sqr
		  returns: self double
		  parametersFromString: 'number required variant'
]

{ #category : #'sdk functions conversion' }
JinDAMSDKLibraryBuilder >> str [
	^ self
		  functionNamed: #Str
		  returns: self string
		  parametersFromString: 'val required long'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> strComp [
	^ self
		  functionNamed: #StrComp
		  returns: self integer
		  parametersFromString: 'string1 	Required. String Any valid string expression.
string2 	Required. String Any valid string expression.
compare 	Optional. Comparison Specifies the type of string comparison. If the compare argument is Null, an error occurs. If compare is omitted, the Option Compare setting determines the type of comparison.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> strConv [
	^ self
		  functionNamed: #StrConv
		  returns: self string
		  parametersFromString: 'string 	Required. String expression to be converted.
conversion 	Required. StrConvEnum Integer. The sum of values specifying the type of conversion to perform.
LCID 	Optional. The LocaleID, if different than the system LocaleID. (The system LocaleID is the default.)'
]

{ #category : #'enum constants' }
JinDAMSDKLibraryBuilder >> strConvEnum [
		^ self
		  enumNamed: #strConv
		  definedWith:'vbUpperCase 	1 	Converts the string to uppercase characters.
vbLowerCase 	2 	Converts the string to lowercase characters.
vbProperCase 	3 	Converts the first letter of every word in string to uppercase.
vbWide 	4 	Converts narrow (single-byte) characters in string to wide (double-byte) characters. Applies to East Asia locales.
vbNarrow 	8 	Converts wide (double-byte) characters in string to narrow (single-byte) characters. Applies to East Asia locales.
vbKatakana 	16 	Converts Hiragana characters in string to Katakana characters. Applies to Japan only.
vbHiragana 	32 	Converts Katakana characters in string to Hiragana characters. Applies to Japan only.
vbUnicode 	64 	Converts the string to Unicode by using the default code page of the system (not available on the Macintosh).
vbFromUnicode 	128 	Converts the string from Unicode to the default code page of the system (not available on the Macintosh).' 	

]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> strReverse [
	^ self
		  functionNamed: #StrReverse
		  returns: self string
		  parametersFromString: 'expr required string'
]

{ #category : #'primitive types' }
JinDAMSDKLibraryBuilder >> string [
	^ self primitiveTypeNamed: #String
		
	
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> stringFunction [
	^ self
		  functionNamed: #String
		  returns: self string
		  parametersFromString: 'number 	Required; Long. Length of the returned string. If number contains Null, Null is returned.
character 	Required; Variant. Character code specifying the character or string expression whose first character is used to build the return string. If character contains Null, Null is returned.'
]

{ #category : #'sdk statements' }
JinDAMSDKLibraryBuilder >> subProcedureNamed: aName parametersFromString: aStringDefinition [

	| func param defLines stream type |
	^ created at: aName , 'function' ifAbsentPut: [ 
		  func := self instantiate: JinDAMSubProcedure.
		  func selector: aName.
		  defLines := aStringDefinition lines collect: [ :l | 
			              l trimBoth copyReplaceAll: String tab with: '' ].
		  defLines do: [ :l | 
			  | typeName |
			  param := self instantiate: JinDAMParameter.
			  func addParameter: param.
			  stream := l readStream.
			  param name: (stream upToAll: ' ') trimBoth.
			  param isOptional:
				  (self isOptionalOrNot: (stream upToAll: ' ') trimBoth).
			  typeName := (stream upToAll: ' ') trimBoth.
			  type := self typeNamed: typeName.
			  param typeReference:
				  (self typeReferenceName: typeName type: type context: param ) ].
		  func ]
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> switch [
	^ self
		  functionNamed: #Switch
		  returns: self variant
		  parametersFromString: 'expr 	Required. Variant expression that you want to evaluate.
value 	Required. variant Value or expression to be returned if the corresponding expression is True.'
]

{ #category : #'enum constants' }
JinDAMSDKLibraryBuilder >> systemColor [
		^ self
		  enumNamed: #systemColor
		  definedWith:'vbScrollBars 	0x80000000 	Scroll bar color
vbDesktop 	0x80000001 	Desktop color
vbActiveTitleBar 	0x80000002 	Color of the title bar for the active window
vbInactiveTitleBar 	0x80000003 	Color of the title bar for the inactive window
vbMenuBar 	0x80000004 	Menu background color
vbWindowBackground 	0x80000005 	Window background color
vbWindowFrame 	0x80000006 	Window frame color
vbMenuText 	0x80000007 	Color of text on menus
vbWindowText 	0x80000008 	Color of text in windows
vbTitleBarText 	0x80000009 	Color of text in caption, size box, and scroll arrow
vbActiveBorder 	0x8000000A 	Border color of active window
vbInactiveBorder 	0x8000000B 	Border color of inactive window
vbApplicationWorkspace 	0x8000000C 	Background color of multiple-document interface (MDI) applications
vbHighlight 	0x8000000D 	Background color of items selected in a control
vbHighlightText 	0x8000000E 	Text color of items selected in a control
vbButtonFace 	0x8000000F 	Color of shading on the face of command buttons
vbButtonShadow 	0x80000010 	Color of shading on the edge of command buttons
vbGrayText 	0x80000011 	Grayed (disabled) text
vbButtonText 	0x80000012 	Text color on push buttons
vbInactiveCaptionText 	0x80000013 	Color of text in an inactive caption
vb3DHighlight 	0x80000014 	Highlight color for 3-D display elements
vb3DDKShadow 	0x80000015 	Darkest shadow color for 3-D display elements
vb3DLight 	0x80000016 	Second lightest 3-D color after vb3DHighlight
vbInfoText 	0x80000017 	Color of text in ToolTips
vbInfoBackground 	0x80000018 	Background color of ToolTips' 	

]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> tab [
	^ self
		  functionNamed: #Tab
		  returns: self string
		  parametersFromString: 'amount required integer'
]

{ #category : #'sdk functions math' }
JinDAMSDKLibraryBuilder >> tan [
	^ self
		  functionNamed: #Tan
		  returns: self double
		  parametersFromString: 'number required variant'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> time [
	^ self
		  functionNamed: #Time
		  returns: self date
		  parametersFromString: ''
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> timeSerial [
	^ self
		  functionNamed: #TimeSerial
		  returns: self date
		  parametersFromString: 'hour 	Required; Integer Variant (Integer). Number between 0 (12:00 A.M.) and 23 (11:00 P.M.), inclusive, or a numeric expression.
minute 	Required; Integer Variant (Integer). Any numeric expression.
second 	Required; Integer Variant (Integer). Any numeric expression.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> timeValue [
	^ self
		  functionNamed: #TimeValue
		  returns: self date
		  parametersFromString: 'expr required variant'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> timer [
	^ self
		  functionNamed: #Timer
		  returns: self single
		  parametersFromString: ''
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> trim [
	^ self
		  functionNamed: #Trim
		  returns: self string
		  parametersFromString: 'expr required string'
]

{ #category : #'enum constants' }
JinDAMSDKLibraryBuilder >> tristate [
		^ self
		  enumNamed: #tristate
		  definedWith:'vbTrue 	-1 	True
vbFalse 	0 	False
vbUseDefault 	-2 	Use default setting' 	

]

{ #category : #'sdk functions conversion' }
JinDAMSDKLibraryBuilder >> typeConversionSdkFunctions [

	^ { 
		  self asc.
		  self chr.
		  self chrB.
		  self chrW.
		  self cVErr.
		  self format.
		  self hex.
		  self oct.
		  self str.
		  self val }
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> typeName [
	^ self
		  functionNamed: #TypeName
		  returns: self string
		  parametersFromString: 'variableName required variant'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> typeNamed: aName [
	"
	If i respond to the typename as a msg send, i return that. 
	If not: variant
	"

	aName asLowercase = #value
		ifTrue: [ ^ self variant ].
	(self respondsTo: aName asSymbol)
		ifTrue: [ ^ self perform: aName asSymbol ].
	(self respondsTo: aName uncapitalized asSymbol)
		ifTrue: [ ^ self perform: aName uncapitalized asSymbol ].
	^ self variant
]

{ #category : #'as yet unclassified' }
JinDAMSDKLibraryBuilder >> typeReferenceName: aString type: aJinDAMPrimitiveType context: aContext [

	| reference |
	self assert: (aString indexOf: '.') = 0.
	reference := self instantiate: JinDAMTypeReference.
	reference context: aContext. 
	reference typeName: aString.
	reference candidate: aJinDAMPrimitiveType.
	reference candidateAnchor: aJinDAMPrimitiveType anchor. 
	^ reference
]

{ #category : #'+' }
JinDAMSDKLibraryBuilder >> typeReferenceName: aString typeSymbol: aCollection context: aContext [

	| reference |
	self assert: (aString indexOf: '.') = 0.
	reference := self instantiate: JinDAMTypeReference.
	reference context: aContext.
	reference typeName: aString.


	(aCollection isEmpty and: [ aString = 'NULL' ]) ifFalse: [ 
		self assert: aCollection size = 1.
		reference candidateAnchor: aCollection first anchor ].

	^ reference
]

{ #category : #building }
JinDAMSDKLibraryBuilder >> types [ 
	^ self primitiveTypes, self sdkClasses, self sdkEnums
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> uBound [
	^ self
		  functionNamed: #UBound
		  returns: self long
		  parametersFromString: 'arrayname 	Required. Variant Name of the array variable; follows standard variable naming conventions.
dimension 	Optional; Long Variant (Long). Whole number indicating which dimension''s upper bound is returned. Use 1 for the first dimension, 2 for the second, and so on. If dimension is omitted, 1 is assumed.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> uCase [
	^ self
		  functionNamed: #UCase
		  returns: self string
		  parametersFromString: 'expr required string'
]

{ #category : #alias }
JinDAMSDKLibraryBuilder >> ubyte [

	^ self newAlias: #ubyte to: self byte
]

{ #category : #alias }
JinDAMSDKLibraryBuilder >> uint [

	^ self newAlias: #uint to: self integer
]

{ #category : #alias }
JinDAMSDKLibraryBuilder >> uint16 [

	^ self newAlias: #uint16 to: self integer
]

{ #category : #alias }
JinDAMSDKLibraryBuilder >> uint32 [

	^ self newAlias: #uint32 to: self integer
]

{ #category : #alias }
JinDAMSDKLibraryBuilder >> userDefined [

	^ self newAlias: #USERDEFINED to: self object
]

{ #category : #'sdk functions conversion' }
JinDAMSDKLibraryBuilder >> val [
	^ self
		  functionNamed: #Val
		  returns: self variant
		  parametersFromString: 'val required long'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> varType [
	^ self
		  functionNamed: #VarType
		  returns: self primitiveTypesEnum
		  parametersFromString: 'varName required variant'
]

{ #category : #'primitive types' }
JinDAMSDKLibraryBuilder >> variant [
	^ self primitiveTypeNamed: #Variant
		
	
]

{ #category : #'primitive types' }
JinDAMSDKLibraryBuilder >> void [
	^ self primitiveTypeNamed: #Void
		
	
]

{ #category : #alias }
JinDAMSDKLibraryBuilder >> voidAlias [

	^ self newAlias: #VOID to: self void
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> weekday [
	^ self
		  functionNamed: #Weekday
		  returns: self integer
		  parametersFromString: 'date 	Required. Variant, numeric expression, string expression, or any combination, that can represent a date. If date contains Null, Null is returned.
firstdayofweek 	Optional. DateEnum A constant that specifies the first day of the week. If not specified, vbSunday is assumed.'
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> weekdayName [
	^ self
		  functionNamed: #WeekdayName
		  returns: self string
		  parametersFromString: 'weekday 	Required. The numeric designation for the day of the week. Numeric value of each day depends on setting of the firstdayofweek setting.
abbreviate 	Optional. Boolean value that indicates if the weekday name is to be abbreviated. If omitted, the default is False, which means that the weekday name is not abbreviated.
firstdayofweek 	Optional. DateEnum Numeric value indicating the first day of the week. See Settings section for values.'
]

{ #category : #alias }
JinDAMSDKLibraryBuilder >> winVariant [

	^ self newAlias: #Win32Variant to: self object
]

{ #category : #alias }
JinDAMSDKLibraryBuilder >> winWideString [

	^ self newAlias: #Win32WideString to: self string
]

{ #category : #'sdk functions' }
JinDAMSDKLibraryBuilder >> year [

	^ self
		  functionNamed: #Year
		  returns: self integer
		  parametersFromString: 'expr required variant'
]
