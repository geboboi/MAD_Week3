import SwiftUI

struct ProductSpecificationView: View {
    var product: Product
    
    var specifications: [String: [String: String]] = [
        "iPhone 16": [
            "Processor": "A17 Bionic",
            "RAM": "8GB",
            "Storage": "256GB",
            "Battery Life": "22 hours",
            "Weight": "174g"
        ],
        "MacBook Pro": [
            "Processor": "M2 Chip",
            "RAM": "16GB",
            "Storage": "512GB SSD",
            "Battery Life": "20 hours",
            "Weight": "1.2 kg"
        ],
        "Apple Watch": [
            "Processor": "S9 SiP",
            "RAM": "1GB",
            "Storage": "32GB",
            "Battery Life": "18 hours",
            "Weight": "39g"
        ],
        "AirPods Pro 2": [
            "Chip": "H2",
            "Battery Life": "6 hours",
            "Charging Case": "MagSafe",
            "Noise Cancellation": "Yes",
            "Weight": "4g per earbud"
        ]
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 28) {
                Text(product.name + " \nSpecifications")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .bold()
                    .foregroundStyle(
                        LinearGradient(
                            colors: [product.color, product.color.opacity(0.6)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .padding()
                    .frame(maxWidth: .infinity)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Specifications")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    if let productSpecs = specifications[product.name] {
                        ForEach(productSpecs.sorted(by: >), id: \..key) { key, value in
                            HStack {
                                Text(key)
                                    .font(.headline)
                                Spacer()
                                Text(value)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color.gray.opacity(0.1)))
                        }
                    } else {
                        Text("No specifications available.")
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProductSpecificationView(product: Product(name: "iPhone 16", description: "A powerful laptop for professional work.", imageName: "laptopcomputer", imageSize: CGSize(width: 40, height: 30), color: .green))
}
