# Documentation

### Why I Didn't use Equatable
Over the past 5 years working with Flutter, I’ve discovered something interesting: despite adding the Equatable package to nearly all of my projects, I’ve rarely seen it used in a meaningful way. Most of the time, it just sits there, "just because." For me, this doesn’t contribute to cleaner or more maintainable code; instead, it often adds an unnecessary layer of complexity to the project.

When I start a new project, I believe it’s crucial to carefully design and consider its specific needs. Adding tools or packages simply because they’re popular or widely used in bigger projects doesn’t make sense to me. Each project has its own unique requirements, and I think the architecture and standards should be tailored to meet those needs, rather than following a one-size-fits-all approach.

As Uncle Bob says, clean patterns and clean architecture should be adaptable, varying from project to project. I’ve come to realize that you can’t just pick a structure and assume it will be the best for every situation. Instead, it’s important to carefully plan and think through every decision before starting to code, ensuring that each choice is well-founded and truly necessary for the specific project at hand.

### Packages Used
 - dartz: was used for provides functional programming constructs in Dart.
 - shared_preferences: was used for persisting simple data locally on the device.
 - intl: was used for internationalization and localization of the app. (format dates)

### About State Management on Controllers
There is no need or justification in the current context of the application to create a more complex state manager for the controller, like:

```dart
// This is an example; the class can vary according to the need.
class State<T> {
  final T? data;
  final String? error;
  final bool _isIdle;
  final bool _isLoading;

  State.idle(): error = null, data = null, _isIdle = true, _isLoading = false;
  State.loading(): errro = null, data = null, _isIdle = false, _isLoading = true; 

  State.success(this.data) : error = null, _isIdle = false, _isLoading = true; 
  State.failure(this.error) : data = null, _isIdle = false, _isLoading = true; 

  bool get isSuccess => data != null;
  bool get isFailure => error != null;
  bool get isLoading => _isLoading;
  bool get isIdle => _isIdle;
}
```

Given that the only expected error return is a 500, there is no need to create a StateController more complex than this.

### Why Clean?
Clean architecture and clean code go far beyond using Uncle Bob's example architecture or even certain concepts that are often overlooked. I'm not the best in the world at this, nor did I write the best code in the world for this project, but some of my points align with it. Even though it’s clean architecture, it’s not necessarily clean. For a project’s architecture to be truly clean, it has to be created completely from scratch, considering the project itself, its current and future demands. But this also doesn’t mean that you shouldn't use Uncle Bob's example in some projects, as that will vary according to each project's needs.

Another point is that some classes might have slightly long names, but I believe there’s nothing like sendTextToScreenAndSplitItByCommasToSearchForWords. Each class and method, even with slightly longer names, were sometimes designed to be very descriptive about what they’re doing, while trying to ensure that each one performs only a single action. One method is responsible for clearing the list, another for searching, another for displaying the error on the screen, striving to assign a single responsibility to each task. Additionally, there won’t be (or there will be very few) variables with names like ProductList. These variables, for example, have plural names because when I say products, I’m already indicating that it’s more than one, meaning a list.