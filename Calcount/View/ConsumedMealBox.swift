//

import SwiftUI

struct ConsumedMealBox: View {
    var meal: ConsumedMeal
    
    var body: some View {
        ZStack(alignment: .bottom) {
            MealImage(meal: meal.meal)
                .frame(height: 200)
            
            VStack {
                Text(meal.meal.name)
                    .frame(width: 170)
                    .fixedSize(horizontal: true, vertical: false)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 4)
                    .lineLimit(2, reservesSpace: true)
                
                HStack {
                    Text(String(Int(meal.amount)) + "g")
                        .foregroundStyle(.secondary)
                    
                    Text(String(Int(meal.totalCalories)) + "kcal")
                }
                .font(.footnote)
            }
            .foregroundStyle(.white)
            .padding()
            .background(Color.blue.brightness(-0.2).opacity(0.3).background(.ultraThinMaterial))
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        
        // TODO tap to show info
    }
}

struct ConsumedMealBox_Previews: PreviewProvider {
    static var previews: some View {
        ConsumedMealBox(meal: ModelData().todaysData.meals.first!)
    }
}
