class DemoController < ApplicationController
  def index
  end
  def hello
    @id = params[:id]
    @page = params[:page]
    @array=[1,2,3,4,5]
  end

  def other_hello
      redirect_to(:action => 'index')
  end

  def lynda
    redirect_to('http://lynda.com')
  end

end
