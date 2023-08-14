class BillsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @bills = current_user.bills.includes(:service)
  end

  def show
    @bill = Bill.includes(:author).find(params[:id])
  end

  def new
    @bill = Bill.new
    @services = Service.all
  end

  def edit; end

  def create
    @bill = current_user.bills.new(bill_params)

    if @bill.save
      redirect_to service_path(@bill.service_id), notice: 'Bill was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @bill.update(bill_params)
      redirect_to service_path(@bill.service_id), notice: 'Bill was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bill.destroy

    redirect_to bills_url, notice: 'Bill was successfully destroyed.'
  end

  private

  def bill_params
    params.require(:bill).permit(:service_id, :name, :amount)
  end
end
