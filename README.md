# WorldTrotter iOS Application

This is a simple application that converts temperature value from degrees Fahrenheit to degrees Celsius along with a map view and a web view and provides Spanish and Korean language and region support.

## Getting Started

This project was created to gain a better understanding of views and the view hierarchy, and how views are laid out using **Auto Layout**. The project also explores **internationalization** and **localization**.

## App Walkthrough GIF

![WorldTrotter Walkthrough](walkthrough.gif)

## Lessons Learned
1. Every application has a singleton instance of **UIWindow** that serves as the superview of all the views in the application. **UIWindow** is a subclass of **UIView**.
2. A view's **frame** specifies the view's size and its position with respect to its superview. A view's **bounds**, on the other hand, is with respect to itself. If a view's **frame** is {x:20, y:20, width: 50, height: 50}, that means this view's top-left corner is placed at the point (20, 20) in it's superview's coordinate system. That same view's **bounds** would be {x: 0, y: 0, width: 50, height: 50}.
3. To programmatically create and add views, initalize a **UIView** instance with a desire **CGRect** properties. Then, this instance could be added to an existing container view.
4. **UIColor** class has computed properties for common colors such as **blue**, **green**, **black**, **clear** etc.
5. All the numbers that define a **UIView** instances size and dimensions are points, NOT pixels. Points are used for sizes, positions, lines and curves to enforce consistency across displays of different resolutions.
6. The **Auto Layout** system utilizes *layout attributes* of a **UIView** instance to determine it's *alignment rectangle*. The *layout attributes* are **height**, **width**, **top**, **bottom**, **left**, **right**, **centerX**, **centerY**, **firstBaseline**, **lastBaseline**,  **leading**, **trailing** etc.
7. The **frame** of a **UIView** encompasses the entire view while the *alignment rectangle* only contains the portion to be used for alignment purposes.
8. A *constraint* is used to determine a *layout attribute* of one or more **UIView** instances in a view hierarchy. At least two *constraints* are needed per dimension.
9. A **UIView** instance will usually look for the nearest neighbor in the specified direction of a *constraint*, which is usually the closest sibiling **UIView** instance in that direction. If no such sibilings exist, its superview will become the nearest neighbor.
10. The *intrinsic content size* of a **UIView** object can reduce the need for explictily adding **height** and **width** *constraints*. For example, the *intrinsic content size* of a **UITextField** will be the size of the text rendered for the specified font.
11. The keyboard to appear for a **UITextField** instance can be modified using the **autoCapitalizationType**, **autoCorrectionType**, **spellCheckingType**, **keyboardType**, **keyboardAppearance**, **returnKeyType** properties. These correspond to properties of the **UITextInputTraits** protocol that the **UITextField** class adopts.
12. To dismiss the keyboard of a **UITextField** instance based on a user tap on the background view, set up an action method to be triggered from the tap and then call **resignFirstResponder()** on that instance.
13. A *property observer* can execute code whenever a property's value changes and is declared using curly braces immediately after the property declaration. They are declared using either **willSet** and **didSet**.
14. To customize the display of a number, like how many numbers after decimal, use a **NumberFormatter** instance. Similarly, there are **DateFormatter**, **LengthFormatter**, **MassFormatter**, **EnergyFormatter** etc formatter classes.
15. Delegation is use to address *callbacks* in object-oriented programming. *Callback* functions are supplied in advance of an event and is called in each occurrence of the event. For any instance to become a delegate of a specific type, that instance must conform to the specific type's delegate protocol. For example, for a **UIViewController** instance to be a **UITextField** delegate, that instance must conform to **UITextFieldDelegate** protocol by adding **UITextFieldDelegate** in it's comma-delimited list in its declaration.
16. Using *lazy loading* optimization, a view controller's view is not loaded until it appears on the screen. So, the **loadView()** and the **viewDidLoad()** methods of a view controller is only called once it's view appears.
17. To programmatically create a **UIViewController** instance's view hierarchy, use the **loadView()** method.
18. If a *framework* is optimized out by the compiler, it could be included in the project by adding that *framework* to the Linked Frameworks and Libraries in the project settings.
19. The intial view controller of the main interface, which corresponds to **Main.storyboard**, gets set as the value for the **rootViewController** property of the app's singleton **UIWindow** instance.
20. **UITabBarController** is useful for presenting a UI that allows the user to switch between multiple views. Essentially, a **UITabBarController** object keeps an array of view controllers and maintains a tab bar with **UITabBarItem** objects at the bottom of the screen.
21. When using programmatic *constraints*, set the **UIView** instance's **translatesAutoResizingMaskIntoConstraints** to **false**. The translated *constraints* that iOS creates by default to match *autoresizing masks* will often cause conflict with the explicit *contraints*.
22. Any progmmatically added *constraint* must be explicitly activated by setting its **isActive** property to **true**.
23. The different *layout attributes* mentioned earlier are defined by the **NSLayoutConstraint** class's **NSLayoutConstraint.Attribute** constant. The **NSLayoutConstraint.Attribute** enum has cases for each attribute.
24. To create a side by side options in a panel like view, use **UISegmentedControl**. This is a subclass of **UIControl**, just like **UIButton**, **UITextField** etc.
25. *Internationlization* and *Localization* are the two important parts of making an app friendly to a global audience. *Internationalization* refers to making the app not rely on any hardcoded information, such as currency, date format etc. *Localization*, on the other hand, refers to the app's ability to be implemented in multiple languages and  in differnt info formats based on the user's **Language** and **Region** settings.
