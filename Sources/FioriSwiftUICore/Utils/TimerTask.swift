import Foundation

protocol ScheduledTask {
    func start(interval: TimeInterval, repeats: Bool, completion: @escaping () -> Void)
    func stop()
    func cancel()
}

class TimerTask: ScheduledTask {
    private var timer: Timer?
      
    func start(interval: TimeInterval, repeats: Bool = false, completion: @escaping () -> Void) {
        self.timer?.invalidate()
        // Timer fires on the main run loop; safely hand the non-Sendable
        // completion off via the main actor.
        nonisolated(unsafe) let completion = completion
        self.timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: repeats) { _ in
            MainActor.assumeIsolated {
                completion()
            }
        }
    }
      
    func stop() {
        self.timer?.invalidate()
        self.timer = nil
    }
      
    func cancel() {
        self.stop()
    }
}
