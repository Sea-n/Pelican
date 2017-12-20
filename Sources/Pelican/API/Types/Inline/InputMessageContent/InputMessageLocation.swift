//
//  InputMessageLocation.swift
//  Pelican
//
//  Created by Ido Constantine on 19/12/2017.
//

import Foundation

/**
Represents the content of a location message to be sent as the result of an inline query.
*/
final public class InputMessageContent_Location: InputMessageContent, Codable {
	
	/// Latitude of the venue in degrees.
	public var latitude: Float
	
	/// Longitude of the venue in degrees.
	public var longitude: Float
	
	init(latitude: Float, longitude: Float) {
		self.latitude = latitude
		self.longitude = longitude
	}
}
