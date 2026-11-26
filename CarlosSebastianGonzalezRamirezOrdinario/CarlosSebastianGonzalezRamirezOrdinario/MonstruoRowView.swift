import SwiftUI

struct MonstruoRowView: View {
    let monstruo: Monstruo

    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: URL(string: monstruo.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable().scaledToFill()
                case .failure:
                    Image(systemName: "photo").foregroundColor(.gray)
                }
            }.frame(width: 60, height: 60).clipShape(RoundedRectangle(cornerRadius: 10))

            VStack(alignment: .leading) {
                Text(monstruo.name.uppercased()).foregroundColor(.yellow)
                Text("\(monstruo.id)").font(.caption).foregroundColor(.blue)
            }

            Spacer()
        }
    }
}
