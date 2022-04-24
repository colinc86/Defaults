//
//  UserDefaults+Extensions.swift
//  Defaults
//
//  Created by Colin Campbell on 3/31/22.
//

import Foundation

// MARK: RawRepresentable methods

extension UserDefaults {
  
  /// Sets the string value.
  func setRawValue<R: RawRepresentable>(_ value: R?, forKey key: String) where R.RawValue == String {
    set(value?.rawValue, forKey: key)
  }
  
  /// Gets the string value.
  func rawValue<R: RawRepresentable>(forKey key: String) -> R? where R.RawValue == String {
    guard let stringRepresentation = string(forKey: key) else {
      return nil
    }
    return R(rawValue: stringRepresentation)
  }
  
  /// Sets the integer value.
  func setRawValue<R: RawRepresentable>(_ value: R?, forKey key: String) where R.RawValue == Int {
    set(value?.rawValue, forKey: key)
  }
  
  /// Gets the integer value.
  func rawValue<R: RawRepresentable>(forKey key: String) -> R? where R.RawValue == Int {
    R(rawValue: integer(forKey: key))
  }
  
}

// MARK: Codable methods

extension UserDefaults {
  
  /// Sets the encodable value.
  func setEncodableValue<E: Encodable>(_ value: E?, forKey key: String) throws {
    if let value = value {
      set(try JSONEncoder().encode(value), forKey: key)
    }
    else {
      set(nil, forKey: key)
    }
  }
  
  /// Gets the decodable value.
  func decodableValue<D: Decodable>(forKey key: String) throws -> D? {
    guard let data = data(forKey: key) else {
      return nil
    }
    return try JSONDecoder().decode(D.self, from: data)
  }
  
}
