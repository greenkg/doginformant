class CreateDogs < ActiveRecord::Migration[5.1]
  def change
    create_table :dogs do |t|
      t.string :breed
      t.string :breed_group
      t.text :breed_summary
      t.string :image_file_name
      t.decimal :height_min
      t.decimal :height_max
      t.decimal :weight_min
      t.decimal :weight_max
      t.integer :life_min
      t.integer :life_max
      t.integer :affectionate
      t.integer :kid_friendly
      t.integer :stranger_friendly
      t.integer :trainability
      t.integer :energy_level
      t.boolean :shedding
      t.integer :popularity_rank

      t.timestamps
    end
  end
end
