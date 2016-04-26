class CreateDvds < ActiveRecord::Migration
  def change
    create_table :dvds do |t|
      t.string :format, null: false

      t.timestamps null: false
    end
  end
end
