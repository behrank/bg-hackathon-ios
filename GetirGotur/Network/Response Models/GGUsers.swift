//
//  GGUsers.swift
//
//  Created by Behran Kankul on 18.02.2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import Marshal

public struct GGUsers: Unmarshaling {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let deliveredRequestCount = "deliveredRequestCount"
    static let lastName = "last_name"
    static let deliveredCompletedCount = "deliveredCompletedCount"
    static let firstName = "first_name"
    static let avatarImg = "avatar_img"
    static let userId = "userId"
    static let deliveryRequestCount = "deliveryRequestCount"
    static let deliveryCompletedCount = "deliveryCompletedCount"
    static let favoritedCountries = "favoritedCountries"
  }

  // MARK: Properties
  public var deliveredRequestCount: Int?
  public var lastName: String?
  public var deliveredCompletedCount: Int?
  public var firstName: String?
  public var avatarImg: String?
  public var userId: Int?
  public var deliveryRequestCount: Int?
  public var deliveryCompletedCount: Int?
  public var favoritedCountries: [Int]?

  // MARK: Marshal Initializers

  /// Map a JSON object to this class using Marshal.
  ///
  /// - parameter object: A mapping from ObjectMapper
  public init(object: MarshaledObject) {
    deliveredRequestCount = try? object.value(for: SerializationKeys.deliveredRequestCount)
    lastName = try? object.value(for: SerializationKeys.lastName)
    deliveredCompletedCount = try? object.value(for: SerializationKeys.deliveredCompletedCount)
    firstName = try? object.value(for: SerializationKeys.firstName)
    avatarImg = try? object.value(for: SerializationKeys.avatarImg)
    userId = try? object.value(for: SerializationKeys.userId)
    deliveryRequestCount = try? object.value(for: SerializationKeys.deliveryRequestCount)
    deliveryCompletedCount = try? object.value(for: SerializationKeys.deliveryCompletedCount)
    favoritedCountries = try? object.value(for: SerializationKeys.favoritedCountries)
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = deliveredRequestCount { dictionary[SerializationKeys.deliveredRequestCount] = value }
    if let value = lastName { dictionary[SerializationKeys.lastName] = value }
    if let value = deliveredCompletedCount { dictionary[SerializationKeys.deliveredCompletedCount] = value }
    if let value = firstName { dictionary[SerializationKeys.firstName] = value }
    if let value = avatarImg { dictionary[SerializationKeys.avatarImg] = value }
    if let value = userId { dictionary[SerializationKeys.userId] = value }
    if let value = deliveryRequestCount { dictionary[SerializationKeys.deliveryRequestCount] = value }
    if let value = deliveryCompletedCount { dictionary[SerializationKeys.deliveryCompletedCount] = value }
    if let value = favoritedCountries { dictionary[SerializationKeys.favoritedCountries] = value }
    return dictionary
  }

}
