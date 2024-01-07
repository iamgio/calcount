import SwiftUI

struct AddFoodView: View {
    
    @State private var searchText = "";
    
    @State var values: [String] = []
    
    private var searchResults: [String] {
        // TODO from https://www.themealdb.com/api.php
        // https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-a-search-bar-to-filter-your-data
        if searchText.isEmpty {
            return values;
        }
        return values.filter { $0.contains(searchText) }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { value in
                    NavigationLink(value, value: value)
                }
            }
            .navigationDestination(for: String.self) { value in
                Text(value)
            }
            .navigationTitle("Add food")
        }
        .searchable(text: $searchText)
        .task {
            search()
        }
        .onChange(of: searchText) { _ in
            search()
        }
    }
    
    func search() {
        Task {
            do {
                values = try await MealDBApi.searchMeals(name: searchText).map { $0.name }
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
