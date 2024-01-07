//

import Foundation

struct Food: Identifiable, Hashable {
    var name: String
    var baseCalories: Int // per 100g
    // var image: String
    
    var id: String { name }
}
