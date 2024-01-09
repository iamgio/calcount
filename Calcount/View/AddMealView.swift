import SwiftUI

struct AddMealView: View {
    private static let addOrSubtractAmount = 100
    
    @EnvironmentObject var modelData: ModelData
    
    var meal: Meal
    
    @State var amountText = "100"
    
    private var amount: Int {
        Int(amountText) ?? 0
    }
    
    private func updateAmount(delta: Int) {
        amountText = String(max(0, amount + delta))
    }
    
    var body: some View {
        VStack(spacing: 8) {
            AsyncImage(url: URL(string: meal.imageUrl)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .aspectRatio(contentMode: .fit)
                        .shadow(color: .blue.opacity(0.08), radius: 12, y: 16)
                default:
                    EmptyView()
                }
            }
            .frame(height: 150)
            .padding(32)
            
            Text(meal.name)
                .font(.title2)
                .bold()
            
            Text("How much?")
                .foregroundStyle(.secondary)
            
            Spacer()
                .frame(height: 12)
            
            HStack {
                Button {
                    updateAmount(delta: -AddMealView.addOrSubtractAmount)
                } label: {
                    Label("Subtract", systemImage: "minus.circle.fill")
                        .labelStyle(.iconOnly)
                }
                
                Spacer()
                    .frame(width: 28)
                
                TextField("Amount", text: $amountText)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 100)
                    .multilineTextAlignment(.center)
                    .bold()
                
                Text("g")
                    .font(.subheadline)
                
                Spacer()
                    .frame(width: 16)
                
                Button {
                    updateAmount(delta: AddMealView.addOrSubtractAmount)
                } label: {
                    Label("Add", systemImage: "plus.circle.fill")
                        .labelStyle(.iconOnly)
                }
            }
            .foregroundStyle(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.top)
            .font(.title2)
            
            Text(String(Int(meal.calculateCalories(amount: Double(amount)))) + " kcal")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .padding(.bottom)
            
            Button {
                
            } label: {
                Label("Add meal", systemImage: "plus")
                    .labelStyle(.titleAndIcon)
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle(meal.name)
    }
}

struct AddMealView_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        
        AddMealView(meal: modelData.todaysData.meals.first!.meal)
        .environmentObject(modelData)
    }
}
