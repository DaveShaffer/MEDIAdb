class AddUserRefToDvd < ActiveRecord::Migration
  def change
    add_reference :dvds, :user, index: true, foreign_key: true
  end
end
