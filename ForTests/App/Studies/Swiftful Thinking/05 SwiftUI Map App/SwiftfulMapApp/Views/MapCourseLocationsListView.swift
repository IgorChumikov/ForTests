//
//  MapCourseLocationsListView.swift
//  SwiftfulMapApp
//
//  Created by Nick Sarno on 11/27/21.
//

import SwiftUI

struct MapCourseLocationsListView: View {
    
    @EnvironmentObject private var vm: MapCourseLocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                Button {
                    vm.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct MapCourseLocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        MapCourseLocationsListView()
            .environmentObject(MapCourseLocationsViewModel())
    }
}

extension MapCourseLocationsListView {
    
    private func listRowView(location: MapCourseLocation) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
}
