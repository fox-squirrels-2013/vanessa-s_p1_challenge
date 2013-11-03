class NotesCreate < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :notetext
      t.references :user, index: true

      t.timestamps
    end
  end
end
