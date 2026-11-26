import SwiftUI

struct ContentView: View {
    @AppStorage("nombre") private var nombre = ""

    var body: some View {
        NavigationStack {
            ZStack {
                Image("fondo (1)").resizable().scaledToFill().ignoresSafeArea()

                VStack(spacing: 20) {
                    Text("Te llamas").foregroundColor(.yellow)

                    TextField("Nombre", text: $nombre).padding().background(.black.opacity(0.6)).foregroundColor(.yellow).cornerRadius(10)

                    NavigationLink(destination: MonstruosView()) {
                        Text("Comenzar").padding().background(.yellow).foregroundColor(.black).cornerRadius(10)
                    }
                }.padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
