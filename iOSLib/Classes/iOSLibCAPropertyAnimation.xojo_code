#tag Class
Protected Class iOSLibCAPropertyAnimation
Inherits iOSLIbCAAnimation
	#tag Method, Flags = &h1
		Protected Shared Function AnimationWithKeyPath(aClass As Ptr, Keypath as CFStringRef) As Ptr
		  declare function animationWithKeyPath lib UIKit selector "animationWithKeyPath:" (id as ptr, keyPath as CFStringRef) as ptr
		  return animationWithKeyPath (aClass, Keypath)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(keyPath as CFStringRef)
		  Super.Constructor (animationWithKeyPath (ClassPtr, keyPath))
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function additive lib UIKit selector "isAdditive" (id as ptr) as Boolean
			  return additive (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare Sub setAdditive lib UIKit selector "setAdditive:" (id as ptr, value as Boolean)
			  setAdditive (id, value)
			  
			End Set
		#tag EndSetter
		Additive As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  static mClassPtr as Ptr = NSClassFromString ("CAPropertyAnimation")
			  return mClassPtr
			End Get
		#tag EndGetter
		Shared ClassPtr As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function cumulative lib UIKit selector "isCumulative" (id as ptr) as Boolean
			  return cumulative (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare Sub setCumulative lib UIKit selector "setCumulative:" (id as ptr, value as Boolean)
			  setCumulative (id, value)
			  
			End Set
		#tag EndSetter
		Cumulative As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function keyPath lib UIKit selector "keyPath" (id as ptr) as CFStringRef
			  return keyPath (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare Sub setKeyPath lib UIKit selector "setKeyPath:" (id as ptr, value as CFStringRef)
			  setKeyPath (id, value)
			  
			End Set
		#tag EndSetter
		KeyPath As CFStringREf
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Additive"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Cumulative"
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