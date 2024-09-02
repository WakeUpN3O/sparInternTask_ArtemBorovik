import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = ProductViewModel()
    @State private var isGridView: Bool = true // Состояние для переключения между видами

    var columns: [GridItem] {
        let itemWidth = UIScreen.main.bounds.width / 2 - 16
        return [
            GridItem(.fixed(itemWidth)),
            GridItem(.fixed(itemWidth))
        ]
    }

    var body: some View {
        VStack(spacing: 4) {
            // Переключатель между сеткой и списком с одной кнопкой
            HStack {
                Button(action: {
                    isGridView.toggle()
                }) {
                    Image(isGridView ? "GridOption" : "ColumnOption") // Меняем изображение в зависимости от состояния
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding(0)
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, 0) // Устанавливаем нулевой отступ снизу для списка
            
            Rectangle()
                .frame(height: 0.5)
                .foregroundColor(Color.gray.opacity(0.5))

            ScrollView {
                if isGridView {
                    // Сеточный вид
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.products) { product in
                            ProductCard(product: product, isGridView: isGridView)
                        }
                    }
                } else {
                    // Списковый вид
                    LazyVStack(spacing: 0) {
                        ForEach(viewModel.products) { product in
                            VStack(spacing: 0) {
                                ProductListItem(product: product, isGridView: isGridView)
                                Rectangle() // Серая линия между элементами
                                    .frame(height: 0.5)
                                    .foregroundColor(Color.gray.opacity(0.5))
                            }
                        }
                    }
                }
            }
        }
    }
}


