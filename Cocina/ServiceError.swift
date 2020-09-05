//
//  ServiceError.swift
//  Cocina
//
//  Created by JONATHAN DANIEL BANDONI on 05/09/2020.
//  Copyright © 2020 JONATHAN DANIEL BANDONI. All rights reserved.
//

import Foundation

enum ServiceError: Error {
    case notFound
    case parseError
    case internalServerError
    case badRequest
    case invalidURL
    case noData
}
