class BadController < ApplicationController
    def index
        puts 'badd controller!'
        BadWorker.perform_async
    end
end
