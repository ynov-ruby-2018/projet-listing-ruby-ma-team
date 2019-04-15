class AddAnnoucementToMessage < ActiveRecord::Migration[5.2]
  def change
    add_reference :index, :announcement, foreign_key: true
  end
end
