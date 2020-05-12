class SectionsController < ApplicationController
  layout 'admin'
  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
    @section_count = Section.count + 1
    @pages = Page.sorted
  end

  def create
    #instantiate new object using form parameters
    @section = Section.new(section_params)
    #save object
    if @section.save
      #if save succeeds, redirect to index action
      flash[:notice] = "Section created successfully"
      redirect_to(sections_path)
    else
      #if save fails, redisplay form so user can fix problems
      @section_count = Section.count + 1
      @pages = Page.sorted
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
    @section_count = Section.count
    @pages = Page.sorted
  end

  def update
    # Find the object using form parameters
    @section = Section.find(params[:id])
    #update the object
    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully"
      #if save succeeds, redirect to index action
      redirect_to(section_path(@section))
    else
      #if save fails, redisplay form so user can fix problems
      @section_count = Section.count
      @subjects = Subject.sorted
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Section '#{@section.name}' destroyed successfully"
    redirect_to(sections_path)
  end

  private
  def section_params
    params.require(:section).permit(:name, :page_id, :position, :visible, :content_type, :content)
  end
end
