//
//  Request.swift
//  Pelican
//
//  Created by Ido Constantine on 16/12/2017.
//

import Foundation

/**
A delegate designed to allow a Session to more directly request from the Telegram APIs without redeclarations or
*/
protocol SessionRequests {
	var tag: SessionTag { get }
	
}
