# Class definition that exists in core code/gem
class HttpClient
    def Get(url)
        puts "GET #{url}"
    end
end

# Another gem or client code tries to decorate the core code with retry capability
# Done using module#prepend
module HttpRetryWrapper
    def Get(url)
        puts "Invoking GET with Retry"
        super
    end
end

# In method resolution chain the following would be called in order after mixin (prepend) is executed:
# 1. module.HttpRetryWrapper.Get
# 2. class.HttpClient.Get
HttpClient.prepend(HttpRetryWrapper)


# HttpClient redefinition will instrument (decorate) the core code, which at this moment in runtime 
# has already been decorated by the module.HttpRetryWrapper with prepend,
# This instrumentation code uses alias_method rather than module#prepend to accomplish that
class HttpClient
    alias_method :GetNotInstrumented, :Get
    
    def GetInstrumented(url)
        puts "Starting span GET"
        GetNotInstrumented(url)
        puts "Ending span GET"
    end

    alias_method :Get, :GetInstrumented  
end



c = HttpClient.new

c.Get("google.com")