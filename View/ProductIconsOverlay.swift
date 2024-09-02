import SwiftUI

//выводим лайк и чек, соласно ТЗ
struct ProductIconsOverlay: View {
    var body: some View {
        VStack(spacing: 14) {
            Image("likeImage")
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundColor(Color.gray)
            
            Image("paperImage")
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundColor(Color.gray)
        }
        .padding(8)
        .background(Color.white.opacity(0.7))
        .cornerRadius(16)
        .frame(width: 32, height: 64)
        .zIndex(1)
    }
}
