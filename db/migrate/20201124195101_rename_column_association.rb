class RenameColumnAssociation < ActiveRecord::Migration[6.0]
  def change
    rename_column :missions, :association, :asso
  end
end
