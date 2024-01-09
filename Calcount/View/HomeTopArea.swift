//

import SwiftUI

struct HomeTopArea: View {
    @EnvironmentObject var modelData: ModelData
    
    var todaysData: DailyData
    
    var body: some View {
        let caloriesGoal = modelData.user.data.caloriesGoal
        
        return VStack {
            HStack {
                Text(String(Int(todaysData.calories)))
                    .font(.system(size: 40, weight: .bold))
                
                Text("/ " + String(caloriesGoal))
                    .foregroundStyle(.secondary)
            }
            .padding(.top)
            
            Text("kcal")
                .padding(.bottom, 28)
            
            if Int(todaysData.calories) >= caloriesGoal {
                Text("Congratulations!")
                    .foregroundStyle(.green)
                    .bold()
                Text("You have reached your daily goal")
                    .foregroundStyle(.secondary)
            } else {
                Text("Keep going!")
                    .bold()
                Text(String(caloriesGoal - Int(todaysData.calories)) + " more calories to reach your goal")
                    .foregroundStyle(.secondary)
            }
            
            Ellipse()
                .fill(.blue)
                .frame(height: 60)
                .offset(y: 30)
                .shadow(color: .blue.opacity(0.5), radius: 0, y: 5)
        }
        .foregroundColor(.white)
        .background(.blue.gradient)
        .navigationTitle(Text("Today"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HomeTopArea_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        return HomeTopArea(todaysData: modelData.user.data.dailyData[0]!)
            .environmentObject(modelData)
    }
}
