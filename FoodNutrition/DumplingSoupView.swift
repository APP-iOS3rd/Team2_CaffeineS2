//
//  DumplingSoupView.swift
//  FoodNutrition
//
//  Created by Minjae Kim on 11/2/23.
//

import SwiftUI

struct DumplingSoupView: View {
	
	@Binding var nutrition: Nutrition
	
	@State private var searchList: [Item] = []
	
	var body: some View {
		List {
			ForEach(0..<searchList.count, id: \.self) { i in
				HStack {
					VStack(alignment: .leading) {
						Text(searchList[i].title)
							.font(.headline)
						Text(searchList[i].roadAddress)
							.font(.caption)
							.foregroundStyle(.gray)
					}
				}
			}
			.navigationTitle(Text("만둣국 맛집 리스트"))
		}
		.onAppear {
			searchList = DataManager.shared.searchResult?.items ?? []
		}
	}
}

//#Preview {
//	DumplingSoupView(selectedFood: foodData.nutrition[5])
//}
