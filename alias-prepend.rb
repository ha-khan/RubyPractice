module HttpRetryWrapper
    def Get(url)
        puts "Invoking GET with Retry"
        super
    end
end

class HttpClient
    def Get(url)
        puts "GET #{url}"
    end
end

HttpClient.prepend(HttpRetryWrapper)

class HttpClient

    alias_method :GetNotInstrumented, :Get
    
    def GetInstrumented(url)
        puts "Time before GET: "
        GetNotInstrumented(url)
        puts "Time after GET: "
    end

    alias_method :Get, :GetInstrumented  
end



c = HttpClient.new

c.Get("google.com")