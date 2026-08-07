# 🚀 Riverpod State Management Notes

> My personal revision notes for **Flutter Riverpod**.
> The goal of this repository is to quickly revise concepts without watching tutorials again.

---

# 📚 Topics Covered

## Core Riverpod

- StateProvider
- NotifierProvider
- FutureProvider (Async Provider)
- AsyncNotifierProvider
- StreamProvider
- Family Provider
- AutoDispose
- Dependency Injection
- Riverpod Generator

## Extra Topics

- Freezed
- JSON Serializable
- Go Router

---

# 🗺️ Learning Flow

```text
StateProvider
      ↓
NotifierProvider
      ↓
FutureProvider
      ↓
AsyncNotifierProvider
      ↓
StreamProvider
      ↓
Family
      ↓
AutoDispose
      ↓
Dependency Injection
      ↓
Riverpod Generator
```

---

# 🏗 Provider Comparison

| Provider              | Mutable State | Async  | Best Use Case                            |
| --------------------- | ------------- | ------ | ---------------------------------------- |
| StateProvider         | ✅            | ❌     | Simple state (counter, switch, checkbox) |
| NotifierProvider      | ✅            | ❌     | Business logic, Todo, Forms              |
| FutureProvider        | ❌            | ✅     | Read-only API calls                      |
| AsyncNotifierProvider | ✅            | ✅     | Login, CRUD, API with state updates      |
| StreamProvider        | Live Updates  | Stream | Firebase, Chat, WebSocket                |

---

# ⚡ Quick Decision Guide

| Scenario           | Recommended Provider  |
| ------------------ | --------------------- |
| Counter            | StateProvider         |
| Dark Mode          | StateProvider         |
| Todo App           | NotifierProvider      |
| Shopping Cart      | NotifierProvider      |
| Fetch User Profile | FutureProvider        |
| Login API          | AsyncNotifierProvider |
| Update User        | AsyncNotifierProvider |
| Chat App           | StreamProvider        |
| Firebase Firestore | StreamProvider        |

---

# 1️⃣ StateProvider

## Purpose

Stores simple mutable state.

### Best For

- Counter
- Switch
- Checkbox
- Dropdown
- Selected Index

### Syntax

```dart
final counterProvider = StateProvider<int>((ref) => 0);
```

Read

```dart
ref.watch(counterProvider);
```

Update

```dart
ref.read(counterProvider.notifier).state++;
```

### Notes

- Small amount of state only.
- Avoid putting business logic here.
- Easy to learn.
- Can become messy for large applications.

---

# 2️⃣ NotifierProvider

## Purpose

Stores state with business logic.

### Best For

- Todo App
- Shopping Cart
- Forms
- Complex UI State

### Syntax

```dart
class CounterNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void increment() {
    state++;
  }
}

final counterProvider =
    NotifierProvider<CounterNotifier, int>(CounterNotifier.new);
```

Read

```dart
ref.watch(counterProvider);
```

Call Method

```dart
ref.read(counterProvider.notifier).increment();
```

### Notes

- Recommended over StateProvider for medium/large projects.
- Keeps UI clean.
- Business logic stays inside Notifier.

---

# 3️⃣ FutureProvider (Async Provider)

## Purpose

Load asynchronous data.

### Best For

- Fetch API
- Load Database
- Read User Profile

### Syntax

```dart
final userProvider = FutureProvider<User>((ref) async {
  return api.getUser();
});
```

Usage

```dart
final user = ref.watch(userProvider);

user.when(
  data: (data) {},
  loading: () {},
  error: (e, s) {},
);
```

### Notes

- Read-only provider.
- Automatically caches data.
- Cannot manually change state.

---

# 4️⃣ AsyncNotifierProvider

## Purpose

Async business logic with mutable state.

### Best For

- Login
- Register
- CRUD
- Refresh Data
- API Calls

### Syntax

```dart
class UserNotifier extends AsyncNotifier<User> {
  @override
  Future<User> build() async {
    return api.getUser();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      return api.getUser();
    });
  }
}

final userProvider =
    AsyncNotifierProvider<UserNotifier, User>(UserNotifier.new);
```

### Notes

- Most powerful Riverpod provider.
- Can modify async state.
- Preferred over FutureProvider when state changes.

---

# 5️⃣ StreamProvider

## Purpose

Listen to continuous updates.

### Best For

- Firebase
- Chat
- Notifications
- WebSocket
- Live Location

### Syntax

```dart
final messageProvider =
    StreamProvider<List<Message>>((ref) {
  return repository.messages();
});
```

Usage

```dart
ref.watch(messageProvider);
```

### Notes

- Automatically listens.
- Automatically cancels stream.
- Perfect for realtime apps.

---

# 6️⃣ Family Provider

## Purpose

Pass parameters to providers.

### Syntax

```dart
final userProvider =
    FutureProvider.family<User, String>((ref, id) async {
  return api.getUser(id);
});
```

Usage

```dart
ref.watch(userProvider("123"));
```

