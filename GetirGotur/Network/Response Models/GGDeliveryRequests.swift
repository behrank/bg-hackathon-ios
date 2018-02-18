//
//  GGDeliveryRequests.swift
//
//  Created by Behran Kankul on 18.02.2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import Marshal

public struct GGDeliveryRequests: Unmarshaling {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let selectedDate2 = "selectedDate2"
    static let requestPrice = "requestPrice"
    static let requestType = "requestType"
    static let address = "address"
    static let cargoType = "cargoType"
    static let lat = "lat"
    static let priceType = "priceType"
    static let requestTitle = "requestTitle"
    static let lon = "lon"
    static let requestedCountryId = "requestedCountryId"
    static let weight = "weight"
    static let senderUserId = "senderUserId"
    static let selectedDate = "selectedDate"
    static let requestId = "requestId"
  }

  // MARK: Properties
  public var selectedDate2: String?
  public var requestPrice: String?
  public var requestType: Int?
  public var address: String?
  public var cargoType: Int?
  public var lat: Float?
  public var priceType: Int?
  public var requestTitle: String?
  public var lon: Float?
  public var requestedCountryId: Int?
  public var weight: String?
  public var senderUserId: Int?
  public var selectedDate: String?
  public var requestId: Int?

  // MARK: Marshal Initializers

  /// Map a JSON object to this class using Marshal.
  ///
  /// - parameter object: A mapping from ObjectMapper
  public init(object: MarshaledObject) {
    selectedDate2 = try? object.value(for: SerializationKeys.selectedDate2)
    requestPrice = try? object.value(for: SerializationKeys.requestPrice)
    requestType = try? object.value(for: SerializationKeys.requestType)
    address = try? object.value(for: SerializationKeys.address)
    cargoType = try? object.value(for: SerializationKeys.cargoType)
    lat = try? object.value(for: SerializationKeys.lat)
    priceType = try? object.value(for: SerializationKeys.priceType)
    requestTitle = try? object.value(for: SerializationKeys.requestTitle)
    lon = try? object.value(for: SerializationKeys.lon)
    requestedCountryId = try? object.value(for: SerializationKeys.requestedCountryId)
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
    if let value = selectedDate2 { dictionary[SerializationKeys.selectedDate2] = value }
    if let value = requestPrice { dictionary[SerializationKeys.requestPrice] = value }
    if let value = requestType { dictionary[SerializationKeys.requestType] = value }
    if let value = address { dictionary[SerializationKeys.address] = value }
    if let value = cargoType { dictionary[SerializationKeys.cargoType] = value }
    if let value = lat { dictionary[SerializationKeys.lat] = value }
    if let value = priceType { dictionary[SerializationKeys.priceType] = value }
    if let value = requestTitle { dictionary[SerializationKeys.requestTitle] = value }
    if let value = lon { dictionary[SerializationKeys.lon] = value }
    if let value = requestedCountryId { dictionary[SerializationKeys.requestedCountryId] = value }
    if let value = weight { dictionary[SerializationKeys.weight] = value }
    if let value = senderUserId { dictionary[SerializationKeys.senderUserId] = value }
    if let value = selectedDate { dictionary[SerializationKeys.selectedDate] = value }
    if let value = requestId { dictionary[SerializationKeys.requestId] = value }
    return dictionary
  }

}
