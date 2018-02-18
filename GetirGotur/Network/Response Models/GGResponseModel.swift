//
//  GGResponseModel.swift
//
//  Created by Behran Kankul on 18.02.2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import Marshal

public struct GGResponseModel: Unmarshaling {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let deliverOptions = "deliverOptions"
    static let deliveryRequests = "deliveryRequests"
    static let users = "users"
  }

  // MARK: Properties
  public var deliverOptions: [GGDeliverOptions]?
  public var deliveryRequests: [GGDeliveryRequests]?
  public var users: [GGUsers]?

  // MARK: Marshal Initializers

  /// Map a JSON object to this class using Marshal.
  ///
  /// - parameter object: A mapping from ObjectMapper
  public init(object: MarshaledObject) {
    deliverOptions = try? object.value(for: SerializationKeys.deliverOptions)
    deliveryRequests = try? object.value(for: SerializationKeys.deliveryRequests)
    users = try? object.value(for: SerializationKeys.users)
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = deliverOptions { dictionary[SerializationKeys.deliverOptions] = value.map { $0.dictionaryRepresentation() } }
    if let value = deliveryRequests { dictionary[SerializationKeys.deliveryRequests] = value.map { $0.dictionaryRepresentation() } }
    if let value = users { dictionary[SerializationKeys.users] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
