Admin.controllers :entries do

  get :index do
    params[:offset] ||= 0
    @offset = params[:offset].to_i
    @offset = 0 if @offset < 0
    @entries = Entry.all(:limit => 10, :offset => @offset)
    render 'entries/index'
  end

  get :new do
    @entry = Entry.new
    render 'entries/new'
  end

  post :create do
    @entry = Entry.new(params[:entry])
    if @entry.save
      flash[:notice] = 'Entry was successfully created.'
      redirect url(:entries, :edit, :id => @entry.id)
    else
      render 'entries/new'
    end
  end

  get :edit, :with => :id do
    @entry = Entry.get(params[:id])
    render 'entries/edit'
  end

  put :update, :with => :id do
    @entry = Entry.get(params[:id])
    if @entry.update(params[:entry])
      flash[:notice] = 'Entry was successfully updated.'
      redirect url(:entries, :edit, :id => @entry.id)
    else
      render 'entries/edit'
    end
  end

  delete :destroy, :with => :id do
    entry = Entry.get(params[:id])
    if entry.destroy
      flash[:notice] = 'Entry was successfully destroyed.'
    else
      flash[:error] = 'Impossible destroy Entry!'
    end
    redirect url(:entries, :index)
  end
end
