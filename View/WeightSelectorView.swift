import SwiftUI

//элемент внизу с ценами, в зависимости от выбранного пикера, с подсчетом цен
struct WeightSelectorView: View {
    @Binding var selectedUnit: String
    @State private var weight: Double = 0.1
    @State private var pieceCount: Int = 1  // Добавляем переменную для количества штук
    
    var pricePerKg: Double
    var pricePerPiece: Double
    
    var body: some View {
        HStack {
            // Кнопка уменьшения веса или количества
            Button(action: {
                if selectedUnit == "кг", weight > 0.1 {
                    weight -= 0.1
                } else if selectedUnit == "шт", pieceCount > 1 {
                    pieceCount -= 1
                }
            }) {
                Image(systemName: "minus")
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
            }
            
            Spacer()
            
            // Отображение веса или количества и цены
            VStack(spacing: 1) {
                Text(selectedUnit == "кг" ? "\(weight, specifier: "%.1f") \(selectedUnit)" : "\(pieceCount) \(selectedUnit)")
                    .foregroundColor(.white)
                    .font(.headline)
                Text(selectedUnit == "кг" ? "~\(weight * pricePerKg, specifier: "%.2f") ₽" : "\(pricePerPiece * Double(pieceCount), specifier: "%.2f") ₽")
                    .foregroundColor(.white)
                    .font(.subheadline)
            }
            
            Spacer()
            
            // Кнопка увеличения веса или количества
            Button(action: {
                if selectedUnit == "кг" {
                    weight += 0.1
                } else if selectedUnit == "шт" {
                    pieceCount += 1
                }
            }) {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
            }
        }
        .background(Color(red: 21/255, green: 183/255, blue: 66/255))
        .cornerRadius(40)
        .padding(4)
        .onChange(of: selectedUnit) { oldValue, newValue in
            // Сбрасываем значения при переключении между кг и шт
            if newValue == "кг" {
                weight = 0.1
            } else if newValue == "шт" {
                pieceCount = 1
            }
        }
    }
}
