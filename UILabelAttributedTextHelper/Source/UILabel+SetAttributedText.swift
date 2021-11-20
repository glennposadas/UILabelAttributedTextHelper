//
//  UILabel+SetAttributedText.swift
//  UILabelAttributedTextHelper
//
//  Created by Glenn Posadas on 11/19/21.
//

import UIKit

extension UILabel {
    /**
     Sets up the label with two different kinds of attributes in its attributed text.
     
     Important:
     ```
     - leadingString = "Total:"
     - trailingString = "123"
     - This means that the function will concat the trailingString
     to the leadingString.
     ```
     
     Parameters:
     - leadingString: the normal attributed text.
     - leadingTextColor: the text color for the leading text.
     - leadingTextFont: the font for the leading text
     - trailingString: the bold or highlighted text. adding or setting this parameter is optional.
     - trailingTextColor: optional trailing text color
     - trailingTextFont: optional trailing text font.
     - textAlignment: the text alignment of the whole attributed text. Defaults to .natural type.
     - numberOfLines: the number of lines. Default is 1.
     - lineHeightMultiple: the line height multiple. Default is 1.
     - lineSpacing: the line line spacing. Default is 1.
     */
    func setAttributedText(leadingText: String,
                           leadingTextColor: UIColor,
                           leadingTextFont: UIFont,
                           trailingText: String? = nil,
                           trailingTextColor: UIColor? = nil,
                           trailingTextFont: UIFont? = nil,
                           textAlignment: NSTextAlignment = .natural,
                           numberOfLines: Int = 1,
                           lineHeightMultiple: CGFloat = 1,
                           lineSpacing: CGFloat = 1) {
        var completeString = leadingText
        var textToBeHighlighted = ""
        
        if let trailingString = trailingText {
            textToBeHighlighted = trailingString
            completeString = "\(completeString) \(trailingString)"
        }
        
        let commonSetup = getCommonSetup(completeString: completeString,
                                         primaryTextColor: leadingTextColor,
                                         primaryFont: leadingTextFont,
                                         textToBeHighlighted: textToBeHighlighted,
                                         secondaryTextColor: trailingTextColor,
                                         secondaryTextFont: trailingTextFont,
                                         textAlignment: textAlignment,
                                         numberOfLines: numberOfLines,
                                         lineHeightMultiple: lineHeightMultiple,
                                         lineSpacing: lineSpacing)
        
        attributedText = commonSetup.completeAttributedString
    }
    
    /**
     Sets up the label with two different kinds of attributes in its attributed text.
     
     - Important:
     - primaryString = "Total:"
     - secondaryString = "123"
     - This means that the function will concat the secondary string into the primary string and highlights the secondary string.
     - Using the highlightedText means the highlightedText itself is in the primaryString.
     
     - Parameters:
     - primaryString: the normal attributed string.
     - secondaryString: the bold or highlighted string.
     - highlightedText: this one is like the secondary string, if this is provided, then the secondaryString is ignored. This is to be used if the highlighted text is not to be concatinated at the end of the primaryString
     - highlightAllFoundHighlightedText: Bool defaults to false. This will allow the method to highlight all the equal texts found in the whole string. For instance, if you want to highlight all the existing words that are equal to "FREE", then set it to true.
     */
    /**
     Sets up the label with two different kinds of attributes in its attributed text.
     
     Important:
     ```
     - leadingString = "Total:"
     - trailingString = "123"
     - This means that the function will concat the trailingString
     to the leadingString.
     ```
     
     Parameters:
     - leadingString: the normal attributed text.
     - leadingTextColor: the text color for the leading text.
     - leadingTextFont: the font for the leading text
     - trailingString: the bold or highlighted text. adding or setting this parameter is optional.
     - trailingTextColor: optional trailing text color
     - trailingTextFont: optional trailing text font.
     - textAlignment: the text alignment of the whole attributed text. Defaults to .natural type.
     - numberOfLines: the number of lines. Default is 1.
     - lineHeightMultiple: the line height multiple. Default is 1.
     - lineSpacing: the line line spacing. Default is 1.
     */
    func setAttributedText(completeString: String,
                           textColor: UIColor,
                           font: UIFont,
                           highlightedText: String = "",
                           highlightedTextColor: UIColor? = nil,
                           highlightedTextFont: UIFont? = nil,
                           textAlignment: NSTextAlignment = .natural,
                           numberOfLines: Int = 1,
                           highlightAllOccurrence: Bool = true,
                           lineHeightMultiple: CGFloat = 1,
                           lineSpacing: CGFloat = 1) {
        let commonSetup = getCommonSetup(completeString: completeString,
                                         primaryTextColor: textColor,
                                         primaryFont: font,
                                         textToBeHighlighted: highlightedText,
                                         secondaryTextColor: highlightedTextColor,
                                         secondaryTextFont: highlightedTextFont,
                                         textAlignment: textAlignment,
                                         numberOfLines: numberOfLines,
                                         lineHeightMultiple: lineHeightMultiple,
                                         lineSpacing: lineSpacing)
        
        let completeAttributedString = commonSetup.completeAttributedString
        let secondAttributes = commonSetup.secondAttributes
        
        if highlightAllOccurrence {
            let nsRanges = completeString.nsRanges(of: highlightedText)
            for nsRange in nsRanges {
                completeAttributedString.addAttributes(secondAttributes, range: nsRange)
            }
        }
        
        attributedText = completeAttributedString
    }
    
    /// Tuple for common setup.
    typealias AttributedTextAndSecondAttributes = (completeAttributedString: NSMutableAttributedString, secondAttributes: [NSAttributedString.Key: Any])
    
    /**
     The common setup method.
     
     - Returns: `AttributedTextAndSecondAttributes`
     */
    fileprivate func getCommonSetup(completeString: String,
                                    primaryTextColor: UIColor,
                                    primaryFont: UIFont,
                                    textToBeHighlighted: String,
                                    secondaryTextColor: UIColor? = nil,
                                    secondaryTextFont: UIFont? = nil,
                                    textAlignment: NSTextAlignment = .natural,
                                    numberOfLines: Int = 1,
                                    lineHeightMultiple: CGFloat = 1,
                                    lineSpacing: CGFloat = 1) -> AttributedTextAndSecondAttributes {
        
        self.numberOfLines = numberOfLines
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = textAlignment
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        paragraphStyle.lineSpacing = lineSpacing
        
        let completeAttributedString = NSMutableAttributedString(
            string: completeString, attributes: [
                .font: primaryFont,
                .foregroundColor: primaryTextColor,
                .paragraphStyle: paragraphStyle
            ]
        )
        
        let secondAttributes: [NSAttributedString.Key: Any] = [
            .font: secondaryTextFont ?? primaryFont,
            .foregroundColor: secondaryTextColor ?? primaryTextColor,
            .paragraphStyle: paragraphStyle
        ]
        
        let range = (completeString as NSString).range(of: textToBeHighlighted)
        
        completeAttributedString.addAttributes(secondAttributes, range: range)
        
        return (completeAttributedString, secondAttributes)
    }
}
