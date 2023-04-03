# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def new 
    @referred_by_id = referrer.id if (params[:referral_code].present? && referrer.present?)
    super
  end

  private

    def referrer 
      User.find_by(referral_code: params[:referral_code])
    end
end
