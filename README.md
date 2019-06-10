<img src="images/icon/banner.png"/>

[![Build Status](https://img.shields.io/badge/platforms-iOS%20%7C%20tvOS%20%7C%20macOS%20%7C%20watchOS-lightgrey.svg)](https://github.com/Jinxiansen/SwiftUI)
[![Swift](https://img.shields.io/badge/Swift-5.1-orange.svg)](https://swift.org)
[![Xcode](https://img.shields.io/badge/Xcode-11.0-blue.svg)](https://developer.apple.com/xcode)
[![Xcode](https://img.shields.io/badge/macOS-15.0-blue.svg)](https://developer.apple.com/macOS)
[![MIT](https://img.shields.io/badge/licenses-GPL3.0-red.svg)](https://opensource.org/licenses/GPL-3.0)

This article refers to SwiftUI [apple example](https://github.com/Jinxiansen/SwiftUI/tree/doc) and records the results of the exploration here, I hope to be helpful to you.

For the content described in this article, by default you have some experience based on Swift language development, so it will not describe every detail in detail; if you have doubts about Swift syntax, you can learn [Swift](https://swift.org) Grammar.

When learning and using `SwiftUI`, if you have any questions, you can join the SwiftUI QQ Group: **18552966** to discuss communication.

[中文版🇨🇳](README_CN.md)


### 💻 Requirements

- macOS 15 Beta
- Xcode 11.0 Beta
- iOS 13.0 Beta


## Directory：

### Basic View

* Text
	- [Text](#Text)
	- [TextField](#TextField)
	- [SecureField](#SecureField)

* Image
	- [Image](#Image)
	- [WebImage](#WebImage)


* Button
	- [Button](#Button)
	- [PullDownButton](#PullDownButton)
	- [ItemBasedPopUpButton](#ItemBasedPopUpButton)
	- [NavigationButton](#NavigationButton)
	- [PresentationButton](#PresentationButton)
	- [EditButton](#EditButton)
	- [PasteButton](#PasteButton)

* Picker
	- [DatePicker](#DatePicker)
	- [Toggle](#Toggle)
	- [Slider](#Slider)
	- [Stepper](#Stepper)
	- [SegmentedControl](#SegmentedControl)

* Other View
	- [WebView](#WebView)
	- [Alert](#Alert)

### Layout
	
* Stacks 
	- [HStack](#HStack)
	- [VStack](#VStack)
	- [ZStack](#ZStack)

* List 
	- [List](#List)
	- [ScrollView](#ScrollView)
	- [ForEach](#ForEach)

* Container Views
	- [Group](#Group)
	- [GroupBox](#GroupBox)
	- [Section](#Section)

* Architectural Views
	- [NavigationView](#NavigationView)
	- [TabbedView](#TabbedView)
	- [HSplitView](#HSplitView)
	- [VSplitView](#VSplitView)

* Presentations

	- [Alert](#Alert)
	- [Modal](#Modal)
	- [Popover](#Popover)
	- [Sheet](#Sheet)
	- [ActionSheet](#ActionSheet)


### State and Data Flow

* Bindings
	* [Binding](#Binding)

* Data-Dependent Views 
	* [State](#State)
	* [ObjectBinding](#ObjectBinding)
	* [EnvironmentObject](#EnvironmentObject)

* Environment Values
	* [Environment](#Environment)
	* [EnvironmentValues](#EnvironmentValues)

* Navigation Models
	* [DynamicNavigationDestinationLink](#DynamicNavigationDestinationLink)

* Preferences
	* [LocalizedStringKey](#LocalizedStringKey)

* Transactions
	* [Transaction](#Transaction)


### Gestures

* Basic Gestures
	* [TapGesture](#TapGesture)
	* [LongPressGesture](#LongPressGesture)
	* [DragGesture](#DragGesture)
	* [MagnificationGesture](#MagnificationGesture)
	* [RotationGesture](#RotationGesture)

* Combined Gestures
	* [SequenceGesture](#SequenceGesture)
	* [SimultaneousGesture](#SimultaneousGesture)
	* [ExclusiveGesture](#ExclusiveGesture)

* Custom Gestures
	* [AnyGesture](#AnyGesture)



<h2 id="Basic View">Basic View</h2>


<h4 id="Text">Text</h4>

`Text` is used to display one or more lines of text content with the same effect as `UILabel`, but it is even better.

If you want to create `Text`, just create it with `Text("SwiftUI")`;
With chained syntax, you can also add multiple attributes to the text, such as fonts, colors, shadows, spacing between top left and right, and so on.

Example:

```swift
Text("SwiftUI")
    .color(.orange)
    .bold()
    .font(.system(.largeTitle))
    .fontWeight(.medium)
    .italic()
    .shadow(color: .black, radius: 1, x: 0, y: 2)
```

<details close>
  <summary>View running results</summary>
  <img width="80%" src="images/example/Text.png"/>
</details>

 
> HStack and VStack controls are used to host multiple views, as mentioned later.

<h4 id="TextField"> TextField </h4>
 
`TextField` is used to add a normal input box, which is often used as a text input.

Example：

```swift

TextField(self.$name, placeholder: self.nameText, onEditingChanged: { changed in
    print("onEditing: \(changed)")
}) {
    print("userName: \(self.name)")
    self.endEditing(true)
}}
.padding(10)
.frame(height: 50)
.textFieldStyle(.roundedBorder)
.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

```

<details close>
  <summary>View running results</summary>
<img width="80%" src="images/example/Field.png"/>
</details>


<h4 id="SecureField"> SecureField </h4>

`SecureField ` is generally used as a password input. It is used in the same way as `TextField`. The example and the running effect are the same as `TextField`.


<h4 id="Image"> Image </h4>

The `Image` control is used to display images, example:

```swift
Image("icon")
    .resizable()
    .frame(width: Length(100),
           height: Length(100),
           alignment: .center)
```

<details close>
  <summary>View running results</summary>
<img width="80%" src="images/example/Image.png"/>
</details>



<h4 id="WebImage"> WebImage </h4>

`webImage` is used to download the web image, use the `URLSession` to download the original `Image` after successful download; you can also use [Kingfisher]((https://github.com/onevcat/Kingfisher)) in the `downloadWebImage ` function .

Example：

```swift
var body: some View {
        Image(uiImage: self.uiImage ?? placeholderImage)
            .resizable()
            .onAppear(perform: downloadWebImage)
            .frame(width: Length(80),
                   height: Length(80),
                   alignment: .center)
            .tapAction {
                print("Tap ")
        }
    }
```

<details close>
  <summary>View running results</summary>
<img width="80%" src="images/example/WebImage.png"/>
</details>



<h4 id="Button"> Button </h4>

`Button` is used to respond to click events.

Example:

```swift
Button(action: {
    print("Tap")
}) {
   Text("I'm a Button")
}
```
<details close>
  <summary>View running results</summary>
<img width="80%" src="images/example/Button.png"/>
</details>

<h4 id="PullDownButton"> PullDownButton </h4>

Waiting for release.

<h4 id="ItemBasedPopUpButton"> ItemBasedPopUpButton </h4>

Waiting for release.


<h4 id="NavigationButton"> NavigationButton </h4>

`NavigationButtonPage ` is used to push to the next navigation page.

Example:

```swift
NavigationButton(destination: NavigationButtonPage()) {
    Text("NavigationButton").bold().color(.orange).font(.largeTitle)
    }.navigationBarItem(title: Text("Page"))
```     

<details close>
  <summary>View running results</summary>
<img width="80%" src="images/example/NavigationButton.png"/>
</details>


<h4 id="PresentationButton"> PresentationButton </h4>

`PresentationButton` is used to pop up a page.

Example:

```swift
PresentationButton(PageRow(title: "PresentationButton", subTitle: "pop up a page"),
                   destination: Text("I'm Text")) {
                    print("Present 🦄")
                   }
```     

<details close>
  <summary>View running results</summary>
<img width="80%" src="images/example/PresentationButton.png"/>
</details>


<h4 id="EditButton"> EditButton </h4>

`EditButton` is used to trigger the editing state, just use the `navigationBarItems` setting when using it. 

Example:

```swift
navigationBarItems(trailing: EditButton())
```     

<details close>
  <summary>View running results</summary>
<img width="80%" src="images/example/EditButton.png"/>
</details>



<h4 id="PasteButton"> PasteButton </h4> 

Waiting for release.
 

<h4 id="DatePicker"> DatePicker </h4>

`DatePicker` is used to select the absolute date of the control.

Example:

```swift
DatePicker(
    $server.date,
    minimumDate: Calendar.current.date(byAdding: .year,
                                       value: -1,
                                       to: server.date),
    maximumDate: Calendar.current.date(byAdding: .year,
                                       value: 1,
                                       to: server.date),
    displayedComponents: .date
)
```     

<details close>
  <summary>View running results</summary>
<img width="80%" src="images/example/DatePicker.png"/>
</details>



<h4 id="View running resultsle"> View running resultsle </h4>

`View running resultsle` is used to switch the selected state, for example:

```swift
View running resultsle(isOn: $isOn) {
    Text("State: \(self.isOn == true ? "Open":"Close")")
}.padding(20)
```     

<details close>
  <summary>View running results</summary>
<img width="80%" src="images/example/View running resultsle.png"/>
</details>


<h4 id="Slider"> Slider </h4>

`Slider ` A control for selecting values from a finite range of values, example:

```swift
Slider(value: $data.rating)
```     

<details close>
  <summary>View running results</summary>
<img width="80%" src="images/example/Slider.png"/>
</details>
 

<h4 id="Stepper"> Stepper </h4>

`Stepper ` is used to increase or decrease the value, example:

```swift
Stepper(value: $value, step: 2, onEditingChanged: { c in
    print(c)
}) {
    Text("Stepper Value: \(self.value)")
    }.padding(50)
```

<details close>
  <summary>View running results</summary>
<img width="80%" src="images/example/Stepper.png"/>
</details>



<h4 id="SegmentedControl"> SegmentedControl </h4>

`SegmentedControl ` is used for segmentation condition selection, example:

```swift
SegmentedControl(selection: $currentIndex) {
    ForEach(0..<items.count) { index in
        Text(self.items[index]).tag(index)
    }
    }.tapAction {
        print("currentIndex: \(self.currentIndex)")
}
```

<details close>
  <summary>View running results</summary>
<img width="80%" src="images/example/SegmentedControl.png"/>
</details>


<h4 id="WebView"> WebView </h4>

`WebView` is used to display an open web page, example:

```swift
struct WebViewPage : UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let req = URLRequest(url: URL(string: "https://www.apple.com")!)
        uiView.load(req)
    }
}
```

<details close>
  <summary>View running results</summary>
<img width="80%" src="images/example/WebView.png"/>
</details>


<h4 id="Alert"> Alert </h4>

`Alert` is used to display a bullet reminder that needs to be associated with a click event. Example:

```swift
presentation($showsAlert, alert: {
                Alert(title: Text("Hello"))
            })
```

<details close>
  <summary>View running results</summary>
<img width="80%" src="images/example/Alert.png"/>
</details>


### Layout 


<h4 id="HStack"> HStack </h4>

`HStack` is used to arrange the subviews on a horizontal line. 

Example:

```swift
HStack {
    Text("made in China.")
    Divider() // Just add a line.
    Text("the People's Republic Of China.")
}
```

<details close>
  <summary>View running results</summary>
<img width="80%" src="images/example/HStack.png"/>
</details>


<h4 id="VStack"> VStack </h4>

`VStack` is used to arrange the subviews on a vertical line.

Example:

```swift
VStack {
    Text("made in China.")
    Divider() // Just add a line.
    Text("the People's Republic Of China.")
}
```

<details close>
  <summary>View running results</summary>
<img width="80%" src="images/example/VStack.png"/>
</details>

<h4 id="ZStack"> ZStack </h4>

`ZStack` is used to override the subview, aligned on two axes.

Example:

```swift
ZStack {
    Text("made in China.")
    Divider() // Just add a line.
    Text("the People's Republic Of China.")
}
```

<details close>
  <summary>View running results</summary>
<img width="80%" src="images/example/ZStack.png"/>
</details>



<h4 id="List"> List </h4>

`List` list container to display a list of data.

Examples:

```swift
List(0..<5) { item in
    Text("Hello World !")
}.navigationBarTitle(Text("List"), displayMode: .large)
```

<details close>
  <summary>View running results</summary>
<img width="80%" src="images/example/List.png"/>
</details>


<h4 id="ScrollView"> ScrollView </h4>

`ScrollView` is a scroll view container.

Example:

```swift
ScrollView {
    Text("SwiftUI").padding(20)
    Divider()
    Image("icon").resizable()
        .frame(width: 300, height: 300, alignment: .center)
    Divider()
    Text("Views and ... user interface.")
    }
    .border(style, width: 1,cornerRadius: 10)
    .padding(10)
    .navigationBarTitle(Text("ScrollView"))
```

<details close>
  <summary>View running results</summary>
<img width="80%" src="images/example/ScrollView.png"/>
</details>

<h4 id="ForEach"> ForEach </h4>

`ForEach` is used to present a view based on a collection of existing data.

Example:

```swift
let data = (0..<5).map { $0 }
var body: some View {
    ForEach(data) { e in
        Text("Hello \(e)")
            .bold()
            .font(.system(size: 25, design: .monospaced))
            .padding(5)
}
```

<details close>
  <summary>View running results</summary>
<img width="80%" src="images/example/ForEach.png"/>
</details>


<h4 id="Group"> Group </h4>

`Group` is used to aggregate multiple views, and the properties set on the Group will be applied to each child view.

Example:

```swift
Group {
    Text("Hello World !")
    Text("Hello World !")
    }
```

<details close>
  <summary>View running results</summary>
<img width="80%" src="images/example/Group.png"/>
</details>


<h4 id="GroupBox"> GroupBox </h4>

Waiting for release.


<h4 id="Section"> Section </h4>

`Section` is used to create the **header/footer** view content, which is generally used in conjunction with the `List` component.

Example:

```swift
Section(header: Text("I'm header"), footer: Text("I'm footer")) {
    ForEach(0..<3) {
        Text("Hello \($0)")
    }
}
```

<details close>
  <summary>View running results</summary>
<img width="80%" src="images/example/Section.png"/>
</details>


<h4 id="NavigationView"> NavigationView </h4>

`NavigationView` is used to create a view container that contains the top navigation bar.

Example:

```swift
NavigationView {
    Text("🧚‍♂️🧚‍♀️🧜‍♂️🧜‍♀️🧞‍♂️🧞‍♀️").blur(radius: 5)
    Text("Swifter Swifter").bold().color(.orange).font(.largeTitle)
}.navigationBarTitle(Text("NavigationView"))
```

<details close>
  <summary>View running results</summary>
<img width="80%" src="images/example/NavigationView.png"/>
</details>


<h4 id="TabBar"> TabBar </h4>

`TabBar` is used to create a view container that contains the bottom **TabBar**.

Example:

```swift
TabbedView(selection: $index) {
    ForEach(0 ..< imgs.count) { item in
        TabItemPage(index: item)
            .tabItemLabel(Image(self.imgs[item]))
            .tag(item)
    }
}
```

<details close>
  <summary>View running results</summary>
<img width="80%" src="images/example/TabBar.png"/>
</details>


<h4 id="HSplitView"> HSplitView </h4> 

Waiting for release.

<h4 id="VSplitView"> VSplitView </h4> 

Waiting for release.


## 📎 About

* The code involved in the above example is in this repository code. It is recommended to download and run the view.
* If you have better usage and suggestions about SwiftUI, look forward to sharing it!
* If there are omissions and errors in the examples in this article,  please create a [**Issue**](https://github.com/Jinxiansen/SwiftUI/issues/new) !
 


## ✉️ Contacts

email : hi@jinxiansen.com

微博 : [@晋先森](http://weibo.com/3205872327)

## 📄 License	

SwiftUI is released under the [GPL-3.0 license](LICENSE). See LICENSE for details.