//
//  watchOSConnectivity.swift
//  WatchDemoWA Watch App
//
//  Created by Pavlo Antoniuk on 08.12.2024.
//

import Foundation
import WatchConnectivity

class watchOSConnectivity: NSObject, WCSessionDelegate {
    static let shared = watchOSConnectivity()
    
    var counterUpdated: ((Int) -> Void)?
    
    override init() {
        super.init()
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        if let newCounter = message["counter"] as? Int {
            counterUpdated?(newCounter)
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        Task { @MainActor in
            if session.activationState == .activated {
                print("🟢 Watch app connected")
            }
        }
    }
    
    func sendInt(_ value: Int) {
        WCSession.default.sendMessage(["counter" : value], replyHandler: nil)
    }
}
