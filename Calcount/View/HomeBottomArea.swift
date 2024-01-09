//

import SwiftUI

struct HomeBottomArea: View {
    
    @State private var showingAddMeal = false;
    
    var todaysData: DailyData
    
    var body: some View {
        VStack {
            Text("What I ate today")
                .font(.headline)
            
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(todaysData.meals, id: \.self) { meal in
                        ConsumedMealBox(meal: meal)
                    }
                }
                .padding()
            }
            .padding(.bottom)
            
            Button {
                showingAddMeal = true
            } label: {
                Label("Add meal", systemImage: "plus")
                    .bold()
            }
            .buttonStyle(.borderedProminent)
        }
        .sheet(isPresented: $showingAddMeal) {
            SearchMealView()
        }
    }
}

struct HomeBottomArea_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        
        HomeBottomArea(todaysData: modelData.todaysData)
            .environmentObject(modelData)
    }
}
