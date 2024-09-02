import SwiftUI

//выводим дополнительный тег если пришел с сервера
struct ProductTagOverlay: View {
    let tag: String?
    let isGridView: Bool

    var body: some View {
        Group {
            if let tag = tag {
                Text(tag)
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(tagColor(for: tag))
                    .clipShape(CustomRoundedCorners())
                    .alignmentGuide(.top) { _ in isGridView ? 0 : 0 }
                    .alignmentGuide(.leading) { _ in isGridView ? 0 : 0 }
            }
        }
    }
}

// Функция для определения цвета тега
private func tagColor(for tag: String) -> Color {
    switch tag {
    case "Новинки":
        return Color.purple.opacity(0.8)
    case "Удар по ценам":
        return Color.red.opacity(0.8)
    case "Цена по карте":
        return Color.green.opacity(0.8)
    default:
        return Color.gray.opacity(0.8)
    }
}

//для отрисовки тега
struct CustomRoundedCorners: Shape {
    var radius: CGFloat = 16
    var corners: UIRectCorner = [.topLeft, .topRight, .bottomRight]
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

