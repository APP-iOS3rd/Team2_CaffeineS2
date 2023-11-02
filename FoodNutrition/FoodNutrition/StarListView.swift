//
//  StarListView.swift
//  FoodNutrition
//
//  Created by Minjae Kim on 11/2/23.
//

import SwiftUI

struct StarListView: View {
	
	@EnvironmentObject var foodStore: FoodStore
	
	var body: some View {
		List(0..<foodStore.food.nutrition.count, id: \.self) { i in
			if foodStore.food.nutrition[i].isStar {
				switch foodStore.food.nutrition[i].descKor {
				case "떡만둣국":
					NavigationLink(destination: DumplingSoupView(selectedFood: $foodStore.food.nutrition[i])) {
						FoodListCell(imageName: foodStore.food.nutrition[i].imageName, foodName: foodStore.food.nutrition[i].descKor, isStar: foodStore.food.nutrition[i].isStar)
					}
				default:
					VStack { }
				}
			}
		}
		.navigationTitle(Text("즐겨찾기"))
	}
}

//#Preview {
//	StarListView()
//}
