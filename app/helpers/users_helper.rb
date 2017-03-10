module UsersHelper
    def job_title_icon
        if @user.profile.job_title == "Entwickler"
            "<i class='fa fa-code'></i>".html_safe
        elsif @user.profile.job_title == "Student"
            "<i class='fa fa-weixin'></i>".html_safe
        elsif @user.profile.job_title == "Animiations-Spezialist"
            "<i class='fa fa-camera'></i>".html_safe
        elsif @user.profile.job_title == "Autofahrer"
            "<i class='fa fa-car'></i>".html_safe
        elsif @user.profile.job_title == "Radiergummi"
            "<i class='fa fa-eraser'></i>".html_safe
        end
        
    end
end