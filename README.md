# Dynamically Set Sidekiq Queues

During my collaboration with teams using Sidekiq I was told that a `Sidekiq::Job`'s queue had to be statically set, 
that there was no way to adjust this at run time. This repository shows how to perform such actions.

![demo](./example.gif)

To run this locally:

1. Start redis: 
```
docker-compose up -d
```
2. Run this first  queue in a terminal:
```
bundle exec sidekiq -q groupone
```
3. Then another terminal to run

```
bundle exec sidekiq -q groupone
```

4. run rails in a third terminal:
```
bin/rails server
```

## Q: Should I do this all the time?

No, this is not a feature you should use all the time. However, it's important to learn the features and abilities of 
the libraries and tools your system uses.

## Q: When might this be useful?

In cases where a the scope of a `Sidekiq::Job` has grown too much that you may have a variety of tasks handled by the 
same class. If technical debt makes it difficult to split those responsibilities to different `Sidekiq::Job`s then 
you may wish to dynamically send different instances of the same `Job` to different queues. Each queue can then be 
served by different pools of workers.

## Q: Why don't you use ActiveJob here? 

ActiveJob is a Ruby on Rails specific tool. Sidekiq supports ActiveJob but does not require it. There are many 
places that use Sidekiq but not Rails nor ActiveJob. You should be to do the same thing by modifying `job.queue_name`,
which is what the `ActivevJob::QueueAdapters::SidekiqAdapater` uses to 
[set the Sidekiq queue](https://github.com/rails/rails/blob/444df0eee1b537ecaa11509e819b071d4e87b519/activejob/lib/active_job/queue_adapters/sidekiq_adapter.rb#L24).

The focus of this demo is Sidekiq not Rails. This PoC uses Rails as the simplest way to get an interactive demo working.
