
import Foundation
import Vapor
import FluentProvider




/** Used for a result/your response of an inline query.
 */
public protocol InlineResult {
  
}


/**

public struct InlineResultContact: InlineResult {
	public var storage = Storage()
	
  public var type: String = "contact"        // Type of the result being given.
  public var id: String                      // Unique Identifier for the result, 1-64 bytes.
  public var content: InputMessageContent?   // Content of the message to be sent.
  public var replyMarkup: MarkupInline?      // Inline keyboard attached to the message
  
  public var phoneNumber: String             // Contact's phone number.
  public var firstName: String               // Contact's first name.
  public var lastName: String?               //  Contact's last name.
  var thumb: InlineThumbnail?         // Inline thumbnail type.
  
  // NodeRepresentable conforming methods
  public init(row: Row) throws {
    type = try row.get("type")
    id = try row.get("id")
    
    if let subContent = node["input_message_content"] {
      self.content = try .init(node: subContent, in: context) as InputMessageContent }
    
    replyMarkup = try row.get("reply_markup")
    
    // Non-core extractions
    phoneNumber = try row.get("phone_number")
    firstName = try row.get("first_name")
    lastName = try row.get("last_name")
    thumb = try InlineThumbnail(node: node, in: TGContext.response)
    
  }
  
  public func makeNode() throws -> Node {
    var keys: [String:NodeRepresentable] = [
      "type": type,
      "id": id,
      "phone_number": phoneNumber,
      "first_name": firstName]
    
    // Optional keys
    if content != nil { keys["input_message_content"] = content }
    if replyMarkup != nil { keys["reply_markup"] = replyMarkup }
    if lastName != nil { keys["input_message_content"] = lastName }
    //if thumb != nil { keys["reply_markup"] = thumb }
    
    return try Node(node: keys)
  }
  
  public func makeNode(context: Context) throws -> Node {
    return try self.makeNode()
  }
}


public struct InlineResultLocation: InlineResult {
  var type: String = "location"       // Type of the result being given.
  public var id: String                      // Unique Identifier for the result, 1-64 bytes.
  public var content: InputMessageContent?   // Content of the message to be sent.
  public var replyMarkup: MarkupInline?      // Inline keyboard attached to the message
  
  public var title: String                   // Location title.
  public var latitude: Float                 // Location latitude in degrees.
  public var longitude: Float                // Location longitude in degrees.
  var thumb: InlineThumbnail?         // Inline thumbnail type.
  
  // NodeRepresentable conforming methods
  public init(row: Row) throws {
    type = try row.get("type")
    id = try row.get("id")
    
    if let subContent = node["input_message_content"] {
      self.content = try .init(node: subContent, in: context) as InputMessageContent }
    
    replyMarkup = try row.get("reply_markup")
    
    // Non-core extractions
    title = try row.get("title")
    latitude = try row.get("latitude")
    longitude = try row.get("longitude")
    thumb = try InlineThumbnail(node: node, in: TGContext.response)
  }
  
  public func makeNode() throws -> Node {
    var keys: [String:NodeRepresentable] = [
      "type": type,
      "id": id,
      "title": title,
      "latitude": latitude,
      "longitude": longitude]
    
    // Optional keys
    if content != nil { keys["input_message_content"] = content }
    if replyMarkup != nil { keys["reply_markup"] = replyMarkup }
    //if thumb != nil { keys["reply_markup"] = thumb }
    
    return try Node(node: keys)
  }
  
  public func makeNode(context: Context) throws -> Node {
    return try self.makeNode()
  }
}

public struct InlineResultVenue: InlineResult {
  var type: String = "venue"          // Type of the result being given.
  public var id: String                      // Unique Identifier for the result, 1-64 bytes.
  public var content: InputMessageContent?   // Content of the message to be sent.
  public var replyMarkup: MarkupInline?      // Inline keyboard attached to the message
  
  public var title: String                   // Location title.
  public var address: String                 // Address of the venue.
  public var latitude: Float                 // Location latitude in degrees.
  public var longitude: Float                // Location longitude in degrees.
  public var foursquareID: String?           // Foursquare identifier of the venue if know.
  var thumb: InlineThumbnail?         // Inline thumbnail type.
  
  // NodeRepresentable conforming methods
  public init(row: Row) throws {
    type = try row.get("type")
    id = try row.get("id")
    
    if let subContent = node["input_message_content"] {
      self.content = try .init(node: subContent, in: context) as InputMessageContent }
    
    replyMarkup = try row.get("reply_markup")
    
    // Non-core extractions
    title = try row.get("title")
    address = try row.get("address")
    latitude = try row.get("latitude")
    longitude = try row.get("longitude")
    foursquareID = try row.get("foursquare_id")
    thumb = try InlineThumbnail(node: node, in: TGContext.response)
    
  }
  
  public func makeNode() throws -> Node {
    var keys: [String:NodeRepresentable] = [
      "type": type,
      "id": id,
      "title": title,
      "address": address,
      "latitude": latitude,
      "longitude": longitude]
    
    // Optional keys
    if content != nil { keys["input_message_content"] = content }
    if replyMarkup != nil { keys["reply_markup"] = replyMarkup }
    if foursquareID != nil { keys["foursquare_id"] = foursquareID }
    //if thumb != nil { keys["reply_markup"] = thumb }
    
    return try Node(node: keys)
  }
  
  public func makeNode(context: Context) throws -> Node {
    return try self.makeNode()
  }
}

public struct InlineResultGame: InlineResult {
  var type: String = "game"           // Type of the result being given.
  public var id: String                      // Unique Identifier for the result, 1-64 bytes.
  public var replyMarkup: MarkupInline?      // Inline keyboard attached to the message
  public var name: String                    // Short name of the game
  
  // NodeRepresentable conforming methods
  public init(row: Row) throws {
    type = try row.get("type")
    id = try row.get("id")
    replyMarkup = try row.get("reply_markup")
    name = try row.get("game_short_name")
    
  }
  
  public func makeNode() throws -> Node {
    var keys: [String:NodeRepresentable] = [
      "type": type,
      "id": id,
      "game_short_name": name]
    
    // Optional keys
    if replyMarkup != nil { keys["reply_markup"] = replyMarkup }
    return try Node(node: keys)
  }
  
  public func makeNode(context: Context) throws -> Node {
    return try self.makeNode()
  }
}



enum InlineResultError: String, Error {
  case idNotFound = "ID not found during node initialisation."
  
}



 // makeNode() currently makes no effort to divide content based on whether it's cached or not.
 // Use getQuery() instead.
 
 /** Represents either a link to a MP3 audio file stored on the Telegram servers, or an external URL link to one. */
 struct InlineResultAudio: InlineResult {
 var type: String = "audio"          // Type of the result being given.
 var id: String                      // Unique Identifier for the result, 1-64 bytes.
 var content: InputMessageContent?   // Content of the message to be sent.
 var replyMarkup: MarkupInline?      // Inline keyboard attached to the message
 
 var url: String // Identifier/URL depending on the above.
 var caption: String? // Caption, 0-200 characters.
 
 // Non-cached types
 var title: String? // Title.
 var performer: String?  // Performer.
 var duration: Int? // Audio duration in seconds.
 
 // NodeRepresentable conforming methods
 init(node: Node, in context: Context) throws {
 type = try row.get("file_id")
 id = try row.get("duration")
 if let subContent = node["input_message_content"] {
 self.content = try .init(node: subContent, in: context) as InputMessageContent }
 replyMarkup = try row.get("reply_markup")
 
 }
 
 func makeNode() throws -> Node {
 var keys: [String:NodeRepresentable] = [
 "type": type,
 "id": id]
 
 // Optional keys
 if content != nil { keys["input_message_content"] = content }
 if replyMarkup != nil { keys["reply_markup"] = replyMarkup }
 
 return try Node(node: keys)
 }
 
 func makeNode(context: Context) throws -> Node {
 return try self.makeNode()
 }
 }
 
 /** Represents either a link to a file stored on the Telegram servers, or an external URL link to one.  If sent using an external link, only .PDF and .ZIP files are supported. */
 struct InlineResultDocument: InlineResult {
 var type: String = "document"       // Type of the result being given.
 var id: String                      // Unique Identifier for the result, 1-64 bytes.
 var content: InputMessageContent?   // Content of the message to be sent.
 var replyMarkup: MarkupInline?      // Inline keyboard attached to the message
 
 var url: String // Identifier/URL depending on the above.
 var title: String // Title.
 var caption: String? // Caption, 0-200 characters.
 var description: String? // Short description of the result.
 
 // Non-cached types
 var mimeType: String? // Mime type of the content of the file, either “application/pdf” or “application/zip”.  Not optional for un-cached.
 var thumb: InlineThumbnail? // URL of the thumbbail for the result (JPEG only)
 
 // NodeRepresentable conforming methods
 init(node: Node, in context: Context) throws {
 type = try row.get("file_id")
 id = try row.get("duration")
 if let subContent = node["input_message_content"] {
 self.content = try .init(node: subContent, in: context) as InputMessageContent }
 replyMarkup = try row.get("reply_markup")
 
 }
 
 func makeNode() throws -> Node {
 var keys: [String:NodeRepresentable] = [
 "type": type,
 "id": id]
 
 // Optional keys
 if content != nil { keys["input_message_content"] = content }
 if replyMarkup != nil { keys["reply_markup"] = replyMarkup }
 
 return try Node(node: keys)
 }
 
 func makeNode(context: Context) throws -> Node {
 return try self.makeNode()
 }
 }
 
 /** Represents either a link to an animated GIF stored on the Telegram servers, or an external URL link to one. */
 struct InlineResultGIF: InlineResult {
 var type: String = "gif"            // Type of the result being given.
 var id: String                      // Unique Identifier for the result, 1-64 bytes.
 var content: InputMessageContent?   // Content of the message to be sent.
 var replyMarkup: MarkupInline?      // Inline keyboard attached to the message
 
 var url: String // Identifier/URL depending on the above.
 var title: String? // Title.
 var caption: String? // Caption, 0-200 characters.
 var width: Int? // Width of the GIF.
 var height: Int? // Height of the GIF.
 var thumbUrl: String? // Not optional for non-cached types.  URL of the statis thumbnail for the result (JPEG or GIF)
 
 // NodeRepresentable conforming methods
 init(node: Node, in context: Context) throws {
 type = try row.get("file_id")
 id = try row.get("duration")
 if let subContent = node["input_message_content"] {
 self.content = try .init(node: subContent, in: context) as InputMessageContent }
 replyMarkup = try row.get("reply_markup")
 }
 
 func makeNode() throws -> Node {
 var keys: [String:NodeRepresentable] = [
 "type": type,
 "id": id]
 
 // Optional keys
 if content != nil { keys["input_message_content"] = content }
 if replyMarkup != nil { keys["reply_markup"] = replyMarkup }
 
 return try Node(node: keys)
 }
 
 func makeNode(context: Context) throws -> Node {
 return try self.makeNode()
 }
 }
 
 
 /** Represents either a link to a video animation (H.264/MPEG-4 AVC video without sound) stored on the Telegram servers, or an external URL link to one. */
 struct InlineResultMpeg4GIF: InlineResult {
 var type: String = "mpeg4_gif"      // Type of the result being given.
 var id: String                      // Unique Identifier for the result, 1-64 bytes.
 var content: InputMessageContent?   // Content of the message to be sent.
 var replyMarkup: MarkupInline?      // Inline keyboard attached to the message
 
 var url: String // Identifier/URL depending on the above.
 var title: String? // Title.
 var caption: String? // Caption, 0-200 characters.
 
 var thumb: InlineThumbnail
 
 // NodeRepresentable conforming methods
 init(node: Node, in context: Context) throws {
 type = try row.get("file_id")
 id = try row.get("duration")
 if let subContent = node["input_message_content"] {
 self.content = try .init(node: subContent, in: context) as InputMessageContent }
 replyMarkup = try row.get("reply_markup")
 
 }
 
 func makeNode() throws -> Node {
 var keys: [String:NodeRepresentable] = [
 "type": type,
 "id": id]
 
 // Optional keys
 if content != nil { keys["input_message_content"] = content }
 if replyMarkup != nil { keys["reply_markup"] = replyMarkup }
 
 return try Node(node: keys)
 }
 
 func makeNode(context: Context) throws -> Node {
 return try self.makeNode()
 }
 
 }
 
 /** Represents either a link to a photo stored on the Telegram servers, or an external URL link to one. */
 struct InlineResultPhoto: InlineResult {
 var type: String = "photo"          // Type of the result being given.
 var id: String                      // Unique Identifier for the result, 1-64 bytes.
 var content: InputMessageContent?   // Content of the message to be sent.
 var replyMarkup: MarkupInline?      // Inline keyboard attached to the message
 
 var url: String // Either a valid identifier for the audio file if cached, or a URL if not.
 
 var title: String? // Title.
 var caption: String? // Caption, 0-200 characters.
 var description: String? // Short description of the result.
 var thumb: InlineThumbnail
 
 // NodeRepresentable conforming methods
 init(node: Node, in context: Context) throws {
 type = try row.get("file_id")
 id = try row.get("duration")
 if let subContent = node["input_message_content"] {
 self.content = try .init(node: subContent, in: context) as InputMessageContent }
 replyMarkup = try row.get("reply_markup")
 
 }
 
 func makeNode() throws -> Node {
 var keys: [String:NodeRepresentable] = [
 "type": type,
 "id": id]
 
 // Optional keys
 if content != nil { keys["input_message_content"] = content }
 if replyMarkup != nil { keys["reply_markup"] = replyMarkup }
 
 return try Node(node: keys)
 }
 
 func makeNode(context: Context) throws -> Node {
 return try self.makeNode()
 }
 }
 
 
 /** Represents a link to a sticker stored on the Telegram servers.  Stickers can only ever be cached. */
 struct InlineResultSticker: InlineResult {
 var type: String = "sticker"        // Type of the result being given.
 var id: String                      // Unique Identifier for the result, 1-64 bytes.
 var content: InputMessageContent?   // Content of the message to be sent.
 var replyMarkup: MarkupInline?      // Inline keyboard attached to the message
 
 var isCached: Bool = true // Determines whether the given audio result is cached (stored on Telegram's servers) or not.
 var fileLink: String // Either a valid identifier for the audio file if cached, or a URL if not.
 
 // NodeRepresentable conforming methods
 init(node: Node, in context: Context) throws {
 type = try row.get("file_id")
 id = try row.get("duration")
 if let subContent = node["input_message_content"] {
 self.content = try .init(node: subContent, in: context) as InputMessageContent }
 replyMarkup = try row.get("reply_markup")
 
 }
 
 func makeNode() throws -> Node {
 var keys: [String:NodeRepresentable] = [
 "type": type,
 "id": id]
 
 // Optional keys
 if content != nil { keys["input_message_content"] = content }
 if replyMarkup != nil { keys["reply_markup"] = replyMarkup }
 
 return try Node(node: keys)
 }
 
 func makeNode(context: Context) throws -> Node {
 return try self.makeNode()
 }
 }
 
 /** Represents either a link to a video stored on the Telegram servers, or an external URL link to a page containing an embedded video player or video file. */
 struct InlineResultVideo: InlineResult {
 var type: String = "video"          // Type of the result being given.
 var id: String                      // Unique Identifier for the result, 1-64 bytes.
 var content: InputMessageContent?   // Content of the message to be sent.
 var replyMarkup: MarkupInline?      // Inline keyboard attached to the message
 
 var isCached: Bool // Determines whether the given audio result is cached (stored on Telegram's servers) or not.
 var fileLink: String // Either a valid identifier for the audio file if cached, or a URL if not.
 
 var title: String? // Title.
 var caption: String? // Caption, 0-200 characters.
 
 var mimeType: String // Mime type of the content of the file, either “text/html" or "video/mp4"
 var thumb: InlineThumbnail // URL of the thumbbail for the result.
 var duration: Int? // Video duration in seconds.
 
 // NodeRepresentable conforming methods
 init(node: Node, in context: Context) throws {
 type = try row.get("file_id")
 id = try row.get("duration")
 if let subContent = node["input_message_content"] {
 self.content = try .init(node: subContent, in: context) as InputMessageContent }
 replyMarkup = try row.get("reply_markup")
 
 }
 
 func makeNode() throws -> Node {
 var keys: [String:NodeRepresentable] = [
 "type": type,
 "id": id]
 
 // Optional keys
 if content != nil { keys["input_message_content"] = content }
 if replyMarkup != nil { keys["reply_markup"] = replyMarkup }
 
 return try Node(node: keys)
 }
 
 func makeNode(context: Context) throws -> Node {
 return try self.makeNode()
 }
 }
 
 /** Represents either a link to a voice message (in an .ogg container encoded with OPUS) stored on the Telegram servers, or an external URL link to one. */
 struct InlineResultVoice: InlineResult {
 var type: String = "voice"          // Type of the result being given.
 var id: String                      // Unique Identifier for the result, 1-64 bytes.
 var content: InputMessageContent?   // Content of the message to be sent.
 var replyMarkup: MarkupInline?      // Inline keyboard attached to the message
 
 var isCached: Bool // Determines whether the given audio result is cached (stored on Telegram's servers) or not.
 var fileLink: String // Either a valid identifier for the audio file if cached, or a URL if not.
 
 var title: String // Title.
 var caption: String? // Caption, 0-200 characters.
 var duration: Int? // Audio duration in seconds.
 
 // NodeRepresentable conforming methods
 init(node: Node, in context: Context) throws {
 type = try row.get("file_id")
 id = try row.get("duration")
 if let subContent = node["input_message_content"] {
 self.content = try .init(node: subContent, in: context) as InputMessageContent }
 replyMarkup = try row.get("reply_markup")
 }
 
 func makeNode() throws -> Node {
 var keys: [String:NodeRepresentable] = [
 "type": type,
 "id": id]
 
 // Optional keys
 if content != nil { keys["input_message_content"] = content }
 if replyMarkup != nil { keys["reply_markup"] = replyMarkup }
 
 return try Node(node: keys)
 }
 
 func makeNode(context: Context) throws -> Node {
 return try self.makeNode()
 }
 }
 
 */















