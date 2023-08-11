class ServicesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_service, only: %i[show edit update destroy]

  def index
    @services = current_user.services.includes(:bills)
  end
end
