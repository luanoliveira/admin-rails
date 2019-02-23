class ApplicationController < ActionController::Base
    before_action :ui
    include UsersHelper

    def dashboard
        @ui.page_title = 'Dashboard'
        render 'admin/dashboard'
    end

    protected
    def add_message(type, message)
        flash[type] = message
    end

    def add_message_now(type, message)
        flash.now[type] = message
    end

    private
    def ui
        @ui = Admin::Ui.new

        @ui.project_name = 'App'

        @ui.add_menu('dashboard', 'Dashboard', dashboard_path)
        @ui.add_menu('teste', 'Teste')
        @ui.add_menu('operadores', 'Operadores', operadores_path)

        puts @ui.menu
    end
end
