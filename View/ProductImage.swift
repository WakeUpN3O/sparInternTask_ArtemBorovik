import SwiftUI

//наша картинка продукта
struct ProductImage: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 168, height: 168)
            .clipped()
    }
}
