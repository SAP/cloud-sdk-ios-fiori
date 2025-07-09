// Source: https://github.com/siteline/swiftui-introspect
/**
 MIT License:
 
 Copyright 2019 Timber Software
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
#if !os(watchOS)
    import SwiftUI

    @MainActor
    struct PlatformViewVersionPredicate<SwiftUIViewType: IntrospectableViewType, PlatformSpecificEntity: PlatformEntity> {
        let selector: IntrospectionSelector<PlatformSpecificEntity>?

        private init<Version: PlatformVersion>(
            _ versions: [PlatformViewVersion<Version, SwiftUIViewType, PlatformSpecificEntity>],
            matches: (PlatformViewVersion<Version, SwiftUIViewType, PlatformSpecificEntity>) -> Bool
        ) {
            if let matchingVersion = versions.first(where: matches) {
                self.selector = matchingVersion.selector ?? .default
            } else {
                self.selector = nil
            }
        }

        static func iOS(_ versions: iOSViewVersion<SwiftUIViewType, PlatformSpecificEntity>...) -> Self {
            Self(versions, matches: \.isCurrent)
        }
    
        static func iOS(_ versions: PartialRangeFrom<iOSViewVersion<SwiftUIViewType, PlatformSpecificEntity>>) -> Self {
            Self([versions.lowerBound], matches: \.isCurrentOrPast)
        }

        static func tvOS(_ versions: tvOSViewVersion<SwiftUIViewType, PlatformSpecificEntity>...) -> Self {
            Self(versions, matches: \.isCurrent)
        }

        static func tvOS(_ versions: PartialRangeFrom<tvOSViewVersion<SwiftUIViewType, PlatformSpecificEntity>>) -> Self {
            Self([versions.lowerBound], matches: \.isCurrentOrPast)
        }

        static func macOS(_ versions: macOSViewVersion<SwiftUIViewType, PlatformSpecificEntity>...) -> Self {
            Self(versions, matches: \.isCurrent)
        }

        static func macOS(_ versions: PartialRangeFrom<macOSViewVersion<SwiftUIViewType, PlatformSpecificEntity>>) -> Self {
            Self([versions.lowerBound], matches: \.isCurrentOrPast)
        }

        static func visionOS(_ versions: visionOSViewVersion<SwiftUIViewType, PlatformSpecificEntity>...) -> Self {
            Self(versions, matches: \.isCurrent)
        }

        static func visionOS(_ versions: PartialRangeFrom<visionOSViewVersion<SwiftUIViewType, PlatformSpecificEntity>>) -> Self {
            Self([versions.lowerBound], matches: \.isCurrentOrPast)
        }
    }

    typealias iOSViewVersion<SwiftUIViewType: IntrospectableViewType, PlatformSpecificEntity: PlatformEntity> =
        PlatformViewVersion<iOSVersion, SwiftUIViewType, PlatformSpecificEntity>
    typealias tvOSViewVersion<SwiftUIViewType: IntrospectableViewType, PlatformSpecificEntity: PlatformEntity> =
        PlatformViewVersion<tvOSVersion, SwiftUIViewType, PlatformSpecificEntity>
    typealias macOSViewVersion<SwiftUIViewType: IntrospectableViewType, PlatformSpecificEntity: PlatformEntity> =
        PlatformViewVersion<macOSVersion, SwiftUIViewType, PlatformSpecificEntity>
    typealias visionOSViewVersion<SwiftUIViewType: IntrospectableViewType, PlatformSpecificEntity: PlatformEntity> =
        PlatformViewVersion<visionOSVersion, SwiftUIViewType, PlatformSpecificEntity>

    @MainActor
    enum PlatformViewVersion<Version: PlatformVersion, SwiftUIViewType: IntrospectableViewType, PlatformSpecificEntity: PlatformEntity>: Sendable {
        case available(Version, IntrospectionSelector<PlatformSpecificEntity>?)
        case unavailable

        init(for version: Version, selector: IntrospectionSelector<PlatformSpecificEntity>? = nil) {
            self = .available(version, selector)
        }

        static func unavailable(file: StaticString = #file, line: UInt = #line) -> Self {
            let filePath = file.withUTF8Buffer { String(decoding: $0, as: UTF8.self) }
            let fileName = URL(fileURLWithPath: filePath).lastPathComponent
            print(
                """
                If you're seeing this, someone forgot to mark \(fileName):\(line) as unavailable.

                This won't have any effect, but it should be disallowed altogether.

                Please report it upstream so we can properly fix it by using the following link:

                https://github.com/siteline/swiftui-introspect/issues/new?title=`\(fileName):\(line)`+should+be+marked+unavailable
                """
            )
            return .unavailable
        }

        private var version: Version? {
            if case .available(let version, _) = self {
                return version
            } else {
                return nil
            }
        }

        @MainActor
        fileprivate var selector: IntrospectionSelector<PlatformSpecificEntity>? {
            if case .available(_, let selector) = self {
                return selector
            } else {
                return nil
            }
        }

        fileprivate var isCurrent: Bool {
            self.version?.isCurrent ?? false
        }

        fileprivate var isCurrentOrPast: Bool {
            self.version?.isCurrentOrPast ?? false
        }
    }

    // This conformance isn't meant to be used directly by the user,
    // it's only to satisfy requirements for forming ranges (e.g. `.v15...`).
    extension PlatformViewVersion: Comparable {
        public nonisolated static func == (lhs: Self, rhs: Self) -> Bool {
            true
        }

        public nonisolated static func < (lhs: Self, rhs: Self) -> Bool {
            true
        }
    }
#endif
