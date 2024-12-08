# WatchKit-demoapp

1. Important Notes
	•	If a physical device cannot be connected in Devices, try toggling Wi-Fi off and back on your Mac. Ensure the paired iPhone is connected to your Mac via a cable.
	•	The bundle identifier for the watch target should follow the format:
    [Main Bundle ID].watchkitapp.
	•	Physical devices and simulators have different screen sizes. Always test your UI on a real device.

2. Adding a Watch App Target
	1.	Add the Target:
	•	Go to File > New > Target.
	•	In the template sheet, select the watchOS tab.
	•	Choose the App template and click Next.
	•	Select Watch App for Existing iOS App, then click Finish.
	•	When prompted by Xcode to activate the Watch App scheme, click Activate.
	2.	Remove the Watch App Entry Point:
	•	Delete the entry point for the watchOS app. Since the main app will define the entry point, this step avoids duplication.
	3.	Share Files Between Targets:
	•	Select the files you want to share between your iOS and watchOS targets:
	•	Command-click files in the Project Navigator.
	•	Open the File Inspector.
	•	In the Target Membership section, check the box for your Watch App target (e.g., #WatchAppName Watch App).

    If your app needs to sync data between iPhone and Watch, explore WatchConnectivity. Example:
    WCSession.default.sendMessage(["key": "value"], replyHandler: nil, errorHandler: nil)

