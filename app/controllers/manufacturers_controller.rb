class ManufacturersController <ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      flash[:accepted] = "New manufacturer added."
      redirect_to manufacturers_path(@manufacturers)
    else
      flash[:errors] = @manufacturer.errors.full_messages.join(". ")
      redirect_to new_manufacturer_path(@manufacturers)
    end
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end
end
