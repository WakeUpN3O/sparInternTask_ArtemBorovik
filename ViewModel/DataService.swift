import Foundation

//парсим и возвращаем данные из изображаемого сервера использую Model.Product
class DataService {
    static func loadProducts() -> [Product] {
        guard let url = Bundle.main.url(forResource: "MockData", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            return []
        }
        
        let decoder = JSONDecoder()
        do {
            let products = try decoder.decode([Product].self, from: data)
            return products
        } catch {
            print("Error decoding JSON: \(error)")
            return []
        }
    }
}
