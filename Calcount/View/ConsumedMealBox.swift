//

import SwiftUI

struct ConsumedMealBox: View {
    var meal: ConsumedMeal
    
    var body: some View {
        VStack {
            MealImage(meal: meal.meal)
                .frame(width: 130)
                .padding(.bottom)
            
            Text(meal.meal.name)
                .frame(width: 170)
                .fixedSize(horizontal: true, vertical: false)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.bottom, 4)
            
            HStack {
                Text(String(Int(meal.amount)) + "g")
                    .foregroundStyle(.secondary)
                
                Text(String(Int(meal.totalCalories)) + "kcal")
            }
            .font(.footnote)
        }
        .padding(24)
        .background(.blue.opacity(0.08))
        .clipShape(.rect(cornerRadius: 16))
        
        // TODO tap to show info
    }
}

struct ConsumedMealBox_Previews: PreviewProvider {
    static var previews: some View {
        ConsumedMealBox(meal: ModelData().todaysData.meals.first!)
    }
}
