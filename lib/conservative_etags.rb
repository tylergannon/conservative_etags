require "conservative_etags/engine"

module ConservativeEtags
  module ApplicationControllerExtension
    extend ActiveSupport::Concern

    included do
      before_action :set_session_start, :set_last_modified
    end

    def set_session_start
      unless session.key? :start_time
        session[:start_time] = Time.zone.now.iso8601
      end
      @session_start_time = Time.zone.parse(session[:start_time])
    end

    def set_last_modified
      app_start_time = Rails.application.config.x.app_start_time
      if app_start_time.present?
        @app_modified = [app_start_time, @session_start_time].max
      else
        @app_modified = Time.zone.now
      end
    end

    def conservative_stale?(*args)
      args << @app_modified
      if stale? etag: args
        true
      else
        false
      end
    end

  end


end
