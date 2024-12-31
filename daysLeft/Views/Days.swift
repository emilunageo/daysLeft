//
//  Days.swift
//  daysLeft
//
//  Created by Emiliano Luna on 10/12/24.
//

import SwiftUI

struct DaysView: View {
    @State private var fechaSeleccionada: Date = Date()
    @State private var diasRestantes: Int? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Calculadora de Días Restantes")
                .font(.title)
                .padding()
            
            DatePicker("Selecciona una fecha", selection: $fechaSeleccionada, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            
            Button(action: {
                diasRestantes = calcularDiasRestantes(hasta: fechaSeleccionada)
            }) {
                Text("Calcular Días Restantes")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            if let dias = diasRestantes {
                Text("Días restantes: \(dias)")
                    .font(.headline)
            } else {
                Text("Selecciona una fecha para ver los días restantes.")
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding()
    }
    
    // Función para calcular los días restantes
    func calcularDiasRestantes(hasta fechaObjetivo: Date) -> Int? {
        let calendario = Calendar.current
        let fechaActual = Date()
        
        let inicioDiaActual = calendario.startOfDay(for: fechaActual)
        let inicioDiaObjetivo = calendario.startOfDay(for: fechaObjetivo)
        
        let componentes = calendario.dateComponents([.day], from: inicioDiaActual, to: inicioDiaObjetivo)
        
        return componentes.day
    }
}

struct DaysView_Previews: PreviewProvider {
    static var previews: some View {
        DaysView()
    }
}
