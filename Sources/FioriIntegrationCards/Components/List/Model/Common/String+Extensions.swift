//
//  String+Extensions.swift
//  AnyCodable
//
//  Created by Ma, Xiao on 2/17/20.
//

import Foundation

extension String {
    
    public func asURL() throws -> URL {
        guard let url = URL(string: self) else {
            throw NetworkError.invalidURL(url: self)
        }
        print(url.absoluteString)
        return url
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try self.asURL()
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return urlRequest
    }
    
    func trimmed() -> String? {
        if self.hasPrefix("{"), self.hasSuffix("}") {
            return nil
        }
        return self
    }
    
    func validPhoneNumber(number: String) -> String {
        let characterSet  = CharacterSet(charactersIn: "+0123456789").inverted
        var filtered: String!
        let inputString: Array = number.components(separatedBy: characterSet)
        filtered = inputString.joined()
        return filtered
    }
    
    func validIcon() -> String? {
        let map: [String: String] = [
            "sap-icon://desktop-mobile": "",
            "sap-icon://appointment-2": "",
            "sap-icon://my-view": "",
            "sap-icon://outgoing-call": ""
        ]
        
        return map[self]?.htmlToString
    }
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    
    var htmlToString: String {
        return htmlToAttributedString?.string ?? "??"
    }
    
    func iconName() -> String? {
        let separated = self.components(separatedBy: "//")
        return separated.last
    }
}
