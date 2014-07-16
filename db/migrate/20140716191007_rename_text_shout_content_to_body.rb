class RenameTextShoutContentToBody < ActiveRecord::Migration
  def change
    rename_column :text_shouts, :content, :body
  end
end
