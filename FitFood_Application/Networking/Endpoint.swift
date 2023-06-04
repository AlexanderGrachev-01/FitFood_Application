//
//  Endpoint.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 04.06.2023.
//

import Alamofire
import Foundation

class Endpoint<Response> {
    let method: HTTPMethod
    var path: String
    let parameters: Parameters?
    let decode: (Data) throws -> Response?
    var encoding: ParameterEncoding?

    init(path: String,
         method: HTTPMethod = .get,
         parameters: Parameters? = nil,
         encoding: ParameterEncoding? = nil,
         decode: @escaping (Data) throws -> Response?) {
        self.method = method
        self.path = path
        self.parameters = parameters
        self.decode = decode
        self.encoding = encoding
    }
}

extension Endpoint {
    static func make(_ path: String, _ method: HTTPMethod = .get, _ parameters: Parameters? = nil) -> Endpoint<String> {
        Endpoint<String>(
            path: path,
            method: method,
            parameters: parameters,
            decode: {
                (data: Data) -> String? in
                String(data: data, encoding: .utf8)
            }
        )
    }


    static func make(_ path: String, _ method: HTTPMethod = .get, _ parameters: Parameters? = nil) -> Endpoint<[String]> {
        Endpoint<[String]>(
            path: path,
            method: method,
            parameters: parameters,
            decode: {
                (data: Data) -> [String]? in
                var objects: [String] = []
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [Any]

                    if let list = json {
                        for element in list {
                            if let str = element as? String {
                                objects.append(str)
                            }
                        }
                    }
                } catch {
                    debugPrint(String(data: data, encoding: String.Encoding.utf8) ?? "")
                    debugPrint(error)
                }

                return objects
            }
        )
    }

    static func make<T: Codable>(_ path: String, _ method: HTTPMethod = .get) -> Endpoint<T> {
        Endpoint<T>(
            path: path,
            method: method,
            decode: {
                (jsonData: Data) -> T? in
                let data: T?

                do {
                    let decoder = JSONDecoder()
                    data = try decoder.decode(T.self, from: jsonData)
                } catch {
                    print(error)
                    data = nil
                }

                return data
            }
        )
    }

    static func makeL<T: Codable>(_ path: String, _ method: HTTPMethod = .get) -> Endpoint<[T]> {
        Endpoint<[T]>(
            path: path,
            method: method,
            decode: {
                (jsonData: Data) -> [T]? in
                let tableData: [T]?

                do {
                    let decoder = JSONDecoder()
                    tableData = try decoder.decode([T].self, from: jsonData)
                } catch {
                    print(error)
                    tableData = nil
                }

                return tableData
            }
        )
    }
}

