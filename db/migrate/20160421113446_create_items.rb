class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :user
      t.string :type, null: false
      t.text :description
      t.string :url
      t.string :source

      t.timestamps null: false
    end
  end
end
