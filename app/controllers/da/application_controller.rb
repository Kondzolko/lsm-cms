class Da::ApplicationController < ActionController::Base
  before_action :authenticate_deligated_authority!
  include Pundit
end
