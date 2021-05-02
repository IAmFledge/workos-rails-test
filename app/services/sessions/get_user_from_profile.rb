module Sessions
  class GetUserFromProfile

    def initialize(params)
      @profile = params[:profile]
    end

    def call
      return nil unless @profile

      User.first_or_create! do |user|
        user.email = @profile.email
      end
    end
  end
end
