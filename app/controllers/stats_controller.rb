class StatsController < AuthBase

    def show

       @data= Patient.where(:user_id=>current_user && current_user.id).select("Count(*) as patient_count ,date(appointment_date) as days ").group("date(appointment_date)")
       @graph_var=format_points(@data)
    end 

    private

    def format_points(data)
        label=[]
        points=[]
        data.each do |item| 
            label.push(item.days.to_s)
            points.push(item.patient_count)
        end
        
        {
            label: label,
            patient_count: points 
        }

    end
    
end
