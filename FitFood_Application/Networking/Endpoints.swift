//
//  Endpoints.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 04.06.2023.
//

enum Path {
    static let getProducts = "/api/v1/products"
}

enum Endpoints {
    static let getProducts: Endpoint<[FFProduct]> = .make(Path.getProducts, .get)
}
