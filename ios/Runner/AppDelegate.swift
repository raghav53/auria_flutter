import UIKit
import Flutter
import Firebase
import AuthenticationServices
import PassKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate , ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding{
    
  
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      self.initCustomInvoke()
      FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let token = deviceToken.map{String(format: "%02.2hhx", $0)}.joined()
        print("pushTokenFCM_ios ",token)
        Messaging.messaging().apnsToken = deviceToken
        
        super.application(application,
                          didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    }
    
        var customChannel : FlutterMethodChannel!

    private func initCustomInvoke(){
        /* create a method for get data from call function*/
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        customChannel = FlutterMethodChannel(name: "com.auria/custom",binaryMessenger: controller.binaryMessenger)
        customChannel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
            
            print("FlutterMethodCall_ios ",call.method)
            // This method is invoked on the UI thread.
            if(call.method == "iosAppLogin"){
                self?.loginWithApple()
            }else {
                result(FlutterMethodNotImplemented)
                return
            }
            
        })
        
        /* close call function code */
        
    }
    
    /* create a function for receive apple login */
    
    private func loginWithApple() {
        
            // 1
            let request = ASAuthorizationAppleIDProvider().createRequest()
            // 2
            request.requestedScopes = [.fullName, .email]
            
            // 3
            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            
            authorizationController.delegate = self
            
            authorizationController.performRequests()
            
    }
    
    /* close apple login data receiver function */
    
    
    func presentationAnchor(for controller:


ASAuthorizationController) -> ASPresentationAnchor {
        return self.window
    }
    
    func authorizationController(controller:
ASAuthorizationController, didCompleteWithError error: Error){
                customChannel.invokeMethod("iosAppLogin", arguments: ["status":"error","message":error.localizedDescription])
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization){
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            
            // Create an account as per your requirement
            
            let appleId = appleIDCredential.user
            
            let firstName = appleIDCredential.fullName?.givenName
            
            let lastName = appleIDCredential.fullName?.familyName
            
            let email = appleIDCredential.email
            
            //Write your code
            
            var arg = ["status":"success","appleId":appleId,"firstName":firstName,"lastName":lastName,"email":email] as [String : Any]
            
            customChannel.invokeMethod("iosAppLogin", arguments: arg)
            
        }
        
    }
}
