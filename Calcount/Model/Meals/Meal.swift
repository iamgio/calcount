import Foundation

struct Meal: Identifiable, Hashable, Codable {
    // JSON names
    private var idMeal: String
    private var strMeal: String
    private var strMealThumb: String
    
    init(id: Int, name: String, imageUrl: String) {
        self.idMeal = String(id)
        self.strMeal = name
        self.strMealThumb = imageUrl
    }
    
    var id: Int {
        Int(idMeal)!
    }
    
    var name: String {
        strMeal
    }
    
    var imageUrl: String {
        strMealThumb
    }
    
    // The API does not provide calories data, so this is a deterministic way to generate it.
    var baseCalories: Double {
        Double(name.map { Int($0.asciiValue ?? 0) }.reduce(0, +)) / 10
    }
    
    func calculateCalories(amount: Double) -> Double {
        baseCalories * amount / 100
    }
}
