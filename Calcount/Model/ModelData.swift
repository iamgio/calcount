//

import Foundation

class ModelData: ObservableObject {
    var user = User(name: "Giorgio", data: UserData(dailyData: [
        0: DailyData(meals: [
            ConsumedMeal(
                meal: Meal(
                    id: 52982,
                    name: "Spaghetti alla Carbonara",
                    imageUrl: "https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg"
                ),
                amount: 150
            ),
            ConsumedMeal(
                meal: Meal(
                    id: 52795,
                    name: "Chicken Handi",
                    imageUrl: "https://www.themealdb.com/images/media/meals/wyxwsp1486979827.jpg"
                ),
                amount: 100
            ),
        ]),
    ], caloriesGoal: 2000))
    
    var todaysData: DailyData {
        user.data.dailyData[0]! // TODO by date
    }
}
