//
//  Endpoints.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 04.06.2023.
//

enum Path {
    static let id = "id"

    static let users = "/api/v1/users"
    static let userId = "/api/v1/users/\(id)"
    static let getProducts = "/api/v1/products"
    static let getRecipes = "/api/v1/recipes"
}

enum Endpoints {
    static func getUser(id: String) -> Endpoint<FFUser> {
        let endpoint: Endpoint<FFUser>
        endpoint = .make(Path.userId, .get)
        endpoint.path = endpoint.path.replacingOccurrences(of: Path.id, with: id)
        return endpoint
    }
    static func chengeUserData(id: String) -> Endpoint<FFUser> {
        let endpoint: Endpoint<FFUser>
        endpoint = .make(Path.userId, .patch)
        endpoint.path = endpoint.path.replacingOccurrences(of: Path.id, with: id)
        return endpoint
    }
    static let saveUser: Endpoint<String> = .make(Path.users, .post)
    static let getProducts: Endpoint<[FFProduct]> = .make(Path.getProducts, .get)
    static let getRecipes: Endpoint<[FFRecipe]> = .make(Path.getRecipes, .get)
}
