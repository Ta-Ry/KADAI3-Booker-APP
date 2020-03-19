class SearchController < ApplicationController

	def search
    #Viewのformで取得したパラメータをモデルに渡す
    	@range = params[:range]
    	method = params[:search_method]
        search = params[:search_search]
        @books = Book.search(method,search)
    	@users = User.search(method,search)
	end
end
