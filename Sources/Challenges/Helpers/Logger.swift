import os.log

enum Logger {
    static func debug(
        message: Any?...,
        file: StaticString = #file,
        function: StaticString = #function,
        line: UInt = #line
    ) {
        let logger = os.Logger(subsystem: "grind75", category: "\(file):\(function):\(line)")
        for log in message {
            let logMessage = if let log {
                "\(log)"
            } else {
                "\(String(describing: log))"
            }
            
            logger.debug("\(logMessage)")
        }
    }
}
