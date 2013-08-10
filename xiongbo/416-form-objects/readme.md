# rails casts practice -416 Form objects
_based on rails 4.0 and ruby 2.0_

## why
this is mostly used in forms that help to separate different concerns within one model, or combine dirrerent concerns into one model

## how
viewmodel like .net mvc

1. first, we should create view_models for different concerns
2. second, we add view_model controller to deal with 
3. third, we create new view to adapter view_model
4. there are two types of form_objects. one is separate one model to more than one part view_models; another is combine more than one models into one view_model;
5. in combine view_model, we should use delegate to call the method on different models

## different from the casts
1. in password_form.rb#submit, should add `@user.password_confirmation = new_password`
2. in user_controller 
  
  def params_signup_form
    params.require(:signup_form).permit(:username, :email, :password, :password_confirmation,
                                        :twitter_name, :github_name, :bio)
  end

## pay attentions to

    def self.model_name
      ActiveModel::Name.new(self,nil, "User")
    end

    user.attributes = params.slice(:username, :email, :password, :password_confirmation)
  
    def generate_token
      begin
        user.token = SecureRandom.hex
    end while User.exists?(token: user.token)

    # you should write custom validate for uniqueness, 
    # because ActiveModel does not support validates_uniqueness_fo currently
    def verify_unique_username
      if User.exists? username: username
        errors.add :username, "has already been taken"
      end
    end
  
    # in password_form, you should write validate for password by calling the authenticate method 
    # which has_secure_password has provided
    def verify_original_password
      unless @user.authenticate(original_password)
        errors.add :original_password, "is not correct"
      end
    end



