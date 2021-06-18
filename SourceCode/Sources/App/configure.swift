import Fluent
import FluentSQLiteDriver
import Vapor
import MongoDBVapor

// Called before your application initializes.
public func configure(_ app: Application) throws {
    // Serves files from `Public/` directory
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.middleware.use(CORSMiddleware()) // Add CORS with default configuration

    // Configure SQLite database
    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)
//    try app.mongoDB.configure("mongodb://localhost:27017")
//    defer {
//        // Cleanup the application's MongoDB data.
//        app.mongoDB.cleanup()
//        // Clean up the driver's global state. The driver will no longer be usable from this program after this method is
//        // called.
//        cleanupMongoSwift()
//    }
    // Configure migrations
    app.migrations.add(CreateTodo())
    try app.autoMigrate().wait() // enable auto migrate
    
    try routes(app)
}
