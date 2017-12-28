class TalentsController < ApplicationController
  def new
    @talent = Talent.new
  end

  def create
    @talent = Talent.new(talent_params)
    @talent.user = current_user

    if @talent.save
      redirect_to profile_path
    else
      render 'new'
    end
  end

  def show
    @talent = Talent.find(params[:id])
    @recipient = @talent.user
    @category = Category.new
  end

  def edit
    @talent = current_user.talents.find(params[:id])
  end

  def update
    @talent = current_user.talents.find(params[:id])
    if @talent.update(talent_params)
      redirect_to talent_path
    else
      render 'edit'
    end
  end

  def index
    @talents = Talent.where.not(user: current_user)
    @category = Category.find(params[:category_id]) if params[:category_id].present?
    @query = params[:query]
    @categories = Category.all

    if params[:category_id].present?
      category = Category.find(params[:category_id])
      @talents = @talents.where(category: category)
    end

    if params[:query].present?
#      @talents = @talents.where("talent_proposed ilike ?", "%#{params[:query]}%")
      @talents = @talents.global_search params[:query]
    end
  end

  private

  def talent_params
    params.require(:talent).permit(:category_id, :talent_proposed, :description, :lesson)
  end
end
