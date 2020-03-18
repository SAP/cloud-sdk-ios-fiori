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

public class BaseCard<Template: Decodable, Content: Decodable>: Decodable, ObservableObject {
    
    public var objectWillChange: ObservableObjectPublisher = ObservableObjectPublisher()
    public var header: Header!
    public let content = CurrentValueSubject<Content?, Never>(nil)
    
    var template: Template!
    
    required public init(from decoder: Decoder) throws {
        content.receive(on: RunLoop.main)
        .sink(receiveValue: { _ in self.objectWillChange.send() })
        .store(in: &subscribers)
    }
    internal var subscribers = Set<AnyCancellable>()
}
