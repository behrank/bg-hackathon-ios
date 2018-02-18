//
//  GGDeliverOptions.swift
//
//  Created by Behran Kankul on 18.02.2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import Marshal

public struct GGDeliverOptions: Unmarshaling {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let note = "note"
    static let selectedDate2 = "selectedDate2"
    static let availableCategories = "availableCategories"
    static let targetCountry = "targetCountry"
    static let weight = "weight"
    static let senderUserId = "senderUserId"
    static let selectedDate = "selectedDate"
    static let requestId = "requestId"
  }

  // MARK: Properties
  public var note: String?
  public var selectedDate2: String?
  public var availableCategories: [Int]?
  public var targetCountry: Int?
  public var weight: String?
  public var senderUserId: Int?
  public var selectedDate: String?
  public var requestId: Int?

  // MARK: Marshal Initializers

  /// Map a JSON object to this class using Marshal.
  ///
  /// - parameter object: A mapping from ObjectMapper
  public init(object: MarshaledObject) {
    note = try? object.value(for: SerializationKeys.note)
    selectedDate2 = try? object.value(for: SerializationKeys.selectedDate2)
    availableCategories = try? object.value(for: SerializationKeys.availableCategories)
    targetCountry = try? object.value(for: SerializationKeys.targetCountry)
    weight = try? object.value(for: SerializationKeys.weight)
    senderUserId = try? object.value(for: SerializationKeys.senderUserId)
    selectedDate = try? object.value(for: SerializationKeys.selectedDate)
    requestId = try? object.value(for: SerializationKeys.requestId)
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = note { dictionary[SerializationKeys.note] = value }
    if let value = selectedDate2 { dictionary[SerializationKeys.selectedDate2] = value }
    if let value = availableCategories { dictionary[SerializationKeys.availableCategories] = value }
    if let value = targetCountry { dictionary[SerializationKeys.targetCountry] = value }
    if let value = weight { dictionary[SerializationKeys.weight] = value }
    if let value = senderUserId { dictionary[SerializationKeys.senderUserId] = value }
    if let value = selectedDate { dictionary[SerializationKeys.selectedDate] = value }
    if let value = requestId { dictionary[SerializationKeys.requestId] = value }
    return dictionary
  }

}
