require "rails_helper"

RSpec.describe Operador, :type => :model do
    context "criar operador" do
        it "criar operador válido" do
            operador = Operador.new
            operador.nome = "Luan Oliveira"
            operador.email = "luanconecte@gmail.com"
            atendimento = OperadorAtendimento.new
            operador.atendimentos << atendimento
            expect(operador.save).to be_truthy
        end
    end
end