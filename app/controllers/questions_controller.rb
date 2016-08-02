class QuestionsController < ApplicationController

  def menu
    
  end

  def index

    @questions = Question.all

  end

  def new
   p @question = Question.new
  end

  def create
   
    p "**" * 100
    p question_val = params[:question][:question]
    new_question = Question.new(question: question_val, vote_like: 0, vote_dislike: 0)
    new_question.save
    @questions = Question.all

    render 'index'
    



  end

end
