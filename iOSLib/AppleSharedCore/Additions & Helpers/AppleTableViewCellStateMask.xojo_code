#tag Class
Protected Class AppleTableViewCellStateMask
	#tag Method, Flags = &h0
		Sub Constructor(value as uinteger = 0)
		  mid = value
		End Sub
	#tag EndMethod


	#tag Note, Name = Notes
		
		A helper class for UITableViewCells StateMask method
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return new AppleTableViewCellStateMask
			End Get
		#tag EndGetter
		Shared DefaultMask As AppleTableViewCellStateMask
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mID
			End Get
		#tag EndGetter
		ID As uinteger
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mID As UInteger
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return hasbit (id, 1)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value then
			    mid = setbit(mid, 1)
			  else
			    mid = clearbit(mid, 1)
			  end if
			End Set
		#tag EndSetter
		ShowingDeleteConfirmationMask As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return hasbit (id, 0)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value then
			    mid = setbit(mid, 0)
			  else
			    mid = clearbit(mid, 0)
			  end if
			End Set
		#tag EndSetter
		ShowingEditControlMask As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ID"
			Group="Behavior"
			Type="uinteger"
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
			Name="ShowingDeleteConfirmationMask"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowingEditControlMask"
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
