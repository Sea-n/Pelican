//
//  GameHighScore.swift
//  Pelican
//
//  Created by Ido Constantine on 31/08/2017.
//

import Foundation
import Vapor
import FluentProvider

/** This object represents one row of the high scores table for a game.
*/
final public class GameHighScore: Codable {
	
	/// The position in the high score table for the game.
	var position: Int
	
	/// The user who made the score entry.
	var user: User
	
	/// The score set.
	var score: Int
	

}
