class AddIntroductionToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :Users, :introduction, :text
  end
end
