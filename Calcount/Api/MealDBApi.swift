import Foundation

private struct Wrapper: Codable {
    let meals: [Meal]
}

class MealDBApi {
    
    private static let apiUrl = "https://www.themealdb.com/api/json/v1/1"
    
    static func searchMeals(name: String) async throws -> [Meal] {
        guard let url = URL(string: "\(apiUrl)/search.php?s=\(name)") else { return [] }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        
        return wrapper.meals
    }
}
