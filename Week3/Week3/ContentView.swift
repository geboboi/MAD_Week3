import SwiftUI

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var imageName: String
    var imageSize: CGSize
    var color: Color
}

struct ContentView: View {
    @State private var products: [Product] = [
        Product(name: "iPhone 16", description: "The latest smartphone from Apple.", imageName: "iphone", imageSize: CGSize(width: 40, height: 50), color: .blue),
        Product(name: "MacBook Pro", description: "A powerful laptop for professional work.", imageName: "laptopcomputer", imageSize: CGSize(width: 40, height: 30), color: .green),
        Product(name: "Apple Watch", description: "A smart watch with various health features.", imageName: "applewatch", imageSize: CGSize(width: 40, height: 40), color: .red),
        Product(name: "AirPods", description: "Wireless earbuds with outstanding sound quality.", imageName: "headphones", imageSize: CGSize(width: 40, height: 40), color: .purple)
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Text("My Devices")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(products) { product in
                            NavigationLink(destination: ProductDetailView(product: product)) {
                                DeviceCard(product: product)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                }
                
                NavigationLink(destination: AddDeviceView(products: $products)) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .font(.title3)
                        Text("Add Device")
                            .font(.headline)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(color: .gray.opacity(0.4), radius: 4, x: 0, y: 2)
                    .padding()
                }
            }
        }
    }
}

struct DeviceCard: View {
    var product: Product
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(product.color.opacity(0.2))
                    .frame(width: 60, height: 60)
                
                Image(systemName: product.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: product.imageSize.width, height: product.imageSize.height)
                    .foregroundColor(product.color)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(product.name)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(product.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
            .padding(.leading, 8)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray.opacity(0.5))
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(UIColor.systemBackground))
                .shadow(color: .gray.opacity(0.2), radius: 2, x: 0, y: 1)
        )
    }
}

#Preview {
    ContentView()
}
