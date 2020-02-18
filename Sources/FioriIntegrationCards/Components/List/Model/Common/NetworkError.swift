//
//  NetworkError.swift
//  AnyCodable
//
//  Created by Ma, Xiao on 2/17/20.
//

import Foundation

public enum NetworkError: Error {
    case invalidURL(url: String)
    case badAccess
    case noData
}
