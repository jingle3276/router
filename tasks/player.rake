namespace :player do

    desc "echo"
    task :echo do
        notice "Hello"
    end

    desc "run ls in parent"
    task :run do
        command_in_dir "../" do
            sh("ls")
        end
    end

end
