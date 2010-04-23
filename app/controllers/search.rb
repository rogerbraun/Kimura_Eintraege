Florenz.controllers :search do
  # get :index, :map => "/foo/bar" do
  #   session[:foo] = "bar"
  #   render 'index'
  # end
  
  get :index do
    if params[:q] then
      @results = Entry.all(:lemma.like => "#{params[:q]}%")
      if @results.empty? then
        flash.now[:notice] = "Nichts gefunden!" 
      end
    end
    render "search/index"
  end
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get "/example" do
  #   "Hello world!"
  # end

  
end
