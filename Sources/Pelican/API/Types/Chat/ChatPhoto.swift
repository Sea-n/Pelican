//
//  ChatPhoto.swift
//  Pelican
//
//  Created by Ido Constantine on 19/12/2017.
//

import Foundation
import Vapor

public class ChatPhoto: Codable {
	
	/// Unique file identifier of small (160x160) chat photo. This file_id can be used only for photo download.
	var smallFileID: String
	
	/// Unique file identifier of big (640x640) chat photo. This file_id can be used only for photo download.
	var bigFileID: String
	
	init(smallFileID: String, bigFileID: String) {
		self.smallFileID = smallFileID
		self.bigFileID = bigFileID
	}
	
}
