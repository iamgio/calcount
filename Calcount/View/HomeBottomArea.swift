//

import SwiftUI

struct HomeBottomArea: View {
    
    @State private var showingAddFood = false;
    
    var todaysData: DailyData
    
    var body: some View {
        VStack {
            Text("What I ate today")
                .font(.headline)
            
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(todaysData.food, id: \.self) { food in
                        ConsumedFoodBox(food: food)
                    }
                }
                .padding()
            }
            .padding(.bottom)
            
            Button {
                showingAddFood = true
            } label: {
                Label("Add food", systemImage: "plus")
                    .bold()
            }
            .buttonStyle(.borderedProminent)
        }
        .sheet(isPresented: $showingAddFood) {
            AddFoodView()
        }
    }
}

struct HomeBottomArea_Previews: PreviewProvider {
    static var previews: some View {
        HomeBottomArea(todaysData: ModelData().user.data.dailyData[0]!)
    }
}
