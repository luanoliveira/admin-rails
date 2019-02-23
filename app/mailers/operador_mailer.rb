class OperadorMailer < ApplicationMailer

    def welcome
        mail(to: 'luanconecte@gmail.com', subject: 'Teste')
    end

end
