// Source: https://github.com/siteline/swiftui-introspect
/**
 MIT License:
 
 Copyright 2019 Timber Software
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
#if !os(watchOS)
    import Foundation

    enum PlatformVersionCondition: Sendable {
        case past
        case current
        case future
    }

    protocol PlatformVersion: Sendable {
        var condition: PlatformVersionCondition? { get }
    }

    extension PlatformVersion {
        var isCurrent: Bool {
            self.condition == .current
        }

        var isCurrentOrPast: Bool {
            self.condition == .current || self.condition == .past
        }
  
        var condition: PlatformVersionCondition? { nil }
    }

    struct iOSVersion: PlatformVersion {
        let condition: PlatformVersionCondition?

        init(condition: () -> PlatformVersionCondition?) {
            self.condition = condition()
        }
    }

    extension iOSVersion {
        static let v13 = iOSVersion {
            #if os(iOS)
                if #available(iOS 14, *) {
                    return .past
                }
                if #available(iOS 13, *) {
                    return .current
                }
                return .future
            #else
                return nil
            #endif
        }

        static let v14 = iOSVersion {
            #if os(iOS)
                if #available(iOS 15, *) {
                    return .past
                }
                if #available(iOS 14, *) {
                    return .current
                }
                return .future
            #else
                return nil
            #endif
        }

        static let v15 = iOSVersion {
            #if os(iOS)
                if #available(iOS 16, *) {
                    return .past
                }
                if #available(iOS 15, *) {
                    return .current
                }
                return .future
            #else
                return nil
            #endif
        }

        static let v16 = iOSVersion {
            #if os(iOS)
                if #available(iOS 17, *) {
                    return .past
                }
                if #available(iOS 16, *) {
                    return .current
                }
                return .future
            #else
                return nil
            #endif
        }

        static let v17 = iOSVersion {
            #if os(iOS)
                if #available(iOS 18, *) {
                    return .past
                }
                if #available(iOS 17, *) {
                    return .current
                }
                return .future
            #else
                return nil
            #endif
        }

        static let v18 = iOSVersion {
            #if os(iOS)
                if #available(iOS 19, *) {
                    return .past
                }
                if #available(iOS 18, *) {
                    return .current
                }
                return .future
            #else
                return nil
            #endif
        }

        static let v26 = iOSVersion {
            #if os(iOS)
                if #available(iOS 27, *) {
                    return .past
                }
                // Apps built before the iOS 26 SDK get "19.0" as the system version from ProcessInfo.
                // Once built with the iOS 26 SDK, the version then becomes "26.0".
                if #available(iOS 19, *) {
                    return .current
                }
                return .future
            #else
                return nil
            #endif
        }
    }

    struct tvOSVersion: PlatformVersion {
        let condition: PlatformVersionCondition?

        init(condition: () -> PlatformVersionCondition?) {
            self.condition = condition()
        }
    }

    extension tvOSVersion {
        static let v13 = tvOSVersion {
            #if os(tvOS)
                if #available(tvOS 14, *) {
                    return .past
                }
                if #available(tvOS 13, *) {
                    return .current
                }
                return .future
            #else
                return nil
            #endif
        }

        static let v14 = tvOSVersion {
            #if os(tvOS)
                if #available(tvOS 15, *) {
                    return .past
                }
                if #available(tvOS 14, *) {
                    return .current
                }
                return .future
            #else
                return nil
            #endif
        }

        static let v15 = tvOSVersion {
            #if os(tvOS)
                if #available(tvOS 16, *) {
                    return .past
                }
                if #available(tvOS 15, *) {
                    return .current
                }
                return .future
            #else
                return nil
            #endif
        }

        static let v16 = tvOSVersion {
            #if os(tvOS)
                if #available(tvOS 17, *) {
                    return .past
                }
                if #available(tvOS 16, *) {
                    return .current
                }
                return .future
            #else
                return nil
            #endif
        }
    
        static let v17 = tvOSVersion {
            #if os(tvOS)
                if #available(tvOS 18, *) {
                    return .past
                }
                if #available(tvOS 17, *) {
                    return .current
                }
                return .future
            #else
                return nil
            #endif
        }

        static let v18 = tvOSVersion {
            #if os(tvOS)
                if #available(tvOS 19, *) {
                    return .past
                }
                if #available(tvOS 18, *) {
                    return .current
                }
                return .future
            #else
                return nil
            #endif
        }

        static let v26 = tvOSVersion {
            #if os(tvOS)
                if #available(tvOS 27, *) {
                    return .past
                }
                // Apps built before the tvOS 26 SDK get "19.0" as the system version from ProcessInfo.
                // Once built with the tvOS 26 SDK, the version then becomes "26.0".
                if #available(tvOS 19, *) {
                    return .current
                }
                return .future
            #else
                return nil
            #endif
        }
    }

    struct macOSVersion: PlatformVersion {
        let condition: PlatformVersionCondition?

        init(condition: () -> PlatformVersionCondition?) {
            self.condition = condition()
        }
    }

    extension macOSVersion {
        static let v10_15 = macOSVersion {
            #if os(macOS)
                if #available(macOS 11, *) {
                    return .past
                }
                if #available(macOS 10.15, *) {
                    return .current
                }
                return .future
            #else
                return nil
            #endif
        }

        static let v10_15_4 = macOSVersion {
            #if os(macOS)
                if #available(macOS 11, *) {
                    return .past
                }
                if #available(macOS 10.15.4, *) {
                    return .current
                }
                return .future
            #else
                return nil
            #endif
        }

        static let v11 = macOSVersion {
            #if os(macOS)
                if #available(macOS 12, *) {
                    return .past
                }
                if #available(macOS 11, *) {
                    return .current
                }
                return .future
            #else
                return nil
            #endif
        }

        static let v12 = macOSVersion {
            #if os(macOS)
                if #available(macOS 13, *) {
                    return .past
                }
                if #available(macOS 12, *) {
                    return .current
                }
                return .future
            #else
                return nil
            #endif
        }

        static let v13 = macOSVersion {
            #if os(macOS)
                if #available(macOS 14, *) {
                    return .past
                }
                if #available(macOS 13, *) {
                    return .current
                }
                return .future
            #else
                return nil
            #endif
        }

        static let v14 = macOSVersion {
            #if os(macOS)
                if #available(macOS 15, *) {
                    return .past
                }
                if #available(macOS 14, *) {
                    return .current
                }
                return .future
            #else
                return nil
            #endif
        }

        static let v15 = macOSVersion {
            #if os(macOS)
                if #available(macOS 16, *) {
                    return .past
                }
                if #available(macOS 15, *) {
                    return .current
                }
                return .future
            #else
                return nil
            #endif
        }

        static let v26 = macOSVersion {
            #if os(macOS)
                if #available(macOS 27, *) {
                    return .past
                }
                // Apps built before the macOS 26 SDK get "16.0" as the system version from ProcessInfo.
                // Once built with the macOS 26 SDK, the version then becomes "26.0".
                if #available(macOS 16, *) {
                    return .current
                }
                return .future
            #else
                return nil
            #endif
        }
    }

    struct visionOSVersion: PlatformVersion {
        let condition: PlatformVersionCondition?

        init(condition: () -> PlatformVersionCondition?) {
            self.condition = condition()
        }
    }

    extension visionOSVersion {
        static let v1 = visionOSVersion {
            #if os(visionOS)
                if #available(visionOS 2, *) {
                    return .past
                }
                if #available(visionOS 1, *) {
                    return .current
                }
                return .future
            #else
                return nil
            #endif
        }

        static let v2 = visionOSVersion {
            #if os(visionOS)
                if #available(visionOS 3, *) {
                    return .past
                }
                if #available(visionOS 2, *) {
                    return .current
                }
                return .future
            #else
                return nil
            #endif
        }

        static let v26 = visionOSVersion {
            #if os(visionOS)
                if #available(visionOS 27, *) {
                    return .past
                }
                // Apps built before the visionOS 26 SDK get "3.0" as the system version from ProcessInfo.
                // Once built with the visionOS 26 SDK, the version then becomes "26.0".
                if #available(visionOS 3, *) {
                    return .current
                }
                return .future
            #else
                return nil
            #endif
        }
    }
#endif
