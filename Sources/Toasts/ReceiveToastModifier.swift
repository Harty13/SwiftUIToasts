import SwiftUI

@available(iOS 13.0, *)
struct ReceiveToastModifier<ToastContent: View>: ViewModifier {
    @State private var receivedToast: Toast?
    @State private var isShowingToast = false
    @ViewBuilder let toastContent: (Toast?) -> ToastContent
    
    func body(content: Content) -> some View {
        content
            .onReceive(Toasts.shared.toastPublisher) { toast in
                withAnimation(receivedToast?.animation) {
                    receivedToast = toast
                    isShowingToast = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration) {
                        withAnimation(receivedToast?.animation) {
                            isShowingToast = false
                        }
                    }
                }
            }
            .overlay(
                Group {
                    if isShowingToast {
                        toastContent(receivedToast)
                    }
                }
            )
    }
}

@available(iOS 13.0, *)
extension View {
    public func onReceiveToast<ToastContent: View>(@ViewBuilder toastContent: @escaping (Toast?) -> ToastContent) -> some View {
        modifier(ReceiveToastModifier(toastContent: toastContent))
    }
}
