class HomeController < ApplicationController

  def index
    @questions = Question.active
    #flash[:error] = "Error error error"
    #flash[:notice] = "Notice notice notice"
    #flash[:success] = "Success success success"
    #flash[:warning] = "Warning warning warning"
  end

  def tags
    @tags = Question.tag_counts_on(:tags).order('count desc')
    if params[:tag_q]
      @tags = @tags.where('name LIKE ?', "%#{params[:tag_q]}%")
    end
  end

  def about

  end

  def contact

  end

  def help

  end

end
