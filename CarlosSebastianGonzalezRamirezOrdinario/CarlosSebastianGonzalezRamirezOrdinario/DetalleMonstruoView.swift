import SwiftUI

struct DetalleMonstruoView: View {
    let monstruo: Monstruo
    @AppStorage("nombre") private var nombre = ""

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            ScrollView {
                VStack(spacing: 15) {
                    Text(monstruo.name.uppercased()).font(.title)

                    AsyncImage(url: URL(string: monstruo.image)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable().scaledToFit()
                        case .failure:
                            Image(systemName: "photo").foregroundColor(.gray)
                        }
                    }.frame(width: 250, height: 250).clipShape(RoundedRectangle(cornerRadius: 10))

                    Text("\(nombre), Hey Listen!").font(.caption)

                    Text(monstruo.description).font(.caption).multilineTextAlignment(.center)

                    if let lugares = monstruo.commonLocations {
                        Text("COMMON LOCATIONS").font(.headline)
                        ForEach(lugares, id: \.self) { lugar in
                            Text(lugar).font(.caption)
                        }
                    }

                    if let objetos = monstruo.drops {
                        Text("DROPPABLE ITEMS").font(.headline)
                        ForEach(objetos, id: \.self) { objeto in
                            Text(objeto).font(.caption)
                        }
                    }
                }.foregroundColor(.yellow).frame(maxWidth: .infinity).padding()
            }
        }
    }
}

