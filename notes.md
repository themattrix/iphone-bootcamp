
Day 1 (2013-04-19)
==================

Objective-C
-----------

The "@" symbol indicates a "compiler directive". This means the text is replaced by the compiler with some other (usually longer) Objective-C code.

Objective-C provides an alternative to sub-classing: "categories". The syntax is:

    // CategoryName is the description of the extension. For example, a
    // category to extend NSString to provide reversibility might be named
    // Reversible. CategoryName can be empty but it's not recommended.
    @interface ExistingClassName (CategoryName)
    // <class prototype>
    @end

Most @property should be strong. Exceptions:
    - (IBOutlet) should be weak.
    - Primitive types should be "assign".


Xcode Features, Workflow and Tips
---------------------------------

Apple recommends 3-letter class prefix for shared code (libraries, frameworks, etc). This is to reduce possible conflicts to 2-letter class prefixes that Apple uses. Class prefixes are not really needed for non-shared code.

An app can be written for an older iOS version, but programmatically include features for newer iOS versions. This is done dynamically at run-time.

The "launch image" should be the first screen of your app with no data, not a splash screen. This is to make iPhone appear to load the app instantly. Trickery! Wonderful, wonderful trickery.

The breadcrumb-style navigation bar near the top of Xcode window is called the "jump bar".

It's possible to drag highlighted code into Snippits to create a new one.

The files "Media Library" picks up can be anywhere in the project.

The "description" method is often the to-string method equivalent.

A red stop sign with a white dot is a "fix-it" and can provide automated fixes for simple issues.

Since iOS 4.3, use automatic reference counting (ARC).
    Old way: When using alloc, copy, new, or retain, call release when done.

Objective-C (or iOS?) only frees memory on every touch event.

To disable ARC for a file: Build Phases -> Compile Sources -> <file> -> Compiler Flags => "-fno-objc-arc"


App Store
---------

Because iPad/Universal apps are much less common than iPhone apps, they are given priority by Apple when approving for the app store. This results in iPad/Universal app submissions being processed by Apple in 2 to 3 days instead of 5 to 7 for iPhone.

Although older iOS versions can see incompatible newer apps in the app store, they get an error before downloading them.

The bundled app must have icon and launch images to submit to app store.


Run-Time
--------

An app launch must take less than 5 seconds or it is killed by iOS (that would be an outrageous amount of load time anyway).

The status bar can be *observed* for orientation changes of the device.

NSNotificationCenter is the best option for interacting with remote servers (it works for background tasks).


Debug
-----

Unrecognized selector => unknown method

Tip: Add a breakpoint for "All Objective-C Exceptions". This only causes a breakpoint on otherwise-uncaught exceptions.

    Instructions:
    => Breakpoint Navigator
    => [bottom left] Add Exception Breakpoint...
    => Exception: Objective-C
    => Move breakpoint to User

lldb is the command-line debugger (llvm's debugger). Some useful commands:
    s: step into
    n: step over
    finish: step out
    p: print primitive variable
    po: print object

Instead of right clicking and choosing the Delete Breakpoint option, you can just drag the breakpoint off.

Prefer breakpoint console output over NSLog console output. The breakpoint method does not involve changing code and will not be present in production code.


Testing
-------

You can automate GUI testing with the "Automation" instrument profile (Command-I). More advanced third-party tools are also available.


Day 2 (2013-04-20)
==================

Methods are compiled separately from objects and are not bound to them. Every method is compiled into a "selector" type (often abbreviated as SEL). Use @selector to select a method.

A gesture recognizer can be added to any view, and basically everything which can be displayed on the screen is a view.

GPS can be accurate to within about 3 feet (kCLLocationAccuracyBest).

Location manager supports geo-fencing. Your app will be woken up (or started) and informed of the new location information.

NSUserDefaults can store objects *and* primitive types (unlike dictionaries, which can only store objects).

The generic "id" type is always a pointer.

Code blocks (closures) syntax and example:

    // [Return Type] (^ [Variable Name]) ([Parameters]);
    //
    // Example:

    // declaration:
    - (void) someMethod:(void (^)(BOOL aParameter)) handler;

    // implementation:
    - (void) someMethod:(void (^)(BOOL aParameter)) handler
    {
        // Call the passed-in block:
        handler(YES);
    }

    // calling
    [anObject someMethod:^(BOOL aParameter) {
        // The called method will call this method.
    }];

Code block state captures the state of its context *when it's created*.

Core Motion uses code blocks instead of delegates because it's newer.

Core Motion processes requests from a queue. (Uses what used to be called Grand Central Dispatch, which was bought by apple.)

Calls to NSOperation should be thread-safe because they may be called by different threads.

Core Motion events can't be simulated in the iPhone simulator at the moment.

A "plist" is Apple's property list implementation (XML).

A normal Search Bar scrolls with table by default (kind of like a first cell).

Since NSStrings are immutable, Objective-C performs an optimization where all identical strings are stored in the same memory address.