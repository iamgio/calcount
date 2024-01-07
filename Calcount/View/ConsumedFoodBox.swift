//

import SwiftUI

struct ConsumedFoodBox: View {
    var food: ConsumedFood
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 16) // Should be an image
                .frame(height: 110)
                .padding(.bottom)
                .foregroundStyle(.blue)
            
            Text(food.food.name)
                .frame(width: 170)
                .fixedSize(horizontal: true, vertical: false)
                .font(.headline)
                .multilineTextAlignment(.center)
            
            HStack {
                Text(String(food.quantity) + "g")
                    .foregroundStyle(.secondary)
                
                Text(String(food.totalCalories) + "kcal")
            }
        }
        .padding(24)
        .background(.blue.opacity(0.08))
        .clipShape(.rect(cornerRadius: 16))
        
        // TODO add food with autocomplete from www.themealdb.com, add food info page
    }
}

struct ConsumedFoodBox_Previews: PreviewProvider {
    static var previews: some View {
        ConsumedFoodBox(food: ConsumedFood(
            food: Food(name: "Chicken", baseCalories: 150),
            quantity: 150)
        )
    }
}
