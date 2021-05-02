module Sessions
  class SynchroniseProfile

    def initialize(params)
      @profile = params[:profile]
      @user = params[:user]
    end

    def call
      return nil unless @profile && @user

      @user.first_name = @profile.first_name
      @user.last_name = @profile.last_name

      @user.save!
    end
  end
end
