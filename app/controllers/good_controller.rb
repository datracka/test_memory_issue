class GoodController < ApplicationController
    def index
        puts 'good controller!'
        GoodWorker.perform_async
    end
end
