class MultiqueuerController < ApplicationController

  def index
    @message = "So many queues!"
  end

  def queue
    puts "do the queue stuff"

    queue = params["queue"]

    JobA.set({ queue: queue }).perform_async

    redirect_to "/"
  end

end