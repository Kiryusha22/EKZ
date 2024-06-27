-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 26 2024 г., 01:56
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `EKZ`
--

-- --------------------------------------------------------

--
-- Структура таблицы `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `carts`
--

INSERT INTO `carts` (`id`, `order_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 2, NULL, NULL),
(3, 3, 3, NULL, NULL),
(4, 4, 4, NULL, NULL),
(5, 5, 5, NULL, NULL),
(6, 6, 6, NULL, NULL),
(7, 7, 7, NULL, NULL),
(8, 8, 8, NULL, NULL),
(9, 9, 9, NULL, NULL),
(10, 10, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `total_price` decimal(8,2) NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `total_price`, `is_paid`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '16.00', 0, 4, NULL, NULL),
(2, '11.00', 0, 1, NULL, NULL),
(3, '19.00', 0, 3, NULL, NULL),
(4, '26.00', 0, 5, NULL, NULL),
(5, '6.00', 0, 6, NULL, NULL),
(6, '12.00', 0, 7, NULL, NULL),
(7, '46.00', 0, 8, NULL, NULL),
(8, '21.00', 0, 9, NULL, NULL),
(9, '89.00', 0, 1, NULL, NULL),
(10, '53.00', 0, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`, `type_category_id`, `created_at`, `updated_at`) VALUES
(1, 'Суши \"Ласточка\"', 'Классический ролл с лососем', '12.99', NULL, 1, NULL, NULL),
(2, 'Суши \"Калифорния\"', 'Ролл с креветкой и авокадо', '14.99', NULL, 1, NULL, NULL),
(3, 'Суши \"Филадельфия\"', 'Ролл с тунцом и сливочным сыром', '16.99', NULL, 2, NULL, NULL),
(4, 'Суши \"Токио\"', 'Ролл с тигровой креветкой и сыром терияки', '18.99', NULL, 2, NULL, NULL),
(5, 'Суши \"Манго\"', 'Ролл с лососем и манго', '12.99', NULL, 3, NULL, NULL),
(6, 'Суши \"Бали\"', 'Ролл с креветкой, авокадо и сыром терияки', '14.99', NULL, 3, NULL, NULL),
(7, 'Суши \"Хаяси\"', 'Ролл с тигровой креветкой и сливочным сыром', '16.99', NULL, 3, NULL, NULL),
(8, 'Суши \"Магуро\"', 'Ролл с лососем, сыром и огурцом', '18.99', NULL, 3, NULL, NULL),
(9, 'Суши \"Наоми\"', 'Ролл с тигровой креветкой и сливочным сыром', '12.99', NULL, 1, NULL, NULL),
(10, 'Суши \"Сакура\"', 'Ролл с лососем, сливочным сыром и стружкой терияки', '14.99', NULL, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Админ', 'Admin', NULL, NULL),
(2, 'Пользователь', 'User', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `type_categories`
--

CREATE TABLE `type_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `type_categories`
--

INSERT INTO `type_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Акция', NULL, NULL),
(2, 'Новинка', NULL, NULL),
(3, 'Комбо', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patronymic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL DEFAULT '2',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `patronymic`, `phone_number`, `login`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'John', 'Doe', 'Smith', '1234567', 'john123', 'password123', 2, NULL, NULL, NULL),
(2, 'Jane', 'Doe', 'Johnson', '2345678', 'jane123', 'password456', 2, NULL, NULL, NULL),
(3, 'Bob', 'Smith', 'Johnson', '3456789', 'bob123', 'password789', 2, NULL, NULL, NULL),
(4, 'Alice', 'Johnson', 'Smith', '4567890', 'alice123', 'password012', 2, NULL, NULL, NULL),
(5, 'Charlie', 'Brown', 'Johnson', '5678901', 'charlie123', 'password345', 2, NULL, NULL, NULL),
(6, 'Dave', 'White', 'Brown', '6789012', 'dave123', 'password678', 2, NULL, NULL, NULL),
(7, 'Eve', 'Black', 'White', '7890123', 'eve123', 'password901', 2, NULL, NULL, NULL),
(8, 'Frank', 'Green', 'Black', '8901234', 'frank123', 'password234', 2, NULL, NULL, NULL),
(9, 'Grace', 'Blue', 'Green', '9012345', 'grace123', 'password567', 2, NULL, NULL, NULL),
(10, 'Heidi', 'Red', 'Blue', '123456', 'heidi123', 'password890', 2, NULL, NULL, NULL),
(11, 'Kirill', 'Bon', 'Vlad', '891423952315', '123123123', '$2y$12$cCzlksQE7/t9VMQcKduLjOof2xu4whJgmPoD45yaDyUJrVtM9aXS6', 2, NULL, '2024-06-13 13:00:16', '2024-06-13 13:00:16'),
(12, 'Kirill2', 'Bon2', 'Vlad2', '8914239523152', '1231231232', '$2y$12$9QYL6rFnOAWSLfbtHxToeu45lRUNejRZ5zvyfM590EwDcuEtR8LDK', 2, NULL, '2024-06-13 13:58:55', '2024-06-13 13:58:55'),
(13, 'Kirill23', 'Bon23', 'Vlad23', '89142395231234', '12312312323', '$2y$12$awDI/BSt2gTAglySj6CTCesb3zejrq1JLeLs8TqPil09yxtUNefLu', 2, NULL, '2024-06-13 14:02:17', '2024-06-13 14:02:17');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_type_category_id_foreign` (`type_category_id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `type_categories`
--
ALTER TABLE `type_categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phone_number_unique` (`phone_number`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `type_categories`
--
ALTER TABLE `type_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_type_category_id_foreign` FOREIGN KEY (`type_category_id`) REFERENCES `type_categories` (`id`);

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
