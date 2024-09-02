import SwiftUI

//наименование товара и страны с флагом (страна с флагом опционально)
struct ProductInfo: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(product.name)
                .font(.caption)
                .fontWeight(.light)
                .lineLimit(2)
            
            if let country = product.country, let flag = product.flag {
                HStack(spacing: 2) {
                    Text(country)
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                    
                    Text(flag)
                        .font(.caption)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 8)
    }
}
