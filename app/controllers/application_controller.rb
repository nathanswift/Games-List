class ApplicationController < ActionController::Base
    def render_error(model)
        render json: { errors: model.errors.full_messages.join(',') }, status: 422
    end
end
