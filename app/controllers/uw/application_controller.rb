class Uw::ApplicationController < ActionController::Base
  before_action :authenticate_underwriter!
  include Pundit
end
