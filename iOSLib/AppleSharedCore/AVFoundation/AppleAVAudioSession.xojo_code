#tag Class
Protected Class AppleAVAudioSession
Inherits AppleObject
	#tag Method, Flags = &h21
		Attributes( hidden ) Private Sub AudioHintBlock(Notificationptr as ptr)
		  dim Notification as new AppleNotification (Notificationptr)
		  if me <> nil then RaiseEvent SecondaryAudioHint (Notification.UserInfo)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From AppleObject
		  // Constructor(AnId as Ptr) -- From AppleObject
		  Super.Constructor (SharedInstance.id)
		  dim ChangeBlock as new AppleBlock (addressof RouteChangeBlock)
		  call AppleNotificationCenter.DefaultCenter.addObserverForName (kAVAudioSessionRouteChangeNotification, id, AppleOperationQueue.MainQueue, ChangeBlock.Handle)
		  dim interruptblock as new AppleBlock (addressof InterruptionBlock)
		  call AppleNotificationCenter.DefaultCenter.addObserverForName (kAVAudioSessionInterruptionNotification, id, AppleOperationQueue.MainQueue, interruptblock.Handle)
		  dim ServiceBlock as new AppleBlock (addressof ServiceLostBlock)
		  call AppleNotificationCenter.DefaultCenter.addObserverForName (kAVAudioSessionMediaServicesWereLostNotification, id, AppleOperationQueue.MainQueue, ServiceBlock.Handle)
		  dim ResetBlock as new AppleBlock (addressof ServiceResetBlock)
		  call AppleNotificationCenter.DefaultCenter.addObserverForName (kAVAudioSessionMediaServicesWereResetNotification, id, AppleOperationQueue.MainQueue, resetBlock.Handle)
		  dim Silence as new AppleBlock (addressof AudioHintBlock)
		  call AppleNotificationCenter.DefaultCenter.addObserverForName (kAVAudioSessionSilenceSecondaryAudioHintNotification , id, AppleOperationQueue.MainQueue, Silence.Handle)
		  
		  // mhasownership = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub destructor()
		  // AppleNotificationCenter.DefaultCenter.removeObserver (me)
		End Sub
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getavailableInputs Lib AVFoundationLibname Selector "availableInputs" (id as ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getavailableModes Lib AVFoundationLibname Selector "availableModes" (id as ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getcategory Lib AVFoundationLibname Selector "category" (id as ptr) As CFStringRef
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getcategoryOptions Lib AVFoundationLibname Selector "categoryOptions" (id as ptr) As UInteger
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getcurrentRoute Lib AVFoundationLibname Selector "currentRoute" (id as ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getinputDataSource Lib AVFoundationLibname Selector "inputDataSource" (id as ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getinputDataSources Lib AVFoundationLibname Selector "inputDataSources" (id as ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getInputGain Lib AVFoundationLibname Selector "inputGain" (id as ptr) As single
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getinputLatency Lib AVFoundationLibname Selector "inputLatency" (id as ptr) As Double
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getinputNumberOfChannels Lib AVFoundationLibname Selector "inputNumberOfChannels" (id as ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getIOBufferDuration Lib AVFoundationLibname Selector "IOBufferDuration" (id as ptr) As Double
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getmaximumInputNumberOfChannels Lib AVFoundationLibname Selector "maximumInputNumberOfChannels" (id as ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getmaximumOutputNumberOfChannels Lib AVFoundationLibname Selector "maximumOutputNumberOfChannels" (id as ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getmode Lib AVFoundationLibname Selector "mode" (id as ptr) As CFStringRef
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getoutputDataSource Lib AVFoundationLibname Selector "outputDataSource" (id as ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getoutputDataSources Lib AVFoundationLibname Selector "outputDataSources" (id as ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getoutputLatency Lib AVFoundationLibname Selector "outputLatency" (id as ptr) As Double
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getoutputNumberOfChannels Lib AVFoundationLibname Selector "outputNumberOfChannels" (id as ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getoutputVolume Lib AVFoundationLibname Selector "outputVolume" (id as ptr) As single
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getpreferredInput Lib AVFoundationLibname Selector "preferredInput" (id as ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getpreferredInputNumberOfChannels Lib AVFoundationLibname Selector "preferredInputNumberOfChannels" (id as ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getpreferredIOBufferDuration Lib AVFoundationLibname Selector "preferredIOBufferDuration" (id as ptr) As Double
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getpreferredOutputNumberOfChannels Lib AVFoundationLibname Selector "preferredOutputNumberOfChannels" (id as ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getpreferredSampleRate Lib AVFoundationLibname Selector "preferredSampleRate" (id as ptr) As Double
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getrecordPermission Lib AVFoundationLibname Selector "recordPermission" (id as ptr) As OSType
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getsampleRate Lib AVFoundationLibname Selector "sampleRate" (id as ptr) As Double
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getsecondaryAudioShouldBeSilencedHint Lib AVFoundationLibname Selector "secondaryAudioShouldBeSilencedHint" (id as ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function getsharedInstance Lib AVFoundationLibname Selector "sharedInstance" (id as ptr) As Ptr
	#tag EndExternalMethod

	#tag Method, Flags = &h21
		Attributes( hidden ) Private Sub InterruptionBlock(Notificationptr as ptr)
		  dim Notification as new AppleNotification (Notificationptr)
		  if me <> nil then RaiseEvent Interruption (Notification.UserInfo)
		End Sub
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function isInputAvailable Lib AVFoundationLibname Selector "isInputAvailable" (id as ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function isInputGainSettable Lib AVFoundationLibname Selector "isInputGainSettable" (id as ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function isOtherAudioPlaying Lib AVFoundationLibname Selector "isOtherAudioPlaying" (id as ptr) As Boolean
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function OverrideOutputAudioPort(Override as AVAudioSessionPortOverride, error as appleerror = Nil) As Boolean
		  dim uintval as uint32 = OST_spkr
		  return setoverrideOutputAudioPort (SharedInstance.id, if (Override = AVAudioSessionPortOverride.Speaker, uintval, 0), if (error = nil, nil, error.id))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Attributes( hidden ) Private Sub PermissionBlock(Granted as Boolean)
		  if me <> nil then raiseevent RecordPermissionReceived(granted)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestRecordPermission()
		  dim PermBlock as new AppleBlock (AddressOf PermissionBlock)
		  RequestRecordPermission (SharedInstance.Id, PermBlock.Handle)
		  
		End Sub
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Sub requestRecordPermission Lib AVFoundationLibname Selector "requestRecordPermission:" (id as ptr, block as ptr)
	#tag EndExternalMethod

	#tag Method, Flags = &h21
		Attributes( hidden ) Private Sub RouteChangeBlock(Notificationptr as ptr)
		  dim Notification as new AppleNotification (Notificationptr)
		  if me <> nil then RaiseEvent RouteChanged (Notification.UserInfo)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Attributes( hidden ) Private Sub ServiceLostBlock()
		  if me <> nil then RaiseEvent ServicesLost ()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Attributes( hidden ) Private Sub ServiceResetBlock()
		  if me <> nil then RaiseEvent ServicesReset ()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetActive(Active as Boolean, Error As appleerror = nil) As Boolean
		  return setactive (SharedInstance.id, active, if (error = nil, nil, error.id))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetActive(Active as Boolean, NotiFyOthersOnDeactivation as Boolean, Error As appleerror = nil) As Boolean
		  return setactiveoptions (SharedInstance.id, active, if (NotiFyOthersOnDeactivation, 1, 0), if (error = nil, nil, error.id))
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function setactive Lib AVFoundationLibname Selector "setActive:error:" (id as ptr, value as boolean, error as ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function setActiveOptions Lib AVFoundationLibname Selector "setActive:withOptions:error:" (id as ptr, value as boolean, options as uinteger, error as ptr) As Boolean
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function SetCategory(Category as CFStringRef, options as appleavaudiosessioncategoryoptions, Error As appleerror = nil) As Boolean
		  return SetCategoryOptions (SharedInstance.id, Category, options.id, if (error = nil, nil, error.id))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetCategory(Category as CFStringRef, Error As appleerror = nil) As Boolean
		  return SetCategory (SharedInstance.id, Category, if (error = nil, nil, error.id))
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function setcategory Lib AVFoundationLibname Selector "setCategory:error:" (id as ptr, value as CFStringRef, error as ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function setcategoryOptions Lib AVFoundationLibname Selector "setCategory:withOptions:error:" (id as ptr, value as CFStringRef, options as uinteger, error as ptr) As Boolean
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function SetInputDataSource(DataSource as appleavaudiosessiondatasourcedescription, Error As appleerror = nil) As Boolean
		  return SetInputdatasource (SharedInstance.id, DataSource.id, if (error = nil, nil, error.id))
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function setInputDataSource Lib AVFoundationLibname Selector "setInputDataSource:error:" (id as ptr, value as ptr, error as ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function setInputGain Lib AVFoundationLibname Selector "setInputGain:error:" (id as ptr, value as single, error as ptr) As Boolean
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function SetInputGain(Gain as single, Error As appleerror = nil) As Boolean
		  return SetInputGain (SharedInstance.id, gain, if (error = nil, nil, error.id))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetMode(Mode as CFStringRef, Error As appleerror = nil) As Boolean
		  return setMode (SharedInstance.id, Mode, if (error = nil, nil, error.id))
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function setmode Lib AVFoundationLibname Selector "setMode:error:" (id as ptr, value as CFStringRef, error as ptr) As Boolean
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function SetOutputDataSource(DataSource as appleavaudiosessiondatasourcedescription, Error As appleerror = nil) As Boolean
		  return SetOutputdatasource (SharedInstance.id, DataSource.id, if (error = nil, nil, error.id))
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function setOutputDataSource Lib AVFoundationLibname Selector "setOutputDataSource:error:" (id as ptr, value as ptr, error as ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function setoverrideOutputAudioPort Lib AVFoundationLibname Selector "overrideOutputAudioPort:error:" (id as ptr, value as uint32, error as ptr) As Boolean
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function SetPreferredInput(Input as appleAVAudioSessionPortDescription, Error As appleerror = nil) As Boolean
		  return setPreferredInput (SharedInstance.id, input.id, if (error = nil, nil, error.id))
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function setPreferredInput Lib AVFoundationLibname Selector "setPreferredInput:error:" (id as ptr, value as ptr, error as ptr) As Boolean
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function SetPreferredInputNumberOfChannels(ChannelCount as integer, Error As appleerror = nil) As Boolean
		  return setPreferredInputNumberOfChannels (SharedInstance.id, ChannelCount, if (error = nil, nil, error.id))
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function setPreferredInputNumberOfChannels Lib AVFoundationLibname Selector "setPreferredInputNumberOfChannels:error:" (id as ptr, value as integer, error as ptr) As Boolean
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function SetPreferredIOBufferDuration(value as double, Error As appleerror = nil) As Boolean
		  return setPreferredIOBufferDuration (SharedInstance.id, value, if (error = nil, nil, error.id))
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function setPreferredIOBufferDuration Lib AVFoundationLibname Selector "setPreferredIOBufferDuration:error:" (id as ptr, value as double, error as ptr) As Boolean
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function SetPreferredOutputNumberOfChannels(ChannelCount as integer, Error As appleerror = nil) As Boolean
		  return setPreferredOutputNumberOfChannels (SharedInstance.id, ChannelCount, if (error = nil, nil, error.id))
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function setPreferredOutputNumberOfChannels Lib AVFoundationLibname Selector "setPreferredOutputNumberOfChannels:error:" (id as ptr, value as integer, error as ptr) As Boolean
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function setPreferredSampleRate(value as double, Error As appleerror = nil) As Boolean
		  return setPreferredSampleRate (SharedInstance.id, value, if (error = nil, nil, error.id))
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Attributes( hidden ) Private Declare Function setPreferredSampleRate Lib AVFoundationLibname Selector "setPreferredSampleRate:error:" (id as ptr, value as double, error as ptr) As Boolean
	#tag EndExternalMethod


	#tag Hook, Flags = &h0
		Event Interruption(NotificationDict as AppleDictionary)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event RecordPermissionReceived(Granted as Boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event RouteChanged(NotificationDict as AppleDictionary)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SecondaryAudioHint(NotificationDict as AppleDictionary)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ServicesLost()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ServicesReset()
	#tag EndHook


	#tag Note, Name = Status
		
		Completed, but a few constants for NotificationDictionaries could follow
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return applearray.MakeFromPtr(getavailableInputs (SharedInstance.id))
			  
			End Get
		#tag EndGetter
		AvailableInputs As AppleArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // valid from iOS 9 on up:
			  if ObjectiveCRuntime.class_respondsToSelector (ClassPtr, FoundationFrameWork.NSSelectorFromString("availableModes")) then
			    return applearray.MakeFromPtr(getavailablemodes (SharedInstance.id))
			  end if
			End Get
		#tag EndGetter
		AvailableModes As AppleArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return getcategory (SharedInstance.id)
			End Get
		#tag EndGetter
		Category As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return new AppleAVAudioSessionCategoryOptions( getcategoryoptions (SharedInstance.id))
			End Get
		#tag EndGetter
		CategoryOptions As AppleAVAudioSessionCategoryOptions
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  static mClassPtr as ptr = FoundationFramework.NSClassFromString ("AVAudioSession")
			  return mClassPtr
			End Get
		#tag EndGetter
		Shared ClassPtr As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return AppleAVAudioSessionRouteDescription.MakeFromPtr(getcurrentRoute (SharedInstance.id))
			  
			End Get
		#tag EndGetter
		CurrentRoute As AppleAVAudioSessionRouteDescription
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return isInputAvailable (SharedInstance.id)
			End Get
		#tag EndGetter
		InputAvailable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return AppleAVAudioSessionDataSourceDescription.MakeFromPtr(getinputDataSource (SharedInstance.id))
			  
			End Get
		#tag EndGetter
		InputDataSource As AppleAVAudioSessionDataSourceDescription
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return applearray.MakeFromPtr(getinputDataSources (SharedInstance.id))
			  
			End Get
		#tag EndGetter
		InputDataSources As AppleArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return getinputGain (SharedInstance.id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if InputGainSettable  then call SetInputGain (value)
			End Set
		#tag EndSetter
		InputGain As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return isInputGainSettable (SharedInstance.id)
			End Get
		#tag EndGetter
		InputGainSettable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return getinputLatency (SharedInstance.id)
			End Get
		#tag EndGetter
		InputLatency As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return getinputNumberOfChannels (SharedInstance.id)
			End Get
		#tag EndGetter
		InputNumberOfChannels As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return getIOBufferDuration (SharedInstance.id)
			End Get
		#tag EndGetter
		IOBufferDuration As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return getmaximumInputNumberOfChannels (SharedInstance.id)
			End Get
		#tag EndGetter
		MaximumInputNumberOfChannels As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return getmaximumOutputNumberOfChannels (SharedInstance.id)
			End Get
		#tag EndGetter
		MaximumOutputNumberOfChannels As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return getmode (SharedInstance.id)
			End Get
		#tag EndGetter
		Mode As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return isOtherAudioPlaying (SharedInstance.id)
			End Get
		#tag EndGetter
		OtherAudioIsPlaying As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return getsecondaryAudioShouldBeSilencedHint (SharedInstance.id)
			End Get
		#tag EndGetter
		OtherAudioShouldBeSilenced As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return AppleAVAudioSessionDataSourceDescription.MakeFromPtr(getoutputDataSource (SharedInstance.id))
			  
			End Get
		#tag EndGetter
		OutputDataSource As AppleAVAudioSessionDataSourceDescription
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return applearray.MakeFromPtr(getoutputDataSources (SharedInstance.id))
			  
			End Get
		#tag EndGetter
		OutputDataSources As AppleArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return getoutputLatency (SharedInstance.id)
			End Get
		#tag EndGetter
		OutputLatency As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return getoutputNumberOfChannels (SharedInstance.id)
			End Get
		#tag EndGetter
		OutputNumberOfChannels As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return getoutputVolume (SharedInstance.id)
			End Get
		#tag EndGetter
		OutputVolume As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return AppleAVAudioSessionPortDescription.MakeFromPtr(getpreferredInput (SharedInstance.id))
			  
			End Get
		#tag EndGetter
		PreferredInput As AppleAVAudioSessionPortDescription
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return getpreferredInputNumberOfChannels (SharedInstance.id)
			End Get
		#tag EndGetter
		PreferredInputNumberOfChannels As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return getpreferredIOBufferDuration (SharedInstance.id)
			End Get
		#tag EndGetter
		PreferredIOBufferDuration As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return getpreferredOutputNumberOfChannels (SharedInstance.id)
			End Get
		#tag EndGetter
		PreferredOutputNumberOfChannels As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return getpreferredSampleRate (SharedInstance.id)
			End Get
		#tag EndGetter
		PreferredSampleRate As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return GetRecordPermission (SharedInstance.id)
			End Get
		#tag EndGetter
		RecordPermission As OSType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return getsampleRate (SharedInstance.id)
			End Get
		#tag EndGetter
		SampleRate As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Static SharedID as AppleAVAudioSession =  new AppleAVAudioSession(getsharedInstance(classptr))
			  return SharedID
			End Get
		#tag EndGetter
		Private Shared SharedInstance As AppleAVAudioSession
	#tag EndComputedProperty


	#tag Constant, Name = kAVAudioSessionCategoryAmbient, Type = Text, Dynamic = False, Default = \"AVAudioSessionCategoryAmbient", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAVAudioSessionCategoryAudioProcessing, Type = Text, Dynamic = False, Default = \"AVAudioSessionCategoryAudioProcessing", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAVAudioSessionCategoryMultiRoute, Type = Text, Dynamic = False, Default = \"AVAudioSessionCategoryMultiRoute", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAVAudioSessionCategoryPlayAndRecord, Type = Text, Dynamic = False, Default = \"AVAudioSessionCategoryPlayAndRecord", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAVAudioSessionCategoryPlayback, Type = Text, Dynamic = False, Default = \"AVAudioSessionCategoryPlayback", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAVAudioSessionCategoryRecord, Type = Text, Dynamic = False, Default = \"AVAudioSessionCategoryRecord", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAVAudioSessionCategorySoloAmbient, Type = Text, Dynamic = False, Default = \"AVAudioSessionCategorySoloAmbient", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAVAudioSessionInterruptionNotification, Type = Text, Dynamic = False, Default = \"AVAudioSessionInterruptionNotification", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kAVAudioSessionMediaServicesWereLostNotification, Type = Text, Dynamic = False, Default = \"AVAudioSessionMediaServicesWereLostNotification", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kAVAudioSessionMediaServicesWereResetNotification, Type = Text, Dynamic = False, Default = \"AVAudioSessionMediaServicesWereResetNotification", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kAVAudioSessionModeDefault, Type = Text, Dynamic = False, Default = \"AVAudioSessionModeDefault", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAVAudioSessionModeGameChat, Type = Text, Dynamic = False, Default = \"AVAudioSessionModeGameChat", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAVAudioSessionModeMeasurement, Type = Text, Dynamic = False, Default = \"AVAudioSessionModeMeasurement", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAVAudioSessionModeMoviePlayback, Type = Text, Dynamic = False, Default = \"AVAudioSessionModeMoviePlayback", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAVAudioSessionModeSpokenAudio, Type = Text, Dynamic = False, Default = \"AVAudioSessionModeSpokenAudio", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAVAudioSessionModeVideoChat, Type = Text, Dynamic = False, Default = \"AVAudioSessionModeVideoChat", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAVAudioSessionModeVideoRecording, Type = Text, Dynamic = False, Default = \"AVAudioSessionModeVideoRecording", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAVAudioSessionModeVoiceChat, Type = Text, Dynamic = False, Default = \"AVAudioSessionModeVoiceChat", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAVAudioSessionRouteChangeNotification, Type = Text, Dynamic = False, Default = \"AVAudioSessionRouteChangeNotification", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kAVAudioSessionSilenceSecondaryAudioHintNotification, Type = Text, Dynamic = False, Default = \"AVAudioSessionSilenceSecondaryAudioHintNotification ", Scope = Private
	#tag EndConstant

	#tag Constant, Name = OST_spkr, Type = Double, Dynamic = False, Default = \"&h73706b72", Scope = Public
	#tag EndConstant


	#tag Enum, Name = AVAudioSessionPortOverride, Type = Integer, Flags = &h0
		None
		Speaker
	#tag EndEnum

	#tag Enum, Name = SessionCategories, Type = Integer, Flags = &h0
		Ambient
		  SoloAmbient
		  Playback
		  Record
		  PlayAndRecord
		  AudioProcessing
		MultiRoute
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Category"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DebugDescription"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hash"
			Group="Behavior"
			Type="UInteger"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasOwnership"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InputAvailable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InputGain"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InputGainSettable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InputLatency"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InputNumberOfChannels"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IOBufferDuration"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsNIL"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaximumInputNumberOfChannels"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaximumOutputNumberOfChannels"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="mHasOwnership"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Mode"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OtherAudioIsPlaying"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OtherAudioShouldBeSilenced"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OutputLatency"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OutputNumberOfChannels"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OutputVolume"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PreferredInputNumberOfChannels"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PreferredIOBufferDuration"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PreferredOutputNumberOfChannels"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PreferredSampleRate"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RetainCount"
			Group="Behavior"
			Type="UInteger"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SampleRate"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
