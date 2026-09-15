# Глава 9. Асинхронность: программа, которая умеет ждать

Программы для DartPad, по разделам главы. Несколько из них специально работают по две-три секунды — так и задумано.

- `01_blocking_wait.dart` — ожидание «в лоб», от которого замирает экран.
- `02_future_receipt.dart` — `Future` как расписка: печатается `Instance of 'Future<String>'`.
- `03_then.dart` — метод `then`, первый способ дождаться значения.
- `04_async_await.dart` — то же самое через `async` и `await`.
- `05_order.dart` — порядок выполнения: метки 1–5.
- `06_forgotten_await.dart` — что будет, если `await` забыть.
- `07_try_catch.dart` — перехват ошибки: `try` / `catch` / `finally`.
- `08_own_future.dart` — своя функция с ожиданием, `Future<String>` и `Future<void>`.
- `09_future_wait.dart` — три дела разом: три секунды вместо шести.
- `10_stream_countdown.dart` — поток значений, `async*`, `yield`, `await for`.
- `11_loading_screen.dart` — мини-проект: экран загрузки профиля.
