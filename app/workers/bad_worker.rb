
class BadWorker
    include Sidekiq::Worker
    sidekiq_options retry: false
    
    def perform
        GC.start
        before = GC.stat(:total_freed_objects)

        retained= []
        100_000.times do
            retained << Article.new
        end

        GC.start
        after = GC.stat(:total_freed_objects)
        puts 'created 10k Articles'
        puts "Objects Freed: #{after - before}"
    end
end