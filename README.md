# UILabelAttributedTextHelper
A quick helper for setting attributed texts to UILabel.

<img width="415" alt="Screen Shot 2021-11-20 at 10 46 24 AM" src="https://user-images.githubusercontent.com/12502679/142711954-f0220d89-87b8-4837-beb4-988cccda4926.png">

### Sample usage:

        label.setAttributedText(
            leadingText: "Hello!",
            leadingTextColor: .red,
            leadingTextFont: .boldSystemFont(ofSize: 20)
        )
        
        
        label2.setAttributedText(
            leadingText: "Hello",
            leadingTextColor: .blue,
            leadingTextFont: .boldSystemFont(ofSize: 20),
            trailingText: ", World!",
            trailingTextColor: .red,
            trailingTextFont: .italicSystemFont(ofSize: 20),
            textAlignment: .left,
            numberOfLines: 2,
            lineHeightMultiple: 1,
            lineSpacing: 1
        )
        
        label3.setAttributedText(
            completeString: "I believe that hard work beats talent. This is case sensitive. I learned the value of hard work by working hard",
            textColor: .label,
            font: .systemFont(ofSize: 20),
            highlightedText: "hard work",
            highlightedTextColor: .blue,
            highlightedTextFont: .boldSystemFont(ofSize: 25),
            textAlignment: .right,
            numberOfLines: 0,
            highlightAllOccurrence: false,
            lineHeightMultiple: 1,
            lineSpacing: 1
        )
        
        label4.setAttributedText(
            completeString: "I believe that hard work beats talent. This is case sensitive. I learned the value of hard work by working hard",
            textColor: .label,
            font: .systemFont(ofSize: 20),
            highlightedText: "hard work",
            highlightedTextColor: .blue,
            highlightedTextFont: .boldSystemFont(ofSize: 25),
            textAlignment: .center,
            numberOfLines: 0,
            highlightAllOccurrence: true,
            lineHeightMultiple: 1,
            lineSpacing: 1
        )
