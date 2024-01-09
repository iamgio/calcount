import SwiftUI

struct AddFoodView: View {
    
    @State private var searchText = "";
    
    @State var values: [Meal] = []
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(values, id: \.self) { value in
                    NavigationLink(value.name, value: value)
                }
            }
            .navigationDestination(for: Meal.self) { value in
                FoodPreviewView(meal: value)
                    .navigationBarTitleDisplayMode(.inline)
            }
            .navigationTitle("Add food")
        }
        .searchable(text: $searchText)
        .task { search() }
        .onChange(of: searchText) { _ in search() }
    }
    
    func search() {
        Task {
            do {
                values = try await MealDBApi.searchMeals(name: searchText)
            } catch {
                print(error)
                values = []
            }
        }
    }
}

struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView()
    }
}
