class ApplicationController < ActionController::API
    before_action :authorized
    include ActionController::Cookies
    rescue_from ActiveRecord::RecordInvalid, with: :validation_errors
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    wrap_parameters format: []

    private

    def validation_errors(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

    def not_found
        render json: { error: "#{controller_name.classify} not found "}, status: :not_found
    end

    def authorized
        render json: {error: "Unauthorized"}, status: :unauthorized
    end
end
