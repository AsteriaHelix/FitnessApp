//
//  ContentView.swift
//  Fitness
//
//  Created by Awais Majeed on 01.10.2024.
//
import SwiftUI

// Exercise structure
struct Exercise: Identifiable {
    var id = UUID() // Unique ID for each exercise
    var name: String
    var usesWeight: Bool
    var usesSets: Bool
    var usesReps: Bool
}

// ContentView which shows a list of exercises and allows adding or deleting exercises
struct ContentView: View {
    @State private var exercises = [
        Exercise(name: "Bizeps", usesWeight: true, usesSets: true, usesReps: true),
        Exercise(name: "Trizeps", usesWeight: true, usesSets: true, usesReps: true),
        Exercise(name: "Brust", usesWeight: true, usesSets: true, usesReps: true),
        Exercise(name: "Rücken", usesWeight: true, usesSets: true, usesReps: true),
        Exercise(name: "Beine", usesWeight: true, usesSets: true, usesReps: true),
        Exercise(name: "Laufband", usesWeight: false, usesSets: false, usesReps: false)
    ]
    
    @State private var showingAddExercise = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(exercises) { exercise in
                    NavigationLink(destination: ExerciseDetailView(exercise: exercise)) {
                        Text(exercise.name)
                    }
                }
                .onDelete(perform: deleteExercise)
            }
            .navigationTitle("Workout Übungen")
            .toolbar { // Replacing navigationBarItems with toolbar for macOS
                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        showingAddExercise.toggle()
                    }) {
                        Text("Übung hinzufügen")
                    }
                }
            }
            .sheet(isPresented: $showingAddExercise) {
                AddExerciseView(exercises: $exercises)
            }
        }
    }
    
    func deleteExercise(at offsets: IndexSet) {
        exercises.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
