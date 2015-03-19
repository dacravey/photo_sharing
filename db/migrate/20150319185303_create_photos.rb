class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.column :name, :string
      t.column :caption, :string

      t.timestamps
    end
  end
end
