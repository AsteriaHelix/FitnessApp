//
//  TimerView.swift
//  Fitness
//
//  Created by Awais Majeed on 01.10.2024.
//

import SwiftUI

struct TimerView: View {
    @State private var timeRemaining = 60
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @State private var isTimerRunning = false // Steuerung, ob der Timer läuft

    var body: some View {
        VStack {
            Text("Pause: \(timeRemaining) Sekunden")
                .font(.largeTitle)
                .padding()
            
            if timeRemaining > 0 {
                Text("Zeit für eine Pause...").padding()
            } else {
                Text("Pause vorbei!").foregroundColor(.red).padding()
            }
            
            // Button zum Starten des Timers
            Button(action: {
                startTimer()
            }) {
                Text("Timer Starten")
                    .font(.title)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(isTimerRunning) // Deaktivieren, wenn der Timer bereits läuft
            
            // Button zum Stoppen des Timers
            Button(action: {
                stopTimer()
            }) {
                Text("Timer Stoppen")
                    .font(.title)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(!isTimerRunning) // Deaktivieren, wenn der Timer nicht läuft
        }
        .onReceive(timer) { _ in
            if isTimerRunning && timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .padding()
    }

    // Funktion zum Starten des Timers
    func startTimer() {
        timeRemaining = 60 // Setze den Timer zurück
        isTimerRunning = true // Timer läuft jetzt
    }
    
    // Funktion zum Stoppen des Timers
    func stopTimer() {
        isTimerRunning = false // Timer anhalten
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
