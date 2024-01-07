//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(.white)]
        
        let todaysData = modelData.user.data.dailyData[0]! // TODO by date
        
        return NavigationView {
            VStack() {
                HomeTopArea(todaysData: todaysData)
                HomeBottomArea(todaysData: todaysData)
                    .padding(.top, 60)
                
                Spacer()
            }
            .toolbar {
                Button {
                    
                } label: {
                    Label("Profile", systemImage: "person.crop.circle")
                }
                .tint(.white)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ModelData())
    }
}
