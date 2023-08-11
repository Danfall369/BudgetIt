class ServicesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @services = current_user.services.includes(:bills)
  end

  def show
    @service = Service.includes(:author).find(params[:id])
  end

  def new
    @service = Service.new
  end

  def edit; end

  def create
    @service = current_user.services.new(service_params)
    if @service.save
      redirect_to services_path(current_user.id), notice: 'Service was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @service.update(service_params)
      redirect_to services_path(current_user.id), notice: 'Service was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @service.destroy

    redirect_to services_url, notice: 'Service and associated bills were successfully destroyed.'
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name, :icon)
  end
end
