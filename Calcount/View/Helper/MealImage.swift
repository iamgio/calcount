//

import SwiftUI

struct MealImage: View {
    
    var meal: Meal
    
    var body: some View {
        AsyncImage(url: URL(string: meal.imageUrl)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .aspectRatio(contentMode: .fit)
            default:
                EmptyView()
            }
        }
    }
}

#Preview {
    MealImage(meal: ModelData().todaysData.meals.first!.meal)
}
