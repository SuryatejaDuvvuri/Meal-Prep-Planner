//
//  ContentView.swift
//  Meal-Prep-Planner
//
//  Created by Suryateja Duvvuri on 1/1/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack
        {
            Text("Offers buttons")
            
            Section
            {
                NavigationLink(destination: DurationView(), label: {
                    Text("Make a meal")
                })
            }
            
            .padding()
            .navigationBarTitle("Home Page")
        }
        
        
       
    }
}

struct DurationView : View {
    var body: some View {
        NavigationView
        {
            VStack
            {
                Text("Asks for duration for the meals")
                NavigationLink(destination: MealPlanView(), label: {
                    Text("5 mins")
                })
            }.navigationBarTitle("Duration Page")
                .navigationBarHidden(true)
                .padding()
        }
       
    }
}


struct MealPlanView : View {
    
    @State private var selectedMeals = ""
    @State private var meals: [String] = ["Mac and Cheese", "Pasta", "Curd rice"]
    var body: some View {
        NavigationStack{
            
            NavigationLink(destination: CheckIngredientsView(), label: {
                ForEach(meals, id: \.self)
                {   meal in
                    
                    Text(meal).frame(width: 100, height: 50).font(.headline).fontDesign(.rounded).background(.gray).foregroundColor(.white)

                }
            })
          
            
            .pickerStyle(.inline)
            .navigationBarTitle("Suggested meals")
        }
    }
}

struct CheckIngredientsView : View {
    var body: some View {
        NavigationView
        {
            NavigationLink(destination: TutorialView())
            {
                Text("Asks to check ingredients before tutorial")
            }
        }
    }
}

struct TutorialView : View {
    var body: some View {
        Text("Presents with embed tutorial as a scroll view. Go back to home page")
    } 
}

#Preview {
    ContentView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