### Best For

- User by ID
- Product Details
- Search Query
- Category Filter

---

# 7️⃣ AutoDispose

## Purpose

Dispose provider automatically when unused.

### Syntax

```dart
final provider =
    FutureProvider.autoDispose((ref) async {
  ...
});
```

### Notes

- Prevents memory leaks.
- API is reloaded after reopening unless kept alive.
- Good for temporary screens.

Keep Alive

```dart
ref.keepAlive();
```

---

# 8️⃣ Dependency Injection

## Purpose

Provide services without manually creating objects.

### Example

```dart
final apiProvider = Provider<ApiService>((ref) {
  return ApiService();
});
```

Usage

```dart
final api = ref.read(apiProvider);
```

### Benefits

- Loose coupling
- Easy testing
- Better architecture
- Reusable services

---

# 9️⃣ Riverpod Generator

## Purpose

Generate providers automatically.

### Packages

```yaml
flutter_riverpod
riverpod_annotation
riverpod_generator
build_runner
```

Annotation

```dart
@riverpod
int counter(Ref ref) {
  return 0;
}
```

Generate Code

```bash
dart run build_runner build
```

Watch Mode

```bash
dart run build_runner watch
```

### Benefits

- Less boilerplate
- Better type safety
- Cleaner code
- Recommended for modern Riverpod

---

# ✨ Freezed

## Purpose

Generate immutable models.

### Annotation

```dart
@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json)
      => _$UserFromJson(json);
}
```

Generate

```bash
dart run build_runner build
```

### Benefits

- Immutable classes
- copyWith()
- Equality
- Union/Sealed Classes
- JSON support

---

# 📦 JSON Serializable

## Purpose

Convert JSON ↔ Dart Objects.

Example

```dart
factory User.fromJson(Map<String, dynamic> json)
    => _$UserFromJson(json);

Map<String, dynamic> toJson()
    => _$UserToJson(this);
```

### Benefits

- Cleaner model classes
- No manual parsing
- Type safe

---

# 🧭 Go Router

## Purpose

Navigation and Deep Linking.

Create Router

```dart
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
  ],
);
```

Navigate

```dart
context.go('/home');
```

Push

```dart
context.push('/details');
```

Back

```dart
context.pop();
```

Pass Parameter

```dart
context.push('/user/1');
```

### Notes

- Declarative routing
- Supports deep linking
- Nested navigation
- Route guards
- Named routes

---

# 👀 watch vs read vs listen

## ref.watch()

- Rebuilds UI when state changes.
- Use inside build().

```dart
ref.watch(counterProvider);
```

---

## ref.read()

- Reads once.
- Does not rebuild.

```dart
ref.read(counterProvider.notifier);
```

---

## ref.listen()

- Reacts to state changes.
- No widget rebuild.

```dart
ref.listen(provider, (previous, next) {});
```

Use for:

- Snackbar
- Dialog
- Navigation
- Toast

---

# 📝 Common Riverpod Commands

Generate Code

```bash
dart run build_runner build
```

Watch Changes

```bash
dart run build_runner watch
```

Clean Generated Files

```bash
dart run build_runner clean
```

Delete Conflicting Files

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

# 💡 Best Practices

- Keep UI free from business logic.
- Prefer `NotifierProvider` over `StateProvider` for anything beyond simple state.
- Use `AsyncNotifierProvider` for CRUD and mutable async operations.
- Use `FutureProvider` for read-only async data.
- Use `StreamProvider` for real-time updates.
- Use `Family` when providers need parameters.
- Use `AutoDispose` for screen-specific providers.
- Prefer code generation (`@riverpod`) in new projects.
- Use `Freezed` for immutable models.
- Inject dependencies using `Provider`.
- Keep providers small and focused on a single responsibility.

---

# 📌 Quick Cheat Sheet

| Need                  | Use                   |
| --------------------- | --------------------- |
| Simple State          | StateProvider         |
| Business Logic        | NotifierProvider      |
| Read API              | FutureProvider        |
| CRUD/API State        | AsyncNotifierProvider |
| Live Updates          | StreamProvider        |
| Parameters            | Family                |
| Dispose Automatically | AutoDispose           |
| Dependency Injection  | Provider              |
| Code Generation       | Riverpod Generator    |
| Immutable Models      | Freezed               |
| JSON Parsing          | json_serializable     |
| Navigation            | Go Router             |

---

# 🎯 Next Topics to Learn

- Dio
- Retrofit
- Isar Database
- Clean Architecture
- Repository Pattern
- Unit Testing
- Integration Testing
- Secure Storage
- Firebase
- Offline First Architecture

---

> **Rule of Thumb**
>
> - **Simple state → StateProvider**
> - **Business logic → NotifierProvider**
> - **Read async data → FutureProvider**
> - **Mutable async state → AsyncNotifierProvider**
> - **Realtime updates → StreamProvider**
>
> If you're unsure, start with **NotifierProvider** for synchronous state and **AsyncNotifierProvider** for asynchronous state.
