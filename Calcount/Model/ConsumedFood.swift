//

import Foundation

struct ConsumedMeal: Hashable {
    var meal: Meal
    var amount: Double // in grams
    
    var totalCalories: Double {
        meal.calculateCalories(amount: amount)
    }
}
