//
//  BookingSlot.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 19/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import Alamofire

class BookingSlot: Codable {
    let success: Bool?
    let type, text: String?
    let data: DataClassBooking?
    
    init(success: Bool?, type: String?, text: String?, data: DataClassBooking?) {
        self.success = success
        self.type = type
        self.text = text
        self.data = data
    }
}

class DataClassBooking: Codable {
    let slots: Slots?
    
    init(slots: Slots?) {
        self.slots = slots
    }
}

class Slots: Codable {
    let evening, morning, afternoon, night: [Afternoon]?
    
    enum CodingKeys: String, CodingKey {
        case evening = "Evening"
        case morning = "Morning"
        case afternoon = "Afternoon"
        case night = "Night"
    }
    
    init(evening: [Afternoon]?, morning: [Afternoon]?, afternoon: [Afternoon]?, night: [Afternoon]?) {
        self.evening = evening
        self.morning = morning
        self.afternoon = afternoon
        self.night = night
    }
}

class Afternoon: Codable {
    let id: Int?
    let scheduleID, startTime, endTime, intervals: String?
    let status, book: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case scheduleID = "schedule_id"
        case startTime = "start_time"
        case endTime = "end_time"
        case intervals, status, book
    }
    
    init(id: Int?, scheduleID: String?, startTime: String?, endTime: String?, intervals: String?, status: String?, book: String?) {
        self.id = id
        self.scheduleID = scheduleID
        self.startTime = startTime
        self.endTime = endTime
        self.intervals = intervals
        self.status = status
        self.book = book
    }
}

// MARK: - Alamofire response handlers

extension DataRequest {
    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
        return DataResponseSerializer { _, response, data, error in
            guard error == nil else { return .failure(error!) }
            
            guard let data = data else {
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
            }
            
            return Result { try JSONDecoder().decode(T.self, from: data) }
        }
    }
    
    @discardableResult
    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseBookingSlot(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<BookingSlot>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}

// MARK: Convenience initializers

extension BookingSlot {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(BookingSlot.self, from: data)
        self.init(success: me.success, type: me.type, text: me.text, data: me.data)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension DataClassBooking {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(DataClassBooking.self, from: data)
        self.init(slots: me.slots)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Slots {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(Slots.self, from: data)
        self.init(evening: me.evening, morning: me.morning, afternoon: me.afternoon, night: me.night)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Afternoon {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(Afternoon.self, from: data)
        self.init(id: me.id, scheduleID: me.scheduleID, startTime: me.startTime, endTime: me.endTime, intervals: me.intervals, status: me.status, book: me.book)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

