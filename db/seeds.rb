# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Очищаем данные перед заполнением
User.destroy_all
Category.destroy_all
Product.destroy_all
Order.destroy_all
OrderItem.destroy_all

# Создаём пользователей
users = User.create([
                      { name: "Иван", email: "ivan@example.com" },
                      { name: "Мария", email: "maria@example.com" }
                    ])

# Создаём категории
categories = Category.create([
                               { name: "Электроника" },
                               { name: "Книги" }
                             ])

# Создаём товары
products = Product.create([
                            { name: "Ноутбук", price: 50000, category: categories[0] },
                            { name: "Книга 'Ruby on Rails'", price: 1500, category: categories[1] }
                          ])

# Создаём заказы
orders = Order.create([
                        { user: users[0], status: "Оплачен" },
                        { user: users[1], status: "В обработке" }
                      ])

# Добавляем товары в заказы
OrderItem.create([
                   { order: orders[0], product: products[0], quantity: 1 },
                   { order: orders[1], product: products[1], quantity: 2 }
                 ])

puts "База данных заполнена!"