class CellPhonesController <ApplicationController
  def index
    @cell_phones = CellPhone.all
  end

  def new
    @cell_phone = CellPhone.new
  end

  def create
    @cell_phone = CellPhone.new(cell_phone_params)

    if @cell_phone.save
      flash[:accepted] = "New cell phone added."
      redirect_to cell_phones_path(@cell_phones)
    else
      flash[:errors] = @cell_phone.errors.full_messages.join(". ")
      redirect_to new_cell_phone_path(@cell_phones)
    end
	end

  private

  def cell_phone_params
    params.require(:cell_phone).permit(:manufacturer_id, :year, :battery_life)
  end
end
