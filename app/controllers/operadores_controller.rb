class OperadoresController < ApplicationController

    def index
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