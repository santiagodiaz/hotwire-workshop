# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :skip_authorization, :skip_policy_scope, only: :show

  def show
    redirect_to root_path
  end
end
