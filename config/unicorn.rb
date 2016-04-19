listen "unix:/var/run/graffitistudio.sock"
worker_processes 1
preload_app true
user "rails"
working_directory "/home/rails/graffitistudio/current"
pid "/var/run/graffitistudio.pid"
stderr_path "/var/log/unicorn/graffitistudio.log"
stdout_path "/var/log/unicorn/graffitistudio.log"
