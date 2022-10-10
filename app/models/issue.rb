class Issue < ActiveRecord::Base
  has_many :events, class_name: 'Issue', foreign_key: 'issue_id'
end
