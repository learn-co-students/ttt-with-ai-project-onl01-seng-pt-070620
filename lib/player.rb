class Player

    attr_reader :token, :game

    def initialize(token)
        # self.token = token
        @token = token
    end 

    # def token=(token)
    #     if @token != nil
    #         raise NoMethodError #< Exception
    #         self.respond_to?(@token)
    #     end 
    # end 


    # does not work
    # begin
    #     @token != nil
    # rescue NoMethodError < Exception
    #     raise NoMethodError
    # end 

    # def token
    #     if @token != nil
    #         raise NoMethodError
    #     end 
    # end 

end 