module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    private

    def respond_with(_resource, _options = {})
      register_success && return if resource.persisted?
    end

    def register_success
      render json: {
        message: 'Signed up successfully',
        user: current_user
      }, status: :ok
    end

    def register_failed
      render json: { message: 'Sign up failed' }, status: :unprocessable_entity
    end
  end
end
