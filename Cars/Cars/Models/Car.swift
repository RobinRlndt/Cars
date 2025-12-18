import Foundation

struct Car: Identifiable, Codable, Hashable {
    let id: Int
    let brand: String
    let model: String
    let year: Int
    let price: Double
    let color: String
    let fuelType: String
    let imageURL: String
}

struct CarsResponse: Codable {
    let cars: [Car]
}
