class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :code, limit: 10
      t.text :target

      t.timestamps
    end

    add_index :urls, :code
  end
end
