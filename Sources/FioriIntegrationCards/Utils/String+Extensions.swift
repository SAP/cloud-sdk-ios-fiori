//
//  String+Extensions.swift
//  AnyCodable
//
//  Created by Ma, Xiao on 2/17/20.
//

import Foundation

extension String {
    
    var isValidURL: Bool {
        guard let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else {
            return false
        }
        
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            // it is a link, if the match covers the whole string
            return match.range.length == self.utf16.count
        } else {
            return false
        }
    }
    
    public func asURL() throws -> URL {
        guard let url = URL(string: self) else {
            throw NetworkError.invalidURL(url: self)
        }
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
    
    func validDirectory() -> String {
        let characters = Array(self)
        if let firstCharacter = characters.first, firstCharacter == "." {
            return String(characters.dropFirst())
        }
        return self
    }
    
    func validIcon() -> String? {
        guard let key = self.iconName() else {
            return nil
        }
        guard let value = IconLibrary.icons[key] else {
            return nil
        }
        guard let scalar = UnicodeScalar(value) else {
            return nil
        }
        
        let output = String(scalar)
        return output
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
