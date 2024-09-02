import SwiftUI

//оценка товара и отзывы на товар
struct ProductScoresAndReviews: View {
    let product: Product
    
    var body: some View {
        HStack(spacing: 3) {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                .font(.caption)
            
            Text("\(product.rating, specifier: "%.1f")")
                .font(.caption)
            
            if let reviews = product.reviewsCount, reviews > 0 {
                Rectangle()
                    .frame(width: 1.3, height: 16)
                    .foregroundColor(.gray)
                Text("\(reviews) отзывов")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            if let sale = product.additionalSale {
                Text("\(sale)%")
                    .font(.caption.bold())
                    .fontWeight(.heavy)
                    .foregroundColor(Color(red: 128/255, green: 0, blue: 0))
            }
        }
        .frame(height: 16)
        .padding(.horizontal, 8)
        .frame(maxWidth: .infinity)
    }
}
