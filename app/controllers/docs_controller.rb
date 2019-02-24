class DocsController < ApplicationController

    def index
       path = Rails.root.join("public", "docs", "*")
       @docs = Dir.glob(path)
    end

    def create
        DocJob.perform_later        
        redirect_to docs_path
    end

end