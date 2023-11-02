//
//  SeasonedGrilledEelView.swift
//  FoodNutrition
//
//  Created by Minjae Kim on 11/2/23.
//

import SwiftUI

struct SeasonedGrilledEelView: View {
	
	@Binding var nutrition: Nutrition
	
	var body: some View {
		Text(nutrition.descKor)
	}
}

#Preview {
    @StateObject var foodStore: FoodStore = FoodStore(food: foodData)
    return SeasonedGrilledEelView(nutrition: $foodStore.food.nutrition[2])
}
