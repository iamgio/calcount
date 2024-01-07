//

import Foundation

class ModelData: ObservableObject {
    var user = User(name: "Giorgio", data: UserData(dailyData: [
        0: DailyData(food: [
            ConsumedFood(
                food: Food(name: "Chicken", baseCalories: 150),
                quantity: 150
            ),
            ConsumedFood(
                food: Food(name: "Rice", baseCalories: 130), quantity: 100
            )
        ]),
    ], caloriesGoal: 2000))
}
