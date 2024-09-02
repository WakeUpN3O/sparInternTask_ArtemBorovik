import SwiftUI

// в зависимости от того, какие данные пришли с сервера, создаем либо пикер с элементом добавления/уменьшения, либо просто сам элемент, либо просто корзинку
struct ProductBottomSection: View {
    let product: Product
    @Binding var selectedOption: String
    
    var body: some View {
        HStack {
            switch (product.switchable, product.weight) {
            case (true, true):
                VStack(spacing: 1) {
                    Picker("Выбор", selection: $selectedOption) {
                        Text("Шт").tag("шт")
                        Text("Кг").tag("кг")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding([.leading, .trailing], 4)
                    WeightSelectorView(
                        selectedUnit: $selectedOption,
                        pricePerKg: 5920.00,
                        pricePerPiece: 354.86
                    )
                }
                .offset(y: 4)
            case (false, true):
                WeightSelectorView(
                    selectedUnit: $selectedOption,
                    pricePerKg: 5920.00,
                    pricePerPiece: 354.86
                )
                .offset(y: 4)
            case (true, false), (false, false):
                
                ProductPriceView(product: product)
            }
        }
        .padding(4)
    }
}
