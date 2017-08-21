//
//  CacheError.swift
//  Pelican
//
//  Created by Ido Constantine on 21/08/2017.
//

import Foundation

// Errors related to update processing.  Might merge the two?
enum CacheError: String, Error {
	case BadBundle = "The cache path for Telegram could not be found.  Please ensure Public/ is a folder in your project directory."
	case WrongType = "The file could not be added because it has the wrong type."
	case LocalNotFound = "The local resource you attempted to upload could not be found or processed."
}
