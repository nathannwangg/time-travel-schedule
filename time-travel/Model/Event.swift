//
//  Event.swift
//  time-travel
//
//  Created by Nathan Wang on 9/16/24.
//

import Foundation

// Represent the JSON Structure returned by the API

// Utilize Swift's Codable protocol for serialization and deserialization

// Match the JSON output of the API

// Represents an event, holds Location
struct Event: Codable {
    var eventId: String
    var name: String
    var description: String
    var startTime: Int // Using Int to represent UNIX timestamp; convert to Date as needed
    var endTime: Int
    var locations: [Location]
    var eventType: String
    var points: Int
    var isAsync: Bool
    var mapImageUrl: String?
}

// Represents a location
struct Location: Codable {
    let description: String
    let tags: [String]
    var latitude: Double
    var longitude: Double
}

// Top-level container for decoding the API response containing a list of events
struct EventsResponse: Codable {
    var events: [Event]
}

