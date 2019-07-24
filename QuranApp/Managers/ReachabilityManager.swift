//
//  ReachabilityManager.swift
//  QuranApp
//
//  Created by Bashir Sentongo on 21/05/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

final class ReachabilityManager: NSObject {
    
    let reachability = Reachability()!
    
    // Check for internet connection. Both Mobile and Wifi 
    func checkForInternetConnection(completion pCompletion: @escaping (Bool) -> Void) {
        reachability.whenReachable = { _ in
            switch self.reachability.connection {
            case .wifi:
                pCompletion(true)
            case .cellular:
                pCompletion(true)
            default:
                break
            }
        }
        self.reachability.whenUnreachable = { _ in
            pCompletion(false)
        }
        
        // Start notifier 
        do {
            try reachability.startNotifier()
        } catch {
            pCompletion(false)
        }
    }
    
    // Stop notifier
    deinit {
        reachability.stopNotifier()
    }
}
