//
//  BaseCard.swift
//  DevTest
//
//  Created by Stadelman, Stan on 1/23/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import Foundation
import AnyCodable
import Combine
import TinyNetworking

protocol JSONDataLoading {
    associatedtype Content: Decodable
    var data: Content { get set }
    func loadData()
}

extension JSONDataLoading where Content == JSONArray {
    
}

public class BaseCard<Template: Decodable, Content: Decodable>: Decodable, ObservableObject {
    
    public var objectWillChange: ObservableObjectPublisher = ObservableObjectPublisher()
    public var header: Header
    public var headerPub = CurrentValueSubject<Header?, Never>(nil)
    public let content = CurrentValueSubject<Content?, Never>(nil)
    
    var template: Template!
    
    required public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: HavingHeader.CodingKeys.self)
        header = try container.decode(Header.self, forKey: .header)
        
        Publishers.CombineLatest(headerPub, content)
        .sink(receiveValue: { [unowned self] _ in self.objectWillChange.send() })
        .store(in: &subscribers)
        
//        content.receive(on: RunLoop.main)
//        .sink(receiveValue: { [unowned self] _ in self.objectWillChange.send() })
//        .store(in: &subscribers)
    }
    
    internal var subscribers = Set<AnyCancellable>()
}
