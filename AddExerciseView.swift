//
//  AddExerciseView.swift
//  Fitness
//
//  Created by Awais Majeed on 01.10.2024.
//

import SwiftUI

struct AddExerciseView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var exercises: [Exercise]
    
    @State private var name = ""
    @State private var usesWeight = false
    @State private var usesSets = false
    @State private var usesReps = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Übung hinzufügen")) {
                    TextField("Name der Übung", text: $name)
                    
                    Toggle("Verwendet Gewicht", isOn: $usesWeight)
                    Toggle("Verwendet Sätze", isOn: $usesSets)
                    Toggle("Verwendet Wiederholungen", isOn: $usesReps)
                }
                
                Button("Hinzufügen") {
                    let newExercise = Exercise(name: name, usesWeight: usesWeight, usesSets: usesSets, usesReps: usesReps)
                    exercises.append(newExercise)
                    presentationMode.wrappedValue.dismiss() // Schließt das Formular
                }
                .disabled(name.isEmpty) // Button deaktivieren, wenn der Name leer ist
            }
            .navigationTitle("Neue Übung") // Plattformübergreifende Nutzung
        }
    }
}

struct AddExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExerciseView(exercises: .constant([Exercise(name: "Bizeps", usesWeight: true, usesSets: true, usesReps: true)]))
    }
}
