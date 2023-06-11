import SwiftUI
import Combine

@available(iOS 13.0, *)
public class Toasts {
    public static let shared = Toasts()
    
    private var toastSubject = PassthroughSubject<Toast, Never>()
    
    public var toastPublisher: AnyPublisher<Toast, Never> {
        return toastSubject.eraseToAnyPublisher()
    }
    
    private init() {}
    
    public func addToast(_ toast: Toast) {
        toastSubject.send(toast)
    }
}

@available(iOS 13.0, *)
public struct Toast: Equatable {
    public var title: String
    public var symbolName: String?
    public var duration: TimeInterval
    public var animation: Animation?
    
    public init(
        title: String,
        symbolName: String? = nil,
        duration: TimeInterval = 1.0,
        animation: Animation? = Animation.default
    ) {
        self.title = title
        self.symbolName = symbolName
        self.duration = duration
        self.animation = animation
    }
}
