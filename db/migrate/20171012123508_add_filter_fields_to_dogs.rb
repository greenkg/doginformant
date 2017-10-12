class AddFilterFieldsToDogs < ActiveRecord::Migration[5.1]
  def change
    add_column :dogs, :dog_size, :string
  end
end
