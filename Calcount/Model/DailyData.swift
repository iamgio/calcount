//

import Foundation

struct DailyData {
    var food: [ConsumedFood]
    
    var calories: Int {
        food.reduce(0) { $0 + $1.totalCalories }
    }
}
