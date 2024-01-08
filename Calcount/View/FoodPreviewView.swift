import SwiftUI

struct FoodPreviewView: View {
    
    var meal: Meal
    
    var body: some View {
        VStack {
            Text(meal.name)
            Text(String(meal.calories))
        }
    }
}

struct FoodPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        FoodPreviewView(meal: Meal(id: 52000, name: "Chicken"))
    }
}
