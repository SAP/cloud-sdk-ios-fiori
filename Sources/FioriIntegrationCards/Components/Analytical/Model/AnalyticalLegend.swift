//
//  AnalyticalLegend.swift
//  FioriIntegrationCards
//
//  Created by Ma, Xiao on 3/11/20.
//

import Foundation

public struct AnalyticalLegend: Decodable {
    public let title: String?
    public let drawingEffect: DrawingEffect?
    public let isHierarchical: Bool?
    public let isScrollable: Bool?
    public let isVisible: Bool?
    
    private var placeholders: Dictionary<String, String> = [:]
    
    private var _drawingEffectBacking: String? = "normal"
    private var _isHierarchicalBacking: String? = "false"
    private var _isScrollableBacking: String? = "false"
    private var _isVisibleBacking: String? = "false"
    
    private enum CodingKeys: String, CodingKey {
        case title, drawingEffect, isHierarchical, isScrollable, isVisible = "visible"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        drawingEffect = try container.decodeIfPresent(DrawingEffect.self, forKey: .drawingEffect)
        do {
            isHierarchical = try container.decodeIfPresent(Bool.self, forKey: .isHierarchical)
            _isHierarchicalBacking = String(describing: isHierarchical)
        } catch DecodingError.typeMismatch {
            _isHierarchicalBacking = try? container.decode(String.self, forKey: .isHierarchical)
            isHierarchical = nil
        }
        do {
            isScrollable = try container.decodeIfPresent(Bool.self, forKey: .isScrollable)
            _isScrollableBacking = String(describing: isScrollable)
        } catch DecodingError.typeMismatch {
            _isScrollableBacking = try? container.decode(String.self, forKey: .isScrollable)
            isScrollable = nil
        }
        do {
            isVisible = try container.decodeIfPresent(Bool.self, forKey: .isVisible)
            _isVisibleBacking = String(describing: isVisible)
        } catch DecodingError.typeMismatch {
            _isVisibleBacking = try? container.decode(String.self, forKey: .isVisible)
            isVisible = nil
        }
    }
    
    public init(title: String?, drawingEffect: DrawingEffect?, isHierarchical: Bool?, isScrollable: Bool?, isVisible: Bool?) {
        self.title = title
        self.drawingEffect = drawingEffect
        self.isHierarchical = isHierarchical
        self.isScrollable = isScrollable
        self.isVisible = isVisible
        
        if isHierarchical != nil {
            _isHierarchicalBacking = String(describing: isHierarchical)
        }
        
        if isScrollable != nil {
            _isScrollableBacking = String(describing: isScrollable)
        }
        
        if isVisible != nil {
            _isVisibleBacking = String(describing: isVisible)
        }
    }
}

extension AnalyticalLegend: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> AnalyticalLegend {
        let _title = title?.replacingPlaceholders(withValuesIn: object)
        let _drawingEffect = DrawingEffect(rawValue: String(describing: drawingEffect?.rawValue ?? _drawingEffectBacking).replacingPlaceholders(withValuesIn: object))
        let _isHierarchical = _isHierarchicalBacking?.replacingPlaceholdersToBoolean(withValuesIn: object)
        let _isScrollable = _isScrollableBacking?.replacingPlaceholdersToBoolean(withValuesIn: object)
        let _isVisible = _isVisibleBacking?.replacingPlaceholdersToBoolean(withValuesIn: object)
        return AnalyticalLegend(title: _title, drawingEffect: _drawingEffect, isHierarchical: _isHierarchical, isScrollable: _isScrollable, isVisible: _isVisible)
    }
    
    
}

public enum DrawingEffect: String, Codable {
    case normal, glossy
}
