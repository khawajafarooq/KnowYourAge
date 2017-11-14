//
//  AppCommon.swift
//  KnowYourAge
//
//  Created by GIB on 11/14/17.
//  Copyright © 2017 Xmen. All rights reserved.
//

import UIKit

// current year of Date extension
extension Date {
    static func currentYear() -> Int {
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        return year
    }
}

// length of Int extension
extension Int {
    func length() -> Int {
        return "\(self)".characters.count
    }
}

// displaying alert from Error extension
extension Error {
    
    func alert() {
        
        let alertController = UIAlertController(title: "Oops ❗️", message: "\(self)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}

