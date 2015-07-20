#tag Class
Protected Class AppleAlertController
Inherits AppleViewController
	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(Title as CFStringRef, Message As CFStringRef = "", preferredStyle as UIAlertControllerStyle = UIAlertControllerStyle.alert)
		  Declare Function alertControllerWithTitle lib UIKit selector "alertControllerWithTitle:message:preferredStyle:" (id as ptr, Title as CFStringRef, Message As CFStringRef, preferredStyle as UIAlertControllerStyle) as Ptr
		  
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From AppleResponder
		  // Constructor() -- From AppleObject
		  // Constructor(AnId as Ptr) -- From AppleObject
		  if isAvailable then Super.Constructor (alertControllerWithTitle (classptr, Title, Message, preferredStyle))
		  RetainClassObject
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  static mClassPtr as Ptr = NSClassFromString ("UIAlertViewController")
			  return mClassPtr
			End Get
		#tag EndGetter
		Shared ClassPtr As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return not (ClassPtr = nil)
			End Get
		#tag EndGetter
		Shared isAvailable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function message lib UIKit selector "message" (id as ptr) as CFStringRef
			  Return message (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setMessage lib UIKit selector "setMessage:" (id as ptr, value as CFStringRef)
			  setMessage id, value
			End Set
		#tag EndSetter
		Message As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function preferredStyle lib UIKit selector "preferredStyle" (id as ptr) as UIAlertControllerStyle
			  Return preferredStyle (id)
			  
			End Get
		#tag EndGetter
		PreferredStyle As UIAlertControllerStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return getTitle
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  setTitle value
			End Set
		#tag EndSetter
		Title As Text
	#tag EndComputedProperty


	#tag Enum, Name = UIAlertControllerStyle, Type = Integer, Flags = &h0
		ActionSheet
		Alert
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutomaticallyAdjustsScrollViewInsets"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoRotate"
			Group="Behavior"
			Type="Boolean"
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
			Name="ExtendedLayoutIncludesOpaqueBars"
			Group="Behavior"
			Type="Boolean"
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
			Name="IsFirstResponder"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsNIL"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="isProxy"
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
			Name="Message"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="mHasOwnership"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ModalInPopover"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ModalPresentationStyle"
			Group="Behavior"
			Type="UIViewModalPresentationStyle"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ModalTransitonStyle"
			Group="Behavior"
			Type="UIModalTransitionStyle"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NibName"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PreferredStyle"
			Group="Behavior"
			Type="UIAlertControllerStyle"
			EditorType="Enum"
			#tag EnumValues
				"0 - ActionSheet"
				"1 - Alert"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextInputContextIdentifier"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Title"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ViewIsLoaded"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass