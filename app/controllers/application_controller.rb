class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!, except: [:top]
    
    def after_sign_in_path_for(resource)
        # ログインを実行したモデル（User)のデータのインスタンスが格納されている→どのuserなのか、定義を行わなくても引数でとってきてくれるということ（と思われる）（アプリ2第7章参照）
        post_images_path
    end 
    
    def after_sign_out_path_for(resource)
        about_path
    end 
        
        
    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end 
end
