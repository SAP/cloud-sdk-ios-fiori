import Foundation

public struct AnalyticalLegend: Decodable {
    public let title: String?
    public let drawingEffect: DrawingEffect?
    public let isHierarchical: Bool?
    public let isScrollable: Bool?
    public let isVisible: Bool?
    
    private var placeholders: [String: String] = [:]
    
    private var _drawingEffectBacking: String? = "normal"
    private var _isHierarchicalBacking: String? = "false"
    private var _isScrollableBacking: String? = "false"
    private var _isVisibleBacking: String? = "false"
    
    private enum CodingKeys: String, CodingKey {
        case title, drawingEffect, isHierarchical, isScrollable, isVisible = "visible"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.drawingEffect = try container.decodeIfPresent(DrawingEffect.self, forKey: .drawingEffect)
        do {
            self.isHierarchical = try container.decodeIfPresent(Bool.self, forKey: .isHierarchical)
            self._isHierarchicalBacking = String(describing: self.isHierarchical)
        } catch DecodingError.typeMismatch {
            self._isHierarchicalBacking = try? container.decode(String.self, forKey: .isHierarchical)
            self.isHierarchical = nil
        }
        do {
            self.isScrollable = try container.decodeIfPresent(Bool.self, forKey: .isScrollable)
            self._isScrollableBacking = String(describing: self.isScrollable)
        } catch DecodingError.typeMismatch {
            self._isScrollableBacking = try? container.decode(String.self, forKey: .isScrollable)
            self.isScrollable = nil
        }
        do {
            self.isVisible = try container.decodeIfPresent(Bool.self, forKey: .isVisible)
            self._isVisibleBacking = String(describing: self.isVisible)
        } catch DecodingError.typeMismatch {
            self._isVisibleBacking = try? container.decode(String.self, forKey: .isVisible)
            self.isVisible = nil
        }
    }
    
    public init(title: String?, drawingEffect: DrawingEffect?, isHierarchical: Bool?, isScrollable: Bool?, isVisible: Bool?) {
        self.title = title
        self.drawingEffect = drawingEffect
        self.isHierarchical = isHierarchical
        self.isScrollable = isScrollable
        self.isVisible = isVisible
        
        if isHierarchical != nil {
            self._isHierarchicalBacking = String(describing: isHierarchical)
        }
        
        if isScrollable != nil {
            self._isScrollableBacking = String(describing: isScrollable)
        }
        
        if isVisible != nil {
            self._isVisibleBacking = String(describing: isVisible)
        }
    }
}

extension AnalyticalLegend: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> AnalyticalLegend {
        let _title = self.title?.replacingPlaceholders(withValuesIn: object)
        let _drawingEffect = DrawingEffect(rawValue: String(describing: drawingEffect?.rawValue ?? self._drawingEffectBacking).replacingPlaceholders(withValuesIn: object))
        let _isHierarchical = self._isHierarchicalBacking?.replacingPlaceholdersToBoolean(withValuesIn: object)
        let _isScrollable = self._isScrollableBacking?.replacingPlaceholdersToBoolean(withValuesIn: object)
        let _isVisible = self._isVisibleBacking?.replacingPlaceholdersToBoolean(withValuesIn: object)
        return AnalyticalLegend(title: _title, drawingEffect: _drawingEffect, isHierarchical: _isHierarchical, isScrollable: _isScrollable, isVisible: _isVisible)
    }
}

public enum DrawingEffect: String, Codable {
    case normal, glossy
}
