import SwiftUI

struct NotificationChip: ViewModifier {
    @Binding var isPresented: Bool
    
    let title: String
    let symbolName: String
    let duration: Double
    
    @State private var opacity = 1.0
    
    func body(content: Content) -> some View {
        content
            .overlay {
                HStack(spacing: 8) {
                    Image(systemName: symbolName)
                        .resizable()
                        .frame(width: 16, height: 16)
                    
                    Text(title)
                        .bold()
                }
                .padding(24)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .opacity(isPresented ? 1.0 : 0.0)
                .onTapGesture {
                    /// Hides it immediately when tapped.
                    hide(after: 0)
                }
                .onAppear {
                    defer {
                        hide(after: 1.33, during: 0.67)
                    }
                    show(with: 0.33)
                }
            }
    }
    
    func show(with duration: Double) {
        withAnimation(.easeIn(duration: duration)) {
            opacity = 1.0
        }
    }
    
    /// Hides the NotificationChip over time.
    func hide(
        after delay: Double = 0.0,
        during duration: Double = 0.0
    ) {
        ///
        DispatchQueue.main.asyncAfter(
            deadline: .now() + delay
        ) {
            withAnimation(.easeOut(duration: duration)) {
                opacity = 0.0
            }
        }
    }
}

public extension View {
    func notificationChip(
        isPresented: Binding<Bool>,
        title: String,
        symbolName: String,
        duration: Double
    ) -> some View {
        modifier(
            NotificationChip(
                isPresented: isPresented,
                title: title,
                symbolName: symbolName,
                duration: duration
            )
        )
    }
}

#Preview {
    Color.white
        .notificationChip(
            isPresented: .constant(true),
            title: "Added to playlist",
            symbolName: "star.fill",
            duration: 1.33
        )
}
