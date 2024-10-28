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
        self.timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: repeats) { _ in
            completion()
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
