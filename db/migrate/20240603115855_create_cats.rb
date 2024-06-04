class CreateCats < ActiveRecord::Migration[7.1]
  def change
    create_table :cats do |t|
      t.string :name  # Добавляем столбец для имени кошки
      t.string :path  # Добавляем столбец для имени кошки
      t.references :breed, foreign_key: true  # Добавляем столбец для связи с породой кошки
      t.timestamps
    end
  end
end
