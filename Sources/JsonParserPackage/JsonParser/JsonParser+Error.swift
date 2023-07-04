//
//  JsonParser+Error.swift
//  
//
//  Created by 黃筱崴 on 2023/6/21.
//

import Foundation

// MARK: - Error
extension JsonParser {
    
    enum ParseError: Error {
        case unvalidUrl
        case unknown
    }
}

// MARK: - LocalizedError
extension JsonParser.ParseError: LocalizedError {
    
    public var localizedDescription: String? {
        switch self {
        case .unvalidUrl:
            return "Parse unvalid url."
        default:
            return "Unknown error."
        }
    }
}
