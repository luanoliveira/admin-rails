class OperadoresController < ApplicationController

    def index
        # per_page = 2
        @per_page = 10

        if request.query_parameters.has_key? :page
            @page = request.query_parameters[:page].to_i
        else
            @page = 1
        end

        @data_total = Operador.count(:id)
        @data_pages = @data_total/@per_page
        @data = Operador.limit(@per_page).offset((@page-1)*@per_page)
    end

    def create
        @operador = Operador.new

        if request.post?
            @operador.attributes = params.require(:operador).permit(:nome, :email, :atendimentos_attributes => [:tempo])
            @operador.save
        end
    end

    def update
        @operador = Operador.find(params[:id])

        if request.patch?
            @operador.attributes = params.require(:operador).permit(:nome, :email, :atendimentos_attributes => [:id, :tempo, :_destroy])
            @operador.save
        end
    end

end