require_relative '../test_helper'
require 'pry'

class IssuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @issue = create(:issue)
    @issue_event = create(:issue, :issue_event)
    @issue.events << @issue_event
  end

  test 'Should return issue by id' do
    get events_issues_path(1)
    issue = JSON.parse(response.body)

    assert_response 200
    assert_equal @issue.id, issue['issue']['id']
  end

  test 'Should return issue with events' do
    issue_id = 1

    get events_issues_path(issue_id)
    issue = JSON.parse(response.body)

    assert_response 200
    assert_equal issue_id, issue['issue']['id']
    assert_equal issue_id, issue['events'][0]['issue_id']
  end

  test 'Shoud return all issue persited in DB' do
    get issues_path
    issue = JSON.parse(response.body)

    assert_response 200
    assert_equal 2, issue.size
  end

  test 'Shoud create new issue when passed correct params' do
    payload = { "payload":
                { "action": "opened",
                  "issue": {
                     "title": "Testing register new issue",
                     "body": "Body of new issue",
                     "created_at": DateTime.now
                  }
                }
            }

    post new_issues_path(payload)
    assert_response(:success)
  end
end
