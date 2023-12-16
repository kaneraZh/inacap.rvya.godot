extends Node
func _ready():
	var mobile_vr_interface = MobileVRInterface.new()
	# Configure for a specific device (values might differ based on your device)
	mobile_vr_interface.set_display_to_lens(0.035) # Meters
	mobile_vr_interface.set_display_width(0.110) # Meters
	#mobile_vr_interface.set_display_to_lens_distance(0.064) # Meters
	mobile_vr_interface.set_iod(0.064) # Interocular distance (meters)
	
	# Enable the interface
	XRServer.add_interface(mobile_vr_interface)
	
	var vr_interface = XRServer.find_interface("Native mobile")
	if(vr_interface and vr_interface.initialize()):
		var vp = get_viewport()
		get_viewport().set_use_xr(true)
		get_viewport().set_use_hdr_2d(false)  # It's recommended to turn off HDR for mobile VR
