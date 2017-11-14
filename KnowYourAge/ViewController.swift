//
//  ViewController.swift
//  KnowYourAge
//
//  Created by GIB on 11/14/17.
//  Copyright © 2017 Xmen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var validateButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Setup
    func setup() {
        validateButton.layer.cornerRadius = 5.0
    }
    
    // MARK: - Actions
    @IBAction func validateAction(_ sender: Any) {
        do {
            dismissKeyboard()
            resultLabel.text = ""
            let actualAge = try age(from: textField.text)
            resultLabel.text = "Your age is \(actualAge) 🤖"
        } catch {
            error.alert()
        }
    }
    
    @IBAction func dismiss(_ sender: UITextField) {
        dismissKeyboard()
    }
}

// MARK: - Helper function(s)
extension ViewController {
    
    func age(from year: String?) throws -> Int {
        
        guard let birthYear = year, !birthYear.isEmpty else {
            throw YearError.empty
        }
        
        guard let validYear = Int(birthYear), validYear > 0 else {
            throw YearError.invalidNumber
        }
        
        guard validYear.length() == 4 else {
            throw YearError.invalidYear
        }
        
        guard validYear < Date.currentYear() else {
            throw YearError.invalidBirthYear
        }
        
        return Date.currentYear() - validYear
    }
    
    func dismissKeyboard() {
        textField.resignFirstResponder()
    }
}

