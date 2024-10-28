//
//  ExerciseDetailView.swift
//  Fitness
//
//  Created by Awais Majeed on 01.10.2024.
//

import SwiftUI

struct ExerciseDetailView: View {
    var exercise: Exercise
    
    @State private var sets: Int = 0
    @State private var reps: Int = 0
    @State private var weight: Double = 0.0
    @State private var distance: Double = 0.0
    @State private var calories: Int = 0
    
    var body: some View {
        VStack {
            Text(exercise.name)
                .font(.largeTitle)
                .padding()
            
            if exercise.usesWeight {
                Stepper("Gewicht: \(weight, specifier: "%.1f") kg", value: $weight, in: 0...200, step: 0.5)
                    .padding()
            }
            
            if exercise.usesSets {
                Stepper("Sätze: \(sets)", value: $sets, in: 0...10)
                    .padding()
            }
            
            if exercise.usesReps {
                Stepper("Wiederholungen: \(reps)", value: $reps, in: 0...20)
                    .padding()
            }
            
            if exercise.name == "Laufband" {
                Stepper("Distanz: \(distance, specifier: "%.1f") km", value: $distance, in: 0...20, step: 0.1)
                    .padding()
                
                Stepper("Kalorien: \(calories)", value: $calories, in: 0...1000)
                    .padding()
            }
            
            // Timer-Komponente hinzufügen
            TimerView() // Timer für Ruhezeit zwischen den Sätzen
            
            Spacer()
        }
        .navigationTitle(exercise.name)
        .padding()
    }
}

struct ExerciseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Vorschau für "Laufband"
        ExerciseDetailView(exercise: Exercise(name: "Laufband", usesWeight: false, usesSets: false, usesReps: false))
        
        // Vorschau für andere Übungen
        ExerciseDetailView(exercise: Exercise(name: "Bizeps", usesWeight: true, usesSets: true, usesReps: true))
    }
}
