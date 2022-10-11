class AddExternalIdToIssues < ActiveRecord::Migration[7.0]
  def change
    add_column :issues, :external_id, :bitint
  end
end
