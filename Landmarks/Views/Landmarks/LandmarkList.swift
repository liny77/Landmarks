//
//  LandmarkList.swift
//  Landmarks
//
//  Created by lin on 2022/12/29.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData// 接受environmentObject
    @State private var showFavoritesOnly = false// view自己的state
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter {
            landmark in (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData()) // 往view里面传environmentObject
//            .previewDevice("iPhone 14")
    }
}
