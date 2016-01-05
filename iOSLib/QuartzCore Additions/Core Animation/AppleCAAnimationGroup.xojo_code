#tag Class
Protected Class AppleCAAnimationGroup
Inherits AppleCAAnimation
	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From AppleCAAnimation
		  // Constructor() -- From AppleObject
		  // Constructor(AnId as Ptr) -- From AppleObject
		  MakeInstance
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(paramarray myAnimations as AppleCAAnimation)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From AppleCAAnimation
		  // Constructor() -- From AppleObject
		  // Constructor(AnId as Ptr) -- From AppleObject
		  MakeInstance
		  dim myarray as new AppleMutableArray
		  for each anim as AppleCAAnimation in myAnimations
		    myarray.Addobject anim
		  next
		  Animations = myarray
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MakeInstance()
		  Super.Constructor (alloc(ClassPtr))
		  RetainClassObject
		  dim mydelegate as new AppleCAAnimationDelegate
		  setDelegate mydelegate.id
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function animations lib QuartzCoreLib selector "animations" (id as ptr) as Ptr
			  return AppleArray.MakeFromPtr (animations (id))
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare Sub setAnimations lib QuartzCoreLib selector "setAnimations:" (id as ptr, value as Ptr)
			  setAnimations (id, value.id)
			  
			End Set
		#tag EndSetter
		Animations As AppleArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  static mClassPtr as Ptr = FoundationFramework.NSClassFromString ("CAAnimationGroup")
			  return mClassPtr
			End Get
		#tag EndGetter
		Shared ClassPtr As Ptr
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
