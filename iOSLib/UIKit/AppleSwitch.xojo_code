#tag Class
Protected Class AppleSwitch
Inherits AppleControl
	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Frame as FoundationFramework.NSRect)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From AppleView
		  // Constructor(aFrame  as FoundationFramework.NSRect) -- From AppleView
		  // Constructor(aFrame  as FoundationFramework.NSRect, observer as AppleNSEventReceiver) -- From AppleView
		  // Constructor() -- From AppleResponder
		  // Constructor() -- From AppleObject
		  // Constructor(AnId as Ptr) -- From AppleObject
		  Super.Constructor (DoInitWithFrame (alloc(ClassPtr), Frame))
		  mHasOwnership = true
		  
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0, CompatibilityFlags = (TargetIOS and (Target32Bit or Target64Bit)), Description = 546865206170706572616E6365206F626A656374206C65747320796F75206368616E67652070726F70657274696573206F6E20636C617373206C6576656C2E
		#tag Getter
			Get
			  return new appleswitch (GetAppearance (classptr))
			End Get
		#tag EndGetter
		Shared Apperance As Appleswitch
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static mClassPtr as Ptr = FoundationFramework.NSClassFromString ("UISwitch")
			  return mClassPtr
			End Get
		#tag EndGetter
		Protected Shared ClassPtr As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function isOn lib UIKitLibname selector "isOn" (id as ptr) as Boolean
			  return ison (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setOn lib UIKitLibname selector "setOn:" (id as ptr, value as Boolean)
			  setOn id, value
			End Set
		#tag EndSetter
		On As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function onTintColor lib UIKitLibname selector "onTintColor" (id as ptr) as Ptr
			  return applecolor.MakeFromPtr (onTintColor (id))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setOnTintColor lib UIKitLibname selector "setOnTintColor:" (id as ptr, value as Ptr)
			  setOnTintColor id, value.id
			End Set
		#tag EndSetter
		OnTintColor As Applecolor
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function thumbTintColor lib UIKitLibname selector "thumbTintColor" (id as ptr) as Ptr
			  return applecolor.MakeFromPtr (thumbTintColor (id))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setThumbTintColor lib UIKitLibname selector "setThumbTintColor:" (id as ptr, value as Ptr)
			  setThumbTintColor id, value.id
			End Set
		#tag EndSetter
		ThumbTintColor As Applecolor
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="On"
			Group="Behavior"
			Type="Boolean"
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
