# frozen_string_literal: true

class IssuesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    if params['payload'].class == ActionController::Parameters
      payload = params['payload']
    else
      payload = JSON.parse(params['payload'])
    end

    issue = Issue.create(action: payload['action'],
                         external_id: payload['issue']['id'],
                         title: payload['issue']['title'],
                         body: payload['issue']['body'],
                         created_at: payload['issue']['created_at'])

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
