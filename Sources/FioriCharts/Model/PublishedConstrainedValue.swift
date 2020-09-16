//
//  PublishedConstrainedValue.swift
//  
//
//  Created by Xu, Sheng on 9/9/20.
//

import Foundation
import Combine

/**
  A property wrapper combined both @ConstrainedValue and @Published
 
 ## Usage
 ```
 @PublishedConstrainedValue(0...10) public var width: CGFloat = 1
 ```
 */
@propertyWrapper
public struct PublishedConstrainedValue<Value: Strideable> {
    private var range: ClosedRange<Value>
    private var value: Value
    private let subject = PassthroughSubject<Value, Never>()
    
    init(wrappedValue: Value, _ range: ClosedRange<Value>) {
        self.range = range
        self.value = max(range.lowerBound, min(wrappedValue, range.upperBound))
    }
    
    /// The property that can be accessed with the `$` syntax and allows access to
    /// the `Publisher`
    public var projectedValue: AnyPublisher<Value, Never> {
        subject.eraseToAnyPublisher()
    }
    
    @available(*, unavailable, message: """
               @PublishedConstrainedValue is only available on properties of classes
               """)
    
    /// Allow wrappedValue to be specified to be unavailable within property wrapper types that have the static subscript
    /// ensuring that such property wrapper types could only be applied to instance properties of a class
    public var wrappedValue: Value {
        get { fatalError() }
        set { fatalError() } // swiftlint:disable:this unused_setter_value
    }
    
    /// Refer to SE-0258 property-wrappers
    /// Reference the enclosing 'self' in a wrapper type.
    /// Receives self as a parameter, along with key paths referencing the original wrapped property and the backing storage property.
    public static subscript<EnclosingSelf: ObservableObject>(
        _enclosingInstance object: EnclosingSelf,
        wrapped wrappedKeyPath: ReferenceWritableKeyPath<EnclosingSelf, Value>,
        storage storageKeyPath: ReferenceWritableKeyPath<EnclosingSelf, Self>
    ) -> Value where EnclosingSelf.ObjectWillChangePublisher == ObservableObjectPublisher {
        get {
            return object[keyPath: storageKeyPath].value
        }
        set {
            object.objectWillChange.send()

            let range = object[keyPath: storageKeyPath].range
            let tmpValue = max(min(newValue, range.upperBound), range.lowerBound)
            object[keyPath: storageKeyPath].value = tmpValue
            object[keyPath: storageKeyPath].subject.send(tmpValue)
        }
    }
}
