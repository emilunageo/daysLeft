import SwiftUI
import Foundation

struct Home: View {
    @State private var name: String = "Emi"
    @State private var daysLeft: Int? = nil
    @State private var targetDateString: String = "21/02/2087"

    var body: some View {
        ZStack {
            // Fondo blanco
            Color.white
                .ignoresSafeArea()

            // VStack para "Days Left" y el número de días
            VStack {
                Text("Days Left:")
                    .font(.system(size: 22, weight: .bold, design: .monospaced))

                if let daysLeft = daysLeft {
                    Text("\(daysLeft)")
                        .font(.system(size: 40, weight: .thin, design: .monospaced))
                } else {
                    Text("Calculating...")
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                        .foregroundColor(.gray)
                }
            }
            // Posición específica para este VStack
            .position(x: 200, y: 150) // Cambia las coordenadas según lo que necesites

            // Botón "Editar"
            VStack {
                Button("Editar") {
                    // Acción del botón
                }
                .foregroundColor(.gray)
            }
            // Posición específica para el botón
            .position(x: 200, y: 750) // Cambia las coordenadas según lo que necesites
        }
        .onAppear {
            // Cálculo inicial de días restantes
            if let targetDate = convertStringToDate(dateString: targetDateString) {
                daysLeft = calculateRemainingDays(to: targetDate)
            }
        }
    }

    func calculateRemainingDays(to targetDate: Date) -> Int? {
        let calendar = Calendar.current
        let today = Date()

        let startOfToday = calendar.startOfDay(for: today)
        let startOfTargetDay = calendar.startOfDay(for: targetDate)

        let components = calendar.dateComponents([.day], from: startOfToday, to: startOfTargetDay)
        return components.day
    }

    func convertStringToDate(dateString: String, format: String = "dd/MM/yyyy") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "es_ES")
        return formatter.date(from: dateString)
    }
}

// Preview provider
#Preview {
    Home()
}
