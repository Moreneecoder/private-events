class AddDescriptionToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :description, :text, first: true
  end
end
