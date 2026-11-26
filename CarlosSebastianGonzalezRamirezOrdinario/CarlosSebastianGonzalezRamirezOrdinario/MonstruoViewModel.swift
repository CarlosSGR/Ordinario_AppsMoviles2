import Foundation
import Observation

@MainActor
@Observable
final class MonstruoViewModel {
    var monstruos: [Monstruo] = []
    var cargando = false
    var mensajeError = ""

    func obtenerMonstruos() async {
        let endPoint = "https://api.hyrule-compendium.com/v3/compendium/category/monsters"
        guard let apiURL = URL(string: endPoint) else {
            mensajeError = "URL no válida"
            return
        }

        var urlRequest = URLRequest(url: apiURL)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")

        cargando = true
        mensajeError = ""

        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)

            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                mensajeError = "El servidor no respondió"
                cargando = false
                return
            }

            let respuesta = try JSONDecoder().decode(RespuestaMonstruos.self, from: data)
            monstruos = respuesta.data
        } catch {
            mensajeError = "No se pudieron descargar los datos"
        }
        cargando = false
    }
}
