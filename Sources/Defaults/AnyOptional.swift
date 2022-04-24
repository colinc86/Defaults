//
//  AnyOptional.swift
//  Defaults
//
//  Created by Colin Campbell on 4/22/22.
//

import Foundation

internal protocol AnyOptional {
  
  /// Whether or not the receiver represents a nil value.
  var isNil: Bool { get }
  
}
