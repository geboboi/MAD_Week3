import SwiftUI

struct AddDeviceView: View {
    @Binding var products: [Product]
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var selectedColor: Color = .blue
    @Environment(\.dismiss) var dismiss
    
    let colorOptions: [Color] = [.blue, .green, .red, .purple, .orange, .pink]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Add New Device")
                .font(.largeTitle)
                .bold()
                .padding()
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Group {
                TextField("Device Name", text: $name)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                
                TextField("Description", text: $description)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Choose a color:")
                    .font(.headline)
                
                HStack {
                    ForEach(colorOptions, id: \.self) { color in
                        Circle()
                            .fill(color)
                            .frame(width: 30, height: 30)
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 2)
                                    .opacity(selectedColor == color ? 1 : 0)
                            )
                            .shadow(color: .gray.opacity(0.3), radius: 2, x: 0, y: 1)
                            .onTapGesture {
                                selectedColor = color
                            }
                    }
                }
            }
            .padding(.horizontal)
            
            Button(action: {
                let formattedImageName = name.lowercased().replacingOccurrences(of: " ", with: "")
                let newProduct = Product(name: name, description: description, imageName: formattedImageName, imageSize: CGSize(width: 50, height: 40), color: selectedColor)
                products.append(newProduct)
                dismiss()
            }) {
                Text("Save Device")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing)
                    )
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(color: .gray.opacity(0.4), radius: 4, x: 0, y: 2)
            }
            .padding()
            Spacer()
        }
        .padding()
    }
}
