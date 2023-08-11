class BillsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bill, only: %i[show edit update destroy]
  load_and_authorize_resource

  def index
    @bills = Bill.includes(:services)
  end
end
