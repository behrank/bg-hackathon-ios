//
//  GGMyRequests.swift
//
//  Created by Behran Kankul on 18.02.2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import Marshal

public struct GGMyRequests: Unmarshaling {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let status = "status"
    static let requestType = "requestType"
    static let requestTitle = "requestTitle"
    static let requestPrice = "requestPrice"
    static let targetCountry = "targetCountry"
    static let weight = "weight"
    static let senderUserId = "senderUserId"
    static let selectedDate = "selectedDate"
    static let priceType = "priceType"
    static let requestId = "requestId"
  }

  // MARK: Properties
  public var status: Int?
  public var requestType: Int?
  public var requestTitle: String?
  public var requestPrice: String?
  public var targetCountry: Int?
  public var weight: String?
  public var senderUserId: Int?
  public var selectedDate: String?
  public var priceType: Int?
  public var requestId: Int?

  // MARK: Marshal Initializers

  /// Map a JSON object to this class using Marshal.
  ///
  /// - parameter object: A mapping from ObjectMapper
  public init(object: MarshaledObject) {
    status = try? object.value(for: SerializationKeys.status)
    requestType = try? object.value(for: SerializationKeys.requestType)
    requestTitle = try? object.value(for: SerializationKeys.requestTitle)
    requestPrice = try? object.value(for: SerializationKeys.requestPrice)
    targetCountry = try? object.value(for: SerializationKeys.targetCountry)
    weight = try? object.value(for: SerializationKeys.weight)
    senderUserId = try? object.value(for: SerializationKeys.senderUserId)
    selectedDate = try? object.value(for: SerializationKeys.selectedDate)
    priceType = try? object.value(for: SerializationKeys.priceType)
    requestId = try? object.value(for: SerializationKeys.requestId)
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = requestType { dictionary[SerializationKeys.requestType] = value }
    if let value = requestTitle { dictionary[SerializationKeys.requestTitle] = value }
    if let value = requestPrice { dictionary[SerializationKeys.requestPrice] = value }
    if let value = targetCountry { dictionary[SerializationKeys.targetCountry] = value }
    if let value = weight { dictionary[SerializationKeys.weight] = value }
    if let value = senderUserId { dictionary[SerializationKeys.senderUserId] = value }
    if let value = selectedDate { dictionary[SerializationKeys.selectedDate] = value }
    if let value = priceType { dictionary[SerializationKeys.priceType] = value }
    if let value = requestId { dictionary[SerializationKeys.requestId] = value }
    return dictionary
  }

}
