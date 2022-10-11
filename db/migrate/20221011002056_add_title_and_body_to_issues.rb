class AddTitleAndBodyToIssues < ActiveRecord::Migration[7.0]
  def change
    add_column :issues, :title, :string
    add_column :issues, :body, :string
  end
end
