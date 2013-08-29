class HomeController < ApplicationController

  def index
    @questions = Question.active.limit(10)
    @tags = Question.tag_counts_on(:tags).order('count desc').limit(10)
    @users = User.all.limit(10)
    #flash[:error] = "Error error error"
    #flash[:notice] = "Notice notice notice"
    #flash[:success] = "Success success success"
    #flash[:warning] = "Warning warning warning"
  end

  def tags
    @tags = Question.tag_counts_on(:tags).order('count desc').page(params[:page]).per(60)
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
