import SwiftUI

//рисуем цену + значок р/кг согласно ТЗ
struct ProductPriceView: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(product.price, specifier: "%.2f")")
                    .font(.headline)
                    .bold()
                Image("rukgImage")
                    .padding(.leading, -5)
            }
            
            if let oldPrice = product.oldPrice {
                Text("\(oldPrice, specifier: "%.2f")")
                    .font(.caption)
                    .strikethrough()
                    .foregroundColor(.gray)
                    .offset(y: -4)
            }
        }
        
        Spacer()
        
        Image("cartImage")
    }
}
