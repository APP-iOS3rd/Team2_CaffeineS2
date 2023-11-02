//
//  ContentView.swift
//  FoodNutrition
//
//  Created by Minjae Kim on 11/2/23.
//

import SwiftUI

struct ContentView: View {
	
	@StateObject var foodStore: FoodStore = FoodStore(food: foodData)
	
	var body: some View {
		NavigationStack {
			List {
				NavigationLink(destination: ChickenRibsView()) {
					FoodListCell(imageName: foodStore.food.nutrition[0].imageName, foodName: foodStore.food.nutrition[0].descKor, isStar: foodStore.food.nutrition[0].isStar)
				}
				NavigationLink(destination: GrilledBeefView()) {
					FoodListCell(imageName: foodStore.food.nutrition[1].imageName, foodName: foodStore.food.nutrition[1].descKor, isStar: foodStore.food.nutrition[1].isStar)
				}
				NavigationLink(destination: SeasonedGrilledEelView()) {
					FoodListCell(imageName: foodStore.food.nutrition[2].imageName, foodName: foodStore.food.nutrition[2].descKor, isStar: foodStore.food.nutrition[2].isStar)
				}
				NavigationLink(destination: HamburgerSteakView()) {
					FoodListCell(imageName: foodStore.food.nutrition[3].imageName, foodName: foodStore.food.nutrition[3].descKor, isStar: foodStore.food.nutrition[3].isStar)
				}
				NavigationLink(destination: OysterGukbapView()) {
					FoodListCell(imageName: foodStore.food.nutrition[4].imageName, foodName: foodStore.food.nutrition[4].descKor, isStar: foodStore.food.nutrition[4].isStar)
				}
				NavigationLink(destination: DumplingSoupView(selectedFood: $foodStore.food.nutrition[5])) {
					FoodListCell(imageName: foodStore.food.nutrition[5].imageName, foodName: foodStore.food.nutrition[5].descKor, isStar: foodStore.food.nutrition[5].isStar)
				}
			}
			.toolbar {
				StarButton().environmentObject(foodStore)
			}
			.navigationTitle(Text("Food"))
		}
	}
	
	struct StarButton: View {
		
		@EnvironmentObject var foodStore: FoodStore
		
		var body: some View {
			NavigationLink(destination: StarListView().environmentObject(foodStore)) {
				Image(systemName: "star.fill")
					.resizable()
					.foregroundStyle(.yellow)
			}
		}
	}
}

#Preview {
	ContentView()
}

struct FoodListCell: View {
	let imageName: String
	let foodName: String
	let isStar: Bool
	
	var body: some View {
		HStack{
			Image(imageName)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 100, height: 60)
				.clipShape(.rect(cornerRadius: 6.0))
			Text(foodName)
			Spacer()
			isStar ? Image(systemName: "star.fill").foregroundStyle(.yellow) : Image(systemName: "star.fill").foregroundStyle(.gray)
		}
	}
}
