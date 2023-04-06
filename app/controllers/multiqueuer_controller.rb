class MultiqueuerController < ApplicationController

  def index
    @message = "So many queues!"
  end

  def queue
    puts "do the queue stuff"
    redirect_to "/"
  end

end