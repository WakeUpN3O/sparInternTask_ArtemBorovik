import SwiftUI

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    init() {
        self.products = DataService.loadProducts()
    }
}
