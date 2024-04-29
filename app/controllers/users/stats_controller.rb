class StatsController < ApplicationController

    def yearly_chart
        data= Patient.where('created_at ')
        cordinate_generator(data)
        
    end




    private 

    def cordinate_generator(data)

    end


end