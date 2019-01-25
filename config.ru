# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
ActionCable.server.config.allowed_request_origins = ['http://localhost:3001', 'http://10.185.0.217:3001']
run Rails.application
