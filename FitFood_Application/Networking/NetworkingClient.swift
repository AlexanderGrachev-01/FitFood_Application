//
//  NetworkingClient.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 04.06.2023.
//

import Alamofire
import Foundation

class NetworkingClient {
    // MARK: - Instance

    static let shared = NetworkingClient()
    static let maxRetries = 3

    // MARK: - Properties

    var secret: Parameters = [:]
    var ip: String? = ""
    var manager = Alamofire.Session()

    let queue = DispatchQueue(label: "networking.client.query")

    func request<Response>(
        _ endpoint: Endpoint<Response>,
        _ parameters: Parameters? = nil,
        _ headersIn: [HTTPHeader] = [],
        _ numRetries: Int = maxRetries,
        _ completion: ((_ result: Response?, _ error: NetworkingError?) -> Void)? = nil
    ) {
        guard let url = url(path: endpoint.path) else {
            completion?(nil, .invalidUrl)
            return
        }

        let headers: HTTPHeaders = [:]
        var params: Parameters = [:]
        var encoding: ParameterEncoding = JSONEncoding.default

        if endpoint.method == .post || endpoint.method == .put || endpoint.method == .patch {
            if let keys = parameters?.keys {
                params["client"] = secret

                for key in keys {
                    params[key] = parameters?[key]
                }
            }

            encoding = JSONEncoding.default
        } else if endpoint.method == .get || endpoint.method == .delete {
            if let keys = parameters?.keys {
                for key in keys {
                    params[key] = parameters?[key]
                }
            }

            encoding = URLEncoding.default
        }

        if let enc = endpoint.encoding {
            encoding = enc
        }

        manager.request(
            url,
            method: endpoint.method,
            parameters: (params.count == 0) ? nil : params,
            encoding: encoding,
            headers: headers
        )
        .validate()
        .responseData(queue: queue) { response in
            switch response.result {
            case let .success(value):
                do {
                    let result = try endpoint.decode(value)
                    DispatchQueue.main.async {
                        completion?(result, nil)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion?(nil, .invalidData)
                    }
                }
            case .failure(_):
                DispatchQueue.main.async {
                    completion?(nil, .noInternet)
                }
            }
        }
    }

    func url(path: String) -> URL? {
        let baseURL = URL(string: "http://172.20.10.3:9080")

        let urlString = (baseURL?.absoluteString ?? "") + path

        if let url = URL(string: urlString) {
            return url
        }

        if let urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: urlString) {
            return url
        }

        return nil
    }
}

extension NetworkingClient {
    class func request<Response>(
        endpoint: Endpoint<Response>,
        parameters: Parameters? = nil,
        headers: [HTTPHeader] = [],
        _ numRetries: Int = maxRetries,
        _ completion: ((_ result: Response?, _ error: NetworkingError?) -> Void)? = nil
    ) {
        NetworkingClient.shared.request(endpoint, parameters, headers, numRetries, completion)
    }
}
