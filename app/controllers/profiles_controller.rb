class ProfilesController < ApplicationController

  def show
    @talents = current_user.talents
  end

end
