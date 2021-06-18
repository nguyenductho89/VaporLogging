import App
import Vapor

var env = try Environment.detect()
try LoggingSystem.bootstrap(from: &env)
let app = Application(env)
defer { app.shutdown() }
try configure(app)
try app.run()

//extension Request {
//    /// A collection with an associated `Codable` type `Kitten`.
//    var kittenCollection: MongoCollection<Kitten> {
//        self.mongoDB.client.db("home").collection("kittens", withType: Kitten.self)
//    }
//}
