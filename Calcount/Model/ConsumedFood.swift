//

import Foundation

struct ConsumedFood: Hashable {
    var food: Food
    var quantity: Int // in grams
    
    var totalCalories: Int {
        food.baseCalories * quantity / 100
    }
}
