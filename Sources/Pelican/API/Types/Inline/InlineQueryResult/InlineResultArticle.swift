//
//  InlineResultArticle.swift
//  Pelican
//
//  Created by Ido Constantine on 19/12/2017.
//

import Foundation

/**
Represents a link to an article or web page.  This type is also ideal for setting the contents to a simple message, for sending messages to a chat.
*/
final public class InlineResultArticle: InlineResult, Codable {
	
	/// Type of the result being given.
	public var type: String = "article"
	
	/// Unique Identifier for the result, 1-64 bytes.
	public var tgID: String
	
	/// Content of the message to be sent.
	public var content: InputMessageContent
	
	/// Inline keyboard attached to the message
	public var replyMarkup: MarkupInline?
	
	/// TItle of the result.
	public var title: String
	
	/// URL of the result.
	public var url: String?
	
	/// Set as true if you don't want the URL to be shown in the message.
	public var hideUrl: Bool?
	
	/// Short description of the result.
	public var description: String?
	
	/// Inline thumbnail type.
	//var thumb: InlineThumbnail?
	
	
	public init(id: String, title: String, description: String, contents: String, markup: MarkupInline?) {
		self.tgID = id
		self.title = title
		self.content = InputMessageContent_Text(text: contents, parseMode: "", disableWebPreview: nil)
		self.replyMarkup = markup
		self.description = description
	}
	
	// NodeRepresentable conforming methods
	public init(row: Row) throws {
		type = try row.get("type")
		tgID = try row.get("id")
		content = try row.get("input_message_content")
		replyMarkup = try row.get("reply_markup")
		
		title = try row.get("title")
		url = try row.get("url")
		hideUrl = try row.get("hide_url")
		description = try row.get("description")
		//thumb = try row.get("thumb")
	}
	
	public func makeRow() throws -> Row {
		var row = Row()
		try row.set("type", type)
		try row.set("id", tgID)
		try row.set("input_message_content", content)
		try row.set("reply_markup", replyMarkup)
		
		try row.set("title", title)
		try row.set("url", url)
		try row.set("hide_url", hideUrl)
		try row.set("description", description)
		//try row.set("thumb", thumb)
		
		return row
	}
}
