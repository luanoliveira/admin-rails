class Operador < ApplicationRecord
    self.table_name = "operadores"
    has_many :atendimentos, class_name: "OperadorAtendimento",
                            foreign_key: "operador_id"
    accepts_nested_attributes_for :atendimentos, allow_destroy: true
end