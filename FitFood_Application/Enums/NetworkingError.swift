//
//  NetworkingError.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 04.06.2023.
//

import Foundation

public enum NetworkingError: Error {
    case noInternet
    case invalidUrl
    case invalidData
    case invalidSession
    case invalidContext
    case statusCode(Int)
    case apiError(message: String)
}
