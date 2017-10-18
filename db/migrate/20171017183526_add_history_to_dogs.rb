class AddHistoryToDogs < ActiveRecord::Migration[5.1]
  def change
    add_column :dogs, :history, :text
  end
end
