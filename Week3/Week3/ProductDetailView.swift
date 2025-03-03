import SwiftUI

struct ProductDetailView: View {
    var product: Product
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                ZStack {
                    Circle()
                        .fill(product.color.opacity(0.2))
                        .frame(width: 200, height: 200)
                    
                    Image(systemName: product.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: product.imageSize.width * 2, height: product.imageSize.height * 2)
                        .foregroundColor(product.color)
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                Text(product.name)
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(
                        LinearGradient(
                            colors: [product.color, product.color.opacity(0.6)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(maxWidth: .infinity)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("About")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    Text(product.description)
                        .font(.body)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.gray.opacity(0.1))
                        )
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Product Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProductDetailView(product: Product(name: "iPhone 16", description: "The latest smartphone from Apple.", imageName: "iphone", imageSize: CGSize(width: 40, height: 50), color: .blue))
}
