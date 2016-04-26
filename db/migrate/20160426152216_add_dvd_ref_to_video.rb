class AddDvdRefToVideo < ActiveRecord::Migration
  def change
    add_reference :videos, :dvd, index: true, foreign_key: true
  end
end
