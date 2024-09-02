import SwiftUI

//наполнение яйчейки LazyVStack
struct ProductListItem: View {
    let product: Product
    let isGridView: Bool
    @State private var selectedOption = "кг"
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            HStack(spacing: 0) { // Без отступов между изображением и текстом
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 168, height: 168)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 8) {
                    ProductScoresAndReviews(product: product)
                    ProductInfo(product: product)
                    ProductBottomSection(product: product, selectedOption: $selectedOption)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal) // Добавляем отступы внутри элемента
            }
            // Привязка ProductTagOverlay к верхнему левому углу ячейки
            ProductTagOverlay(tag: product.specialTag, isGridView: isGridView)
                .padding(.leading, isGridView ? 8 : -110) // Корректируем отступ в зависимости от типа вида
        }
    }
}
