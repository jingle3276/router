#
# 
#
#require 'find'
# Global variables

require 'rake'

# Load other rake tasks
Dir.glob('tasks/*.rake') {|f| load(f) }


#-----------------------------------------------------
# Helper methods
#-----------------------------------------------------
def highlight(message, length=nil)
    stars = '*' * ((length or message.length) + 4)
    lines = ["", stars, "* #{message} *", stars, "", ""]
    return lines.join("\n")
end

def notice(message)
    puts highlight(message)
end

def command_in_dir(dir)
    puts "running in #{dir}"
    cur_dir = pwd()
    cd(dir)
    yield
ensure
    cd(cur_dir)
end
