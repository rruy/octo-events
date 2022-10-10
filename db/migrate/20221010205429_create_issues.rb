class CreateIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :issues do |t|
      t.string :action, null: false
      t.belongs_to :issue, class_name: 'Issue', index: true, foreign_key: 'issue_id'
      t.timestamps null: false
    end
  end
end
