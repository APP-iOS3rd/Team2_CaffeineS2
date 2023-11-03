//
//  GrilledBeefView.swift
//  FoodNutrition
//
//  Created by Minjae Kim on 11/2/23.
//

import SwiftUI

struct GrilledBeefView: View {
	
	@Binding var nutrition: Nutrition
	
	@State private var searchList: [Item] = []
	
	var body: some View {
		List {
			ForEach(0..<searchList.count, id: \.self) { i in
				HStack {
					VStack(alignment: .leading) {
						Text(searchList[i].title.removeTag)
							.font(.headline)
						Text(searchList[i].roadAddress)
							.font(.caption)
							.foregroundStyle(.gray)
					}
				}
			}
			.navigationTitle(Text("소양념갈비구이 맛집 리스트"))
		}
		.onAppear {
			searchList = DataManager.shared.searchResult?.items ?? []
		}
	}
}

extension String {
	var removeTag: String {
		var value: String = self
		while value.contains("<b>") {
			value = value.replacingOccurrences(of: "<b>", with: "")
		}
		while value.contains("</b>") {
			value = value.replacingOccurrences(of: "</b>", with: "")
		}
		return value
	}
}

//#Preview {
//	GrilledBeefView()
//}
