class JobA
  include Sidekiq::Job

  def perform
    puts "hello world #{Time.now}"
  end
end