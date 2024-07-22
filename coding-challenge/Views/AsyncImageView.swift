import SwiftUI

struct AsyncImageView: View {
    var imageUrl: String
    var body: some View {
        AsyncImage(
            url: URL(string: imageUrl),
            content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 500, maxHeight: 300, alignment: .topLeading)
                    .clipped()
                    .cornerRadius(10)
            },
            placeholder: {
                ProgressView()
                    .frame(maxWidth: 500, minHeight: 300)
            }
        )
    }
}

#Preview {
    AsyncImageView(imageUrl: "someimage")
}
