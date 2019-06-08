<img src="images/icon/banner.png"/>

[![Build Status](https://img.shields.io/badge/platforms-iOS%20%7C%20tvOS%20%7C%20macOS%20%7C%20watchOS-lightgrey.svg)](https://github.com/Jinxiansen/SwiftUI)
[![Swift](https://img.shields.io/badge/Swift-5.1-orange.svg)](https://swift.org)
[![Xcode](https://img.shields.io/badge/Xcode-11.0-blue.svg)](https://developer.apple.com/xcode)
[![Xcode](https://img.shields.io/badge/macOS-15.0-blue.svg)](https://developer.apple.com/macOS)
[![MIT](https://img.shields.io/badge/licenses-GPL3.0-red.svg)](https://opensource.org/licenses/GPL-3.0)

This article refers to the [apple example](https://github.com/Jinxiansen/SwiftUI/tree/doc) and learning experience recorded here, I hope to be helpful to you.

For the content described in this article, by default you have some experience based on Swift language development, so it will not describe every detail in detail; if you have doubts about Swift syntax, you can learn [Swift](https://swift.org) Grammar.

When learning and using `SwiftUI`, if you have any questions, you can join the SwiftUI QQ Group: **816138215** to discuss communication.

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

* Spacers and Dividers
	- [Spacer](#Spacer)
	- [Divider](#Divider)

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

Transactions
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
.border(self.style, width: 1, cornerRadius: 5)
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
  <summaryView running results</summary>
<img width="80%" src="images/example/Alert.png"/>
</details>


### Layout 

Stay tuned!



## 📎 About

* The code involved in the above example is in this repository code. It is recommended to download and run the view.
* If you have better usage and suggestions about SwiftUI, look forward to sharing it!
* If there are omissions and errors in the examples in this article,  please create a [**Issue**](https://github.com/Jinxiansen/SwiftUI/issues/new) !
 


## ✉️ Contacts

email : hi@jinxiansen.com

微博 : [@晋先森](http://weibo.com/3205872327)

## 📄 License	

SwiftUI is released under the [GPL-3.0 license](LICENSE). See LICENSE for details.