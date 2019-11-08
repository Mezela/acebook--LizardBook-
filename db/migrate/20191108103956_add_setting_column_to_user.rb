class AddSettingColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :font_family, :string, :default => "Arial"
    add_column :users, :background_colour, :string, :default => "grey"
  end
end
