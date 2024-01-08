import Foundation

struct Meal: Identifiable, Hashable, Codable {
    private var idMeal: String
    private var strMeal: String
    
    init(id: Int, name: String) {
        self.idMeal = String(id)
        self.strMeal = name
    }
    
    var id: Int {
        Int(idMeal)!
    }
    
    var name: String {
        strMeal
    }
    
    // The API does not provide calories data, so this is a deterministic way to generate it.
    var calories: Double {
        Double(name.map { Int($0.asciiValue ?? 0) }.reduce(0, +))
    }
}
