//
//  iOSConnectivity.swift
//  DemoWA
//
//  Created by Pavlo Antoniuk on 08.12.2024.
//

import Foundation
import WatchConnectivity

class iOSConnectivity: NSObject, WCSessionDelegate {
    static let shared = iOSConnectivity()
    var counterUpdated: ((Int) -> Void)?
    
    override init() {
        super.init()
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        Task { @MainActor in
            if session.isWatchAppInstalled {
                print("🟠 Watch app installed")
            }
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        if let newCounter = message["counter"] as? Int {
            counterUpdated?(newCounter)
        }
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    func sendInt(_ value: Int) {
        WCSession.default.sendMessage(["counter" : value], replyHandler: nil)
    }
}
