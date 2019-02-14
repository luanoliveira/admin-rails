class ApplicationController < ActionController::Base
    before_action :ui
    include UsersHelper

    def dashboard
        @ui.page_title = 'Dashboard'
        render 'admin/dashboard'
    end

    private
    def ui
        @ui = Admin::Ui.new

        @ui.project_name = 'App'

        @ui.add_menu('dashboard', 'Dashboard', dashboard_path)
        @ui.add_menu('teste', 'Teste')

        puts @ui.menu
    end
end
