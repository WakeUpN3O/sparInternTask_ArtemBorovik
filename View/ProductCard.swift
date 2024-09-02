import SwiftUI

//наполнение яйчейки LazyVGrid
struct ProductCard: View {
    let product: Product
    let isGridView: Bool
    @State private var selectedOption = "кг"
    
    var body: some View {
        VStack {
            ProductImage(imageName: product.image)
            ProductScoresAndReviews(product: product)
            ProductInfo(product: product)
            Spacer()
            ProductBottomSection(product: product, selectedOption: $selectedOption)
        }
        .frame(height: 306)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .overlay(ProductTagOverlay(tag: product.specialTag, isGridView: isGridView), alignment: .topLeading)
        .overlay(ProductIconsOverlay(), alignment: .topTrailing)
    }
}
