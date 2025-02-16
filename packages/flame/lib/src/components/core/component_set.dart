import 'package:flame/components.dart';
import 'package:meta/meta.dart';
import 'package:ordered_set/comparing.dart';
import 'package:ordered_set/queryable_ordered_set.dart';

/// This is a simple wrapper over [QueryableOrderedSet] to be used by
/// [Component].
///
/// Instead of immediately modifying the component list, all insertion
/// and removal operations are queued to be performed on the next tick.
///
/// This will avoid any concurrent modification exceptions while the game
/// iterates through the component list.
class ComponentSet extends QueryableOrderedSet<Component> {
  /// With default settings, creates a [ComponentSet] with the compare function
  /// that uses the Component's priority for sorting.
  ComponentSet({
    int Function(Component e1, Component e2)? comparator,
    bool? strictMode,
  }) : super(
          comparator: comparator ?? Comparing.on<Component>((c) => c.priority),
          strictMode: strictMode ?? defaultStrictMode,
        );

  static bool defaultStrictMode = false;

  /// Marked as internal, because the users shouldn't be able to add elements
  /// into the [ComponentSet] directly, bypassing the normal lifecycle handling.
  @internal
  @override
  bool add(Component component) => super.add(component);

  /// Marked as internal, because the users shouldn't be able to add elements
  /// into the [ComponentSet] directly, bypassing the normal lifecycle handling.
  @internal
  @override
  int addAll(Iterable<Component> components) => super.addAll(components);

  /// Marked as internal, because the users shouldn't be able to remove elements
  /// from the [ComponentSet] directly, bypassing the normal lifecycle handling.
  @internal
  @override
  bool remove(Component component) => super.remove(component);

  /// Marked as internal, because the users shouldn't be able to remove elements
  /// from the [ComponentSet] directly, bypassing the normal lifecycle handling.
  @internal
  @override
  Iterable<Component> removeAll(Iterable<Component> components) =>
      super.removeAll(components);

  /// Marked as internal, because the users shouldn't be able to remove elements
  /// from the [ComponentSet] directly, bypassing the normal lifecycle handling.
  @internal
  @override
  Iterable<Component> removeWhere(bool Function(Component element) test) =>
      super.removeWhere(test);

  /// Marked as internal, because the users shouldn't be able to remove elements
  /// from the [ComponentSet] directly, bypassing the normal lifecycle handling.
  @internal
  @override
  void clear() => super.clear();

  /// Whether the component set contains components or that there are components
  /// marked to be added later.
  @override
  bool get isNotEmpty => !isEmpty;

  /// Sorts the components according to their `priority`s. This method is
  /// invoked by the framework when it knows that the priorities of the
  /// components in this set has changed.
  @internal
  void reorder() {
    final elements = toList();
    // bypass the wrapper because the components are already added
    super.clear();
    elements.forEach(super.add);
  }

  /// Call this on your update method.
  ///
  /// This method effectuates any pending operations of insertion or removal,
  /// and thus actually modifies the components set.
  /// Note: do not call this while iterating the set.
  @Deprecated('Will be removed in 1.8.0.')
  void updateComponentList() {}

  @Deprecated('Will be removed in 1.8.0.')
  @override
  void rebalanceAll() => reorder();

  @Deprecated('Will be removed in 1.8.0.')
  @override
  void rebalanceWhere(bool Function(Component element) test) {
    // bypass the wrapper because the components are already added
    final elements = super.removeWhere(test).toList();
    elements.forEach(super.add);
  }

  /// Changes the priority of [component] and reorders the games component list.
  ///
  /// Returns true if changing the component's priority modified one of the
  /// components that existed directly on the game and false if it
  /// either was a child of another component, if it didn't exist at all or if
  /// it was a component added directly on the game but its priority didn't
  /// change.
  @Deprecated('Will be removed in 1.8.0.')
  bool changePriority(
    Component component,
    int priority,
  ) {
    component.priority = priority;
    return true;
  }
}
