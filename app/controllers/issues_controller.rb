# frozen_string_literal: true

class IssuesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    issue = params[:issue]
    issue = Issue.create(action: issue[:action], issue_id: issue[:issue_id], created_at: issue[:created_at])
    head issue.persisted? ? 200 : 400
  end

  def show
    issue = Issue.find(params[:id])
    render json: { "issue": issue, "events": issue.events }
  end

  def index
    render json: Issue.all.order(created_at: :asc).to_json
  end
end
