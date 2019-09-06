//
//  UserDefaultsManager.swift
//  QuranApp
//
//  Created by Bashir Sentongo on 06/09/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

class UserDefaultsManager: NSObject {
    
    class var userId: String? {
        get {
            return self.retrieveWithKey(.userId)
        }
        set {
            self.store(key: .userId, value: newValue)
        }
    }
    
    class var introShown: Bool {
        get {
            return (self.retrieveWithKey(.introShown) != nil)
        }
        set {
            self.store(key: .introShown, value: (newValue) ? "Y" : nil)
        }
    }
    
    //MARK:- user defaults
    
    private class func store(key pKey: Keys, value pValue: String?) {
        let theKey = pKey.rawValue
        if let newValue = pValue {
            UserDefaults.standard.set(newValue, forKey: theKey)
        } else {
            UserDefaults.standard.removeObject(forKey: theKey)
        }
        UserDefaults.standard.synchronize()
    }
    
    private class func retrieveWithKey(_ pKey: Keys) -> String? {
        return UserDefaults.standard.object(forKey: pKey.rawValue) as? String
    }
    
        enum Keys: String {
        case userId
        case introShown
    }
}
