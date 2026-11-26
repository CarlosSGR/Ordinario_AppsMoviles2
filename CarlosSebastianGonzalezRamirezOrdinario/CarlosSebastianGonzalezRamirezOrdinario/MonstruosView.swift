import SwiftUI

struct MonstruosView: View {
    @State private var monstruoVM = MonstruoViewModel()

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(alignment: .leading) {
                Text("COMPENDIUM").font(.largeTitle).foregroundColor(.yellow).padding(.horizontal)

                if monstruoVM.cargando {
                    ProgressView().padding()
                }

                if !monstruoVM.mensajeError.isEmpty {
                    Text(monstruoVM.mensajeError).foregroundColor(.red).padding()
                }

                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 12) {
                        ForEach(monstruoVM.monstruos) { monstruo in
                            NavigationLink(destination: DetalleMonstruoView(monstruo: monstruo)) {
                                MonstruoRowView(monstruo: monstruo)
                            }
                        }
                    }.padding(.horizontal)
                }
            }
        }.task {
            await monstruoVM.obtenerMonstruos()
        }
    }
}

#Preview {
    NavigationStack {
        MonstruosView()
    }
}
