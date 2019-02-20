class OperadoresController < ApplicationController

    def index
        @per_page = 10
        @page = 1

        if request.query_parameters.has_key? :page
            request_page = request.query_parameters[:page].to_i
            if request_page > 1
                @page = request_page
            end 
        end

        @data_total = query.count(:id)
        @data_pages = @data_total/@per_page
        @data = query.limit(@per_page).offset((@page-1)*@per_page)
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

    protected
    def query
        @termo = nil

        if request.query_parameters.has_key? :buscar
            if request.query_parameters[:buscar].has_key? :termo
                @termo = request.query_parameters[:buscar][:termo]
            end
        end

        q = Operador.where("email LIKE ?", "%#{@termo}%")
        q
    end
end