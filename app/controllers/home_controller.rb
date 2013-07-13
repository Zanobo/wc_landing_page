class HomeController < ApplicationController

  def index

  end

  def sign_up

    @user = User.new(email: params[:email])


    if @user.save then
      @notice = "Thanks! We'll keep you in the loop."
    else
      @notice = "Oops! We had trouble saving your email."
    end


  end

  def submit_details

    @user = User.find_by_email(params[:email])

    if params.has_key? :use_cases then
      use_cases = (params[:use_cases] - ['other_option']).join(',')

      if params[:use_cases].include?('other_option') &&
          params.has_key?(:other_option_response) &&
          params[:other_option_response].present? then
        use_cases << ',' + params[:other_option_response]
      end

    end

    @user.update_attributes(
        use_cases: use_cases,
        company_name: params[:company_name],
        market_participation: params[:participant_size],
        referral_mechanism: params[:referral_mechanism],
    )

    if @user.save then
      @notice = "Thanks, your input is greatly appreciated."
    else
      @notice = "Oops! We had trouble saving your responses."
    end



  end


end