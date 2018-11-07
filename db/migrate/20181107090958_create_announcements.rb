class CreateAnnouncements < ActiveRecord::Migration[5.2]
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :description
      t.numeric :price
      t.string :picture

      t.timestamps
    end
  end
end
