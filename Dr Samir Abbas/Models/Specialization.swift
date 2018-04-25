//
//  Specialization.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 13/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//


import Foundation
import Alamofire

class Specialization: Codable {
    let success: Bool
    let type, text: String
    let data: DataClass
    
    init(success: Bool, type: String, text: String, data: DataClass) {
        self.success = success
        self.type = type
        self.text = text
        self.data = data
    }
}

class DataClass: Codable {
    let specializations: [SpecializationElement]
    
    init(specializations: [SpecializationElement]) {
        self.specializations = specializations
    }
}

class SpecializationElement: Codable {
    let id: Int
    var name: String
    let date, name_ar: String
    
    init(id: Int, name: String, date: String, name_ar : String) {
        self.id = id
        self.name = name
        self.date = date
        self.name_ar = name_ar
        
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
    func responseSpecialization(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Specialization>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}

// MARK: Convenience initializers

extension Specialization {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(Specialization.self, from: data)
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

extension DataClass {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(DataClass.self, from: data)
        self.init(specializations: me.specializations)
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

extension SpecializationElement {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(SpecializationElement.self, from: data)
        self.init(id: me.id, name: me.name, date: me.date, name_ar: me.name_ar)
        
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
