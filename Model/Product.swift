import Foundation

struct Product: Identifiable, Codable {
    let id: UUID
    let name: String
    let price: Double
    let oldPrice: Double?
    let image: String
    let specialTag: String?
    let isPerUnitOrWeight: Bool
    let rating: Double
    let reviewsCount: Int?
    let country: String?
    let flag: String?
    let additionalSale: Int?
    let switchable: Bool
    let weight: Bool
}
