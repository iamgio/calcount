//

import Foundation

struct DailyData {
    var meals: [ConsumedMeal]
    
    var calories: Double {
        meals.reduce(0) { $0 + $1.totalCalories }
    }
}
