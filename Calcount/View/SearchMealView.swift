import SwiftUI

struct SearchMealView: View {
    
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
                AddMealView(meal: value)
                    .navigationBarTitleDisplayMode(.inline)
            }
            .navigationTitle("Add meal")
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

struct SearchMealView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMealView()
    }
}
