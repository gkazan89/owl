class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :category_id
      t.string :headline
      t.datetime :date
      t.string :link

      t.timestamps
    end
  end
end
