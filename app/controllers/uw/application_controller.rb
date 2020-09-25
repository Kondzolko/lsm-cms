class Uw::ApplicationController < ActionController::Base
  before_action :authenticate_underwriter!
  include Pundit
  include Crud

  private

  def authorize(record, query = nil)
    super((user_namespace << record).flatten, query)
  end

  def permitted_attributes(record, action = action_name)
    super((user_namespace << record).flatten, action)
  end

  def pundit_user
    current_underwriter
  end

  def user_namespace
    [:underwriter]
  end

  def namespaces
    [:uw]
  end
end
