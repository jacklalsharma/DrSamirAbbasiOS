//
//  Doctors.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 13/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation

import Foundation
import Alamofire

class Doctors: Codable {
    let success: Bool
    let type, text: String
    let data: DataClassDoc
    
    init(success: Bool, type: String, text: String, data: DataClassDoc) {
        self.success = success
        self.type = type
        self.text = text
        self.data = data
    }
}

class DataClassDoc: Codable {
    var doctors: [Doctor]
    let paging: Paging
    
    init(doctors: [Doctor], paging: Paging) {
        self.doctors = doctors
        self.paging = paging
    }
}

class Doctor: Codable {
    let id: Int
    let speID, name, degree, experience: String
    let image, date: String
    let isAvailableToday: Bool
    let profilePictureURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case speID = "spe_id"
        case name, degree, experience, image, date
        case isAvailableToday = "is_available_today"
        case profilePictureURL = "profile_picture_url"
    }
    
    init(id: Int, speID: String, name: String, degree: String, experience: String, image: String, date: String, isAvailableToday: Bool, profilePictureURL: String) {
        self.id = id
        self.speID = speID
        self.name = name
        self.degree = degree
        self.experience = experience
        self.image = image
        self.date = date
        self.isAvailableToday = isAvailableToday
        self.profilePictureURL = profilePictureURL
    }
}

class Paging: Codable {
    let nextPageURL: String
    
    enum CodingKeys: String, CodingKey {
        case nextPageURL = "next_page_url"
    }
    
    init(nextPageURL: String) {
        self.nextPageURL = nextPageURL
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
    func responseDoctors(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Doctors>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}

// MARK: Convenience initializers

extension Doctors {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(Doctors.self, from: data)
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

extension DataClassDoc {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(DataClassDoc.self, from: data)
        self.init(doctors: me.doctors, paging: me.paging)
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

extension Doctor {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(Doctor.self, from: data)
        self.init(id: me.id, speID: me.speID, name: me.name, degree: me.degree, experience: me.experience, image: me.image, date: me.date, isAvailableToday: me.isAvailableToday, profilePictureURL: me.profilePictureURL)
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

extension Paging {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(Paging.self, from: data)
        self.init(nextPageURL: me.nextPageURL)
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
