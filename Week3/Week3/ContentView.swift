//
//  ContentView.swift
//  Week3
//
//  Created by Gabriela on 04/03/25.
//

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
        Product(name: "iPhone 16", description: "iPhone 16 is built for Apple Intelligence, the personal intelligence system that helps you write, express yourself, and get things done effortlessly. With groundbreaking privacy protections, it gives you peace of mind that no one else can access your data — not even Apple.", imageName: "iphone", imageSize: CGSize(width: 30, height: 40), color: .blue),
        Product(name: "MacBook Pro", description: "MacBook Pro features the most advanced lineup of chips ever built for a pro laptop. Phenomenal single- and multithreaded CPU performance, faster unified memory, enhanced machine learning accelerators.", imageName: "macbook", imageSize: CGSize(width: 40, height: 30), color: .green),
        Product(name: "Apple Watch", description: "Apple Watch can do what your other devices can’t because it’s on your wrist. When you wear it, you get meaningful health insights, a fitness partner that measures all the ways you move, a connection to the people you care about most, and advanced safety features.", imageName: "applewatch", imageSize: CGSize(width: 40, height: 40), color: .red),
        Product(name: "AirPods Pro 2", description: "AirPods Pro 2 take the listening experience to a new level of individuality. Personalized Spatial Audio with dynamic head tracking4 works with all your devices to immerse you deeper in all-around-you sound when you’re listening to music, watching a movie, or gaming.", imageName: "headphones", imageSize: CGSize(width: 40, height: 40), color: .purple)
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
                    VStack(spacing: 20) {
                        ForEach(products) { product in
                            NavigationLink(destination: ProductDetailView(product: product)) {
                                DeviceCard(product: product)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 20)
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

