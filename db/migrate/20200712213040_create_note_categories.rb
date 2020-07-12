class CreateNoteCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :note_categories do |t|
    	t.integer :note_id
    	t.integer :category_id
    end
  end
end
