class UsersController < ApplicationController
  skip_before_action :loggin_user, only: [:register,:login]
  def register
  end

  def login
  end
end
