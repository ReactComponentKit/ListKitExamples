# ListKitExamples

Examples for ListKit

You can checkout examples for ListKit at here: 
- [https://github.com/ReactComponentKit/ListKitExamples](https://github.com/ReactComponentKit/ListKitExamples)

|![](https://raw.githubusercontent.com/ReactComponentKit/ListKitExamples/main/arts/ex01.gif)|![](https://raw.githubusercontent.com/ReactComponentKit/ListKitExamples/main/arts/ex02.gif)|![](https://raw.githubusercontent.com/ReactComponentKit/ListKitExamples/main/arts/ex03.gif)|![](https://raw.githubusercontent.com/ReactComponentKit/ListKitExamples/main/arts/ex04.gif)|![](https://raw.githubusercontent.com/ReactComponentKit/ListKitExamples/main/arts/ex05.gif)|![](https://raw.githubusercontent.com/ReactComponentKit/ListKitExamples/main/arts/ex06.gif)
|:----------------------------:|:------------------------:|:------------------------:|:----------------------:|:----------------------:|:----------------------:|



<img src="https://raw.githubusercontent.com/ReactComponentKit/ListKitExamples/main/arts/ex03.gif" height=320 align=right>

```swift
renderer.render(of: Array(0..<10)) { index in
    Section(id: index) {
        HGroup(width: .fractionalWidth(1.0), height: .absolute(150)) {
            for _ in 0..<3 {
                ColorBox2Component(color: randomColor, width: .fractionalWidth(0.5), height: .fractionalHeight(1.0))
                VGroup(of: [0, 1], width: .fractionalWidth(0.25), height: .fractionalHeight(1.0)) { _ in
                    ColorBox2Component(color: randomColor, width: .fractionalWidth(1.0), height: .fractionalHeight(0.5))
                }
                VGroup(of: [0, 1], width: .fractionalWidth(0.25), height: .fractionalHeight(1.0)) { _ in
                    ColorBox2Component(color: randomColor, width: .fractionalWidth(1.0), height: .fractionalHeight(0.5))
                }
            }
        }
    }
    .orthogonalScrollingBehavior(.groupPaging)
    .boundarySupplementaryItem(SectionHeaderComponent(title: "Section \(index + 1)"))
}
```

