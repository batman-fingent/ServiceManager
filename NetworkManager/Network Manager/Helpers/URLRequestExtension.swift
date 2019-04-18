//
//  URLRequestExtension.swift
//  Network Manager
//
//  Created by Bibin Jacob Pulickal on 04/01/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

import Foundation

extension URLRequest {
    
    init?(url: URL?, httpBody: Data? = nil, method: HTTPMethod = .get, encoding: HTTPEncoding? = nil, headers: HTTPHeader? = nil) {
        guard let url = url else { return nil }
        self.init(url: url)
        self.httpBody = httpBody
        self.httpMethod = method.rawValue
        if let contentType = encoding?.contentType {
            self.addValue(contentType, forHTTPHeaderField: HTTPEncoding.contentTypeKey)
        }
        headers?.forEach({ (key, value) in
            self.addValue(value, forHTTPHeaderField: key)
        })
    }
}
