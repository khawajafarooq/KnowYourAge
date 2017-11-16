//
//  AppError.swift
//  KnowYourAge
//
//  Created by GIB on 11/14/17.
//  Copyright © 2017 Xmen. All rights reserved.
//

import Foundation

enum YearError: Error {
    case empty
    case invalidNumber
    case invalidBirthYear
    case invalidYear
}

extension YearError: CustomStringConvertible {
    
    var description: String {
        switch self {
        case .empty: return "You didn't provide anything"
        case .invalidNumber: return "You didn't provide a valid number"
        case .invalidBirthYear: return "You can't be born in the future 🤔"
        case .invalidYear: return "You didn't provide a valid 4 digits year such as 1989"
        }
    }
}

