import Foundation

struct Meal: Identifiable, Hashable, Codable {
    
    private var idMeal: String
    private var strMeal: String
    
    var id: Int {
        Int(idMeal)!
    }
    
    var name: String {
        strMeal
    }
}
