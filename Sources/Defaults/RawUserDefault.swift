//
//  RawUserDefault.swift
//  Defaults
//
//  Created by Colin Campbell on 4/22/22.
//

import Foundation

@propertyWrapper struct RawUserDefault<Value: RawRepresentable> where Value.RawValue == String {
  
  /// The default's wrapped value.
  var wrappedValue: Value {
    get {
      store.rawValue(forKey: key) ?? defaultValue
    }
    
    set {
      if let optional = newValue as? AnyOptional, optional.isNil {
        store.removeObject(forKey: key)
      }
      else {
        store.setRawValue(newValue, forKey: key)
      }
    }
  }
  
  // MARK: Private properties
  
  /// The default's key.
  private let key: String
  
  /// The default's default value.
  private let defaultValue: Value
  
  /// The store that the default is stored.
  private let store: UserDefaults
  
  // MARK: Initializers
  
  init(wrappedValue defaultValue: Value, _ key: String, store: UserDefaults? = nil) {
    self.defaultValue = defaultValue
    self.key = key
    self.store = store ?? .standard
  }
}

extension RawUserDefault where Value: ExpressibleByNilLiteral {
  init(_ key: String, store: UserDefaults? = nil) {
    self.init(wrappedValue: nil, key, store: store)
  }
}
