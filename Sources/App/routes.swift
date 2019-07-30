import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    try router.register(collection: IntTestRouteController())
    try router.register(collection: StringTestRouteController())
}

struct IntTestRouteController: RouteCollection {
    func boot(router: Router) throws {
        router.get("test", Int.parameter, "integer_test", use: self.intTest)
    }
    
    func intTest(req: Request) throws -> Int {
        return try req.parameters.next(Int.self)
    }
}

struct StringTestRouteController: RouteCollection {
    func boot(router: Router) throws {
        router.get("test", String.parameter, "string_test", use: self.stringTest)
    }
    
    func stringTest(req: Request) throws -> String {
        return try req.parameters.next(String.self)
    }
}
